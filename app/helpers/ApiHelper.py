import json
import requests
from requests.auth import HTTPBasicAuth
from app.utils.Logger import Logger
import os
from app.scripts.commonDefinitions import APP_PATH

class ApiHelper:

    _successStatuses = [200, 201, 204]

    def __init__(self, config_path=os.path.join(APP_PATH, 'data', 'config.json')):
        self.config_path = config_path

    def get_endpoint(self, project, get_proxy_port=False):
        with open(self.config_path, 'r') as f:
            all_configs = json.load(f)
        config = all_configs[project]
        port = config['port']
        if get_proxy_port:
            port = config['proxyPort']
        return f"{config['protocol']}://{config['host']}{'' if port in [80, 443] else f':{port}'}"

    def _execute_api(self, response):
        return {
            'result': response.text,
            'status': response.status_code
        }

    def post(self, api_url, post_data, additional_headers=None, cookies=None):
        if additional_headers is None:
            additional_headers = {}
        if cookies is None:
            cookies = {}

        default_headers = {'Content-Type': 'application/json'}
        headers = {**default_headers, **additional_headers}

        is_basic_auth = additional_headers.get('isBasicAuth', False)
        username = additional_headers.get('username', '')
        password = additional_headers.get('password', '')
        if is_basic_auth:
            del headers['isBasicAuth']
            del headers['username']
            del headers['password']

        formatted_headers = [f"{key}: {value}" for key, value in headers.items()]
        formatted_payload = json.dumps(post_data, ensure_ascii=False)

        if headers['Content-Type'] == 'application/x-www-form-urlencoded':
            formatted_payload = '&'.join([f"{key}={value}" for key, value in post_data.items()])

        response = requests.post(api_url, headers=headers, data=formatted_payload, cookies=cookies,
                                 auth=HTTPBasicAuth(username, password) if is_basic_auth else None, timeout=30)

        result = self._execute_api(response)
        if self.is_error_status(result):
            # Log the error (Logger is assumed to be defined elsewhere)
            Logger.error('api_log', f"Error executing POST API.\nURL : {api_url}\nPayload : {json.dumps(post_data, indent=2)}\nHeaders : {json.dumps(headers, indent=2)}\nResponse : {result['result']}")
        return result

    def get(self, api_url, payload=None, additional_headers=None):
        if payload is None:
            payload = {}
        if additional_headers is None:
            additional_headers = {}

        default_headers = {}
        headers = {**default_headers, **additional_headers}
        is_basic_auth = additional_headers.get('isBasicAuth', False)
        username = additional_headers.get('username', '')
        password = additional_headers.get('password', '')
        if is_basic_auth:
            del headers['isBasicAuth']
            del headers['username']
            del headers['password']

        formatted_headers = [f"{key}: {value}" for key, value in headers.items()]

        response = requests.get(api_url, headers=headers, params=payload, auth=HTTPBasicAuth(username, password) if is_basic_auth else None, timeout=30)

        result = self._execute_api(response)
        if self.is_error_status(result):
            # Log the error
            Logger.error('api_log', f"Error executing GET API.\nURL : {api_url}\nHeaders : {json.dumps(formatted_headers, indent=2)}\nResponse : {result['result']}")
        return result

    def delete(self, api_url, additional_headers=None):
        if additional_headers is None:
            additional_headers = {}

        headers = {**additional_headers}
        formatted_headers = [f"{key}: {value}" for key, value in headers.items()]

        response = requests.delete(api_url, headers=headers, timeout=30)

        result = self._execute_api(response)
        if self.is_error_status(result):
            # Log the error
            Logger.error('api_log', f"Error executing DELETE API.\nURL : {api_url}\nHeaders : {json.dumps(headers, indent=2)}\nResponse : {result['result']}")
        return result

    def put(self, api_url, put_data, additional_headers=None):
        if additional_headers is None:
            additional_headers = {}

        default_headers = {'Content-Type': 'application/json'}
        headers = {**default_headers, **additional_headers}
        formatted_headers = [f"{key}: {value}" for key, value in headers.items()]

        response = requests.put(api_url, headers=headers, data=json.dumps(put_data, ensure_ascii=False), timeout=30)

        result = self._execute_api(response)
        if self.is_error_status(result):
            # Log the error
            Logger.error('api_log', f"Error executing PUT API.\nURL : {api_url}\nPayload : {json.dumps(put_data, indent=2)}\nHeaders : {json.dumps(formatted_headers, indent=2)}\nResponse : {result['result']}")
        return result

    def is_error_status(self, response):
        return response['status'] not in self._successStatuses
