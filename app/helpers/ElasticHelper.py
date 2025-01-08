import json
import os
import requests
from app.utils.Logger import Logger
from app.utils.Utils import replace_time_strings
from app.scripts.commonDefinitions import APP_PATH
from app.helpers.ApiHelper import ApiHelper

class ElasticHelper:
    def __init__(self):
        self._api_helper = ApiHelper()
        self._config = {
            'host': os.getenv('ELASTIC_IP'),
            'port': os.getenv('ELASTIC_PORT'),
            'protocol': os.getenv('ELASTIC_PROTOCOL')
        }

    def get_endpoint(self):
        return f"{self._config['protocol']}://{self._config['host']}:{self._config['port']}"

    def get_all_indices(self):
        url = f"{self.get_endpoint()}/_cat/indices?format=json"
        response = self._api_helper.get(url)
        return [index.get('index') for index in json.loads(response.get('result'))]

    def create_indices(self):
        config_content = self._load_config()
        for project, configs in config_content.items():
            if 'indices' in configs:
                indices = configs['indices']
                for index in indices:
                    self.create_index(index)

    def create_index(self, index):
        if index not in self.get_all_indices():
            template_path = f"{APP_PATH}/data/indices/{index}.json"
            if os.path.exists(template_path):
                with open(template_path, 'r') as template_file:
                    payload = json.load(template_file)
                url = f"{self.get_endpoint()}/{index}"
                self._api_helper.put(url, payload)

    def delete_indices(self):
        config_content = self._load_config()
        for project, configs in config_content.items():
            if 'indices' in configs:
                indices = configs['indices']
                for index in indices:
                    self.delete_index(index)

    def delete_index(self, index):
        if index in self.get_all_indices():
            url = f"{self.get_endpoint()}/{index}"
            self._api_helper.delete(url)

    def create_document(self, index, document):
        url = f"{self.get_endpoint()}/{index}/_doc/{document['id']}"
        response = self._api_helper.put(url, document)
        if response['status'] != 201:
            Logger.error('elastic', f"Error while inserting document. Payload: {json.dumps(document)}. Status: {response['status']}. Response: {response['result']}")

    def create_documents(self):
        config_content = self._load_config()
        for project, configs in config_content.items():
            if 'indices' in configs:
                indices = configs['indices']
                for index in indices:
                    index_path = f"{APP_PATH}/data/elasticDocuments/{index}"
                    if os.path.exists(index_path):
                        files = [f for f in os.listdir(index_path) if f not in ['.', '..']]
                        for file in files:
                            file_path = f"{index_path}/{file}"
                            with open(file_path, 'r') as doc_file:
                                document_string = doc_file.read()
                            document_string = replace_time_strings(document_string)
                            document = json.loads(document_string)
                            self.create_document(index, document)

    def get_row_values(self):
        row_values = {}
        config_content = self._load_config()
        for project, configs in config_content.items():
            if 'indices' in configs:
                indices = configs['indices']
                for index in indices:
                    url = f"{self.get_endpoint()}/{index}/_search"
                    payload = {
                        'query': {'match_all': {}},
                        'from': 0,
                        'size': 10000
                    }
                    response = self._api_helper.post(url, payload)
                    if response['status'] == 200:
                        json_data = json.loads(response['result'])
                        docs = json_data['hits']['hits']
                        documents = [doc['_source'] for doc in docs]
                        row_values[index] = documents
                    else:
                        Logger.error('elastic', f"Error while getting documents. Index: {index}")
        return row_values

    def get_row_counts(self):
        row_counts = {}
        config_content = self._load_config()
        for project, configs in config_content.items():
            if 'indices' in configs:
                indices = configs['indices']
                for index in indices:
                    url = f"{self.get_endpoint()}/{index}/_count"
                    response = self._api_helper.get(url)
                    if response['status'] == 200:
                        json_data = json.loads(response['result'])
                        count = json_data['count']
                        row_counts[index] = count
                    else:
                        Logger.error('elastic', f"Error while getting documents. Index: {index}")
        return row_counts

    def get_document(self, index_name, document_id):
        url = f"{self.get_endpoint()}/{index_name}/_doc/{document_id}"
        response = self._api_helper.get(url)
        document = {}
        if response['status'] == 200:
            document = json.loads(response['result'])['_source']
        return document

    def _load_config(self):
        with open(f"{APP_PATH}/data/config.json", 'r') as config_file:
            return json.load(config_file)
