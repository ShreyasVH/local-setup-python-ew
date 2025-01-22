import json
import os

from app.helpers.ApiHelper import ApiHelper
from app.helpers.PostgresHelper import PostgresHelper

class IamHelper:
    def __init__(self):
        self._api_helper = ApiHelper()

    def get_client_id(self, client_name):
        postgres_helper = PostgresHelper()
        query = f"SELECT id FROM iam_caccess WHERE name = '{client_name}'"
        rows = postgres_helper.select(query, os.getenv('POSTGRES_IAM_DB'))
        return rows[0]['id']

    def get_token(self, client_id):
        endpoint = self._api_helper.get_endpoint('iam')
        url = f"{endpoint}/v1/client"

        headers = {
            'X-IAM-Client-Id': str(client_id)
        }

        token = ''
        response = self._api_helper.get(url, {}, headers)

        if response['status'] == 200:
            token = json.loads(response['result'])['data']['authToken']

        return token

    def get_adherence(self, client_name, episode_id):
        endpoint = self._api_helper.get_endpoint('iam')
        url = f"{endpoint}/v1/adherence?entityId={episode_id}"

        client_id = self.get_client_id(client_name)
        headers = {
            'X-IAM-Client-Id': str(client_id),
            'X-IAM-Access-Token': self.get_token(client_id)
        }

        adherence_string = ''
        response = self._api_helper.get(url, {}, headers)
        if response['status'] == 200:
            adherence_string = json.loads(response['result'])['data']['adherenceString']

        return adherence_string
