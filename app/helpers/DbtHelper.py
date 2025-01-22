import json
import os
from app.utils.Logger import Logger
from app.helpers.ApiHelper import ApiHelper
from app.helpers.FileHelper import FileHelper
from app.utils.Utils import replace_time_strings, array2xml
from app.scripts.commonDefinitions import APP_PATH
from app.helpers.PostgresHelper import PostgresHelper
from app.helpers.MssqlHelper import MssqlHelper

class DbtHelper:
    def __init__(self):
        self._local_path = '/mnt/c/'
        self._remote_path = os.getenv('HOME') + '/Testing/CPSMS/0038/'
        self._beneficiary_request_source_folder = 'DBT_BENEFICIARY/'
        self._benefit_request_source_folder = 'DBT_BENEFIT/'
        self._beneficiary_response_destination_folder = 'DBT_BENEFICIARY_RESPONSE/'
        self._benefit_ack_destination_folder = 'DBT_BENEFIT_ACK/'
        self._benefit_status_destination_folder = 'DBT_BENEFIT_STATUS/'
        self._beneficiary_request_destination_folder = 'BeneficiaryData/ToCPSMS/'
        self._benefit_request_destination_folder = 'PaymentData/ToCPSMS/'
        self._beneficiary_response_source_folder = 'BeneficiaryData/FromCPSMS/'
        self._benefit_ack_source_folder = 'PaymentData/FromCPSMS/'
        self._benefit_status_source_folder = 'PaymentStatusData/FromCPSMS/'
        self._read_folder = 'read/'

    def add_files(self, add_prefix=True):
        config = json.load(open(os.path.join(APP_PATH, 'data', 'dbtData.json')))
        prefix = 'Z' if add_prefix else ''

        for request_object in config['beneficiaryRequests']:
            if not request_object['ignored']:
                xml_data = json.loads(replace_time_strings(json.dumps(request_object['data'])))
                source_extension = '.done' if request_object['uploadingDone'] else '.xml'
                file_name = prefix + replace_time_strings(request_object['data']['CstmrDtls']['GrpHdr']['MsgId'])
                source_path = os.path.join(self._local_path, self._beneficiary_request_source_folder,
                                           file_name + source_extension)
                array2xml(source_path, xml_data, request_object['rootElement'], request_object['namespaceUrl'])

                if request_object['uploadingDone']:
                    destination_extension = '.xml'
                    destination_path = os.path.join(self._remote_path, self._beneficiary_request_destination_folder,
                                                    file_name + destination_extension)
                    array2xml(destination_path, xml_data, request_object['rootElement'],
                                    request_object['namespaceUrl'])

        for response_object in config['beneficiaryResponses']:
            if not response_object['ignored']:
                xml_data = json.loads(replace_time_strings(json.dumps(response_object['data'])))
                source_extension = '.done' if response_object['readingDone'] else '.xml'
                file_name = prefix + replace_time_strings(response_object['data']['CstmrDtls']['GrpHdr']['MsgId'])
                source_path = os.path.join(self._remote_path, self._beneficiary_response_source_folder, (
                    self._read_folder if response_object['readingDone'] else '') + file_name + source_extension)
                array2xml(source_path, xml_data, response_object['rootElement'], response_object['namespaceUrl'])

                if response_object['readingDone']:
                    destination_extension = '.done'
                    destination_path = os.path.join(self._local_path, self._beneficiary_response_destination_folder,
                                                    file_name + destination_extension)
                    array2xml(destination_path, xml_data, response_object['rootElement'],
                                    response_object['namespaceUrl'])

        for request_object in config['benefitRequests']:
            if not request_object['ignored']:
                xml_data = json.loads(replace_time_strings(json.dumps(request_object['data'])))
                source_extension = '.done' if request_object['uploadingDone'] else '.xml'
                file_name = prefix + replace_time_strings(
                    request_object['data']['CstmrCdtTrfInitn']['GrpHdr']['MsgId'])
                source_path = os.path.join(self._local_path, self._benefit_request_source_folder,
                                           file_name + source_extension)
                array2xml(source_path, xml_data, request_object['rootElement'], request_object['namespaceUrl'])

                if request_object['uploadingDone']:
                    destination_extension = '.xml'
                    destination_path = os.path.join(self._remote_path, self._benefit_request_destination_folder,
                                                    file_name + destination_extension)
                    array2xml(destination_path, xml_data, request_object['rootElement'],
                                    request_object['namespaceUrl'])

        for response_object in config['benefitAcks']:
            if not response_object['ignored']:
                xml_data = json.loads(replace_time_strings(json.dumps(response_object['data'])))
                source_extension = '.done' if response_object['readingDone'] else '.xml'
                file_name = prefix + replace_time_strings(
                    response_object['data']['CstmrPmtAckRpt']['GrpHdr']['MsgId'])
                source_path = os.path.join(self._remote_path, self._benefit_ack_source_folder, (
                    self._read_folder if response_object['readingDone'] else '') + file_name + source_extension)
                array2xml(source_path, xml_data, response_object['rootElement'], response_object['namespaceUrl'])

                if response_object['readingDone']:
                    destination_extension = '.done'
                    destination_path = os.path.join(self._local_path, self._benefit_ack_destination_folder,
                                                    file_name + destination_extension)
                    array2xml(destination_path, xml_data, response_object['rootElement'],
                                    response_object['namespaceUrl'])

        for response_object in config['benefitStatuses']:
            if not response_object['ignored']:
                xml_data = json.loads(replace_time_strings(json.dumps(response_object['data'])))
                source_extension = '.done' if response_object['readingDone'] else '.xml'
                file_name = prefix + replace_time_strings(
                    response_object['data']['CstmrCdtTrfInitn']['GrpHdr']['MsgId'])
                source_path = os.path.join(self._remote_path, self._benefit_status_source_folder, (
                    self._read_folder if response_object['readingDone'] else '') + file_name + source_extension)
                array2xml(source_path, xml_data, response_object['rootElement'], response_object['namespaceUrl'])

                if response_object['readingDone']:
                    destination_extension = '.done'
                    destination_path = os.path.join(self._local_path, self._benefit_status_destination_folder,
                                                    file_name + destination_extension)
                    array2xml(destination_path, xml_data, response_object['rootElement'],
                                    response_object['namespaceUrl'])

    def clear_files(self):
        file_helper = FileHelper()
        folders = [
            os.path.join(self._local_path, self._beneficiary_request_source_folder),
            os.path.join(self._remote_path, self._beneficiary_request_destination_folder),
            os.path.join(self._remote_path, self._beneficiary_response_source_folder),
            os.path.join(self._remote_path, self._beneficiary_response_source_folder, self._read_folder),
            os.path.join(self._local_path, self._beneficiary_response_destination_folder),
            os.path.join(self._local_path, self._benefit_request_source_folder),
            os.path.join(self._remote_path, self._benefit_request_destination_folder),
            os.path.join(self._remote_path, self._benefit_ack_source_folder),
            os.path.join(self._remote_path, self._benefit_ack_source_folder, self._read_folder),
            os.path.join(self._local_path, self._benefit_ack_destination_folder),
            os.path.join(self._remote_path, self._benefit_status_source_folder),
            os.path.join(self._remote_path, self._benefit_status_source_folder, self._read_folder),
            os.path.join(self._local_path, self._benefit_status_destination_folder)
        ]

        for folder in folders:
            files = file_helper.get_files(folder)
            for file in files:
                if '.' in file:
                    file_path = os.path.join(folder, file)
                    os.remove(file_path)

    def get_success_count_job_runner(self, headers):
        api_helper = ApiHelper()
        fetch_success_count_url = 'http://localhost:1278/api/jobs?state=SUCCEEDED&offset=0&limit=20&order=updatedAt:ASC'
        response = api_helper.get(fetch_success_count_url, {}, headers)
        json_data = json.loads(response['result'])
        return json_data['total']

    def trigger_job_runner_job(self, job_name, success_count_difference):
        api_helper = ApiHelper()
        username = 'testlogin'
        password = 'Test@123'
        url = f'http://localhost:1278/api/recurring-jobs/{job_name}/trigger'
        headers = {
            'isBasicAuth': True,
            'username': username,
            'password': password
        }

        success_count_before = self.get_success_count_job_runner(headers)

        response = api_helper.post(url, {}, headers)

        success_count_after = 0
        while success_count_after < (success_count_before + success_count_difference):
            success_count_after = self.get_success_count_job_runner(headers)

        return response

    def initiate_v3_benefits(self):
        self.trigger_job_runner_job('generate-NPY-benefits-V3', 3)

    def initiate_v1_benefits(self):
        self.trigger_job_runner_job('generate-NPY-benefits-V1', 3)

    def delete_logs_for_benefits(self):
        postgres_helper = PostgresHelper()
        queries = [
            'DELETE FROM hierarchy_benefit_status_aud',
            'DELETE FROM hierarchy_benefit_status',
            'DELETE FROM revinfo'
        ]
        for query in queries:
            postgres_helper.execute(query, 'dbt_new')

    def delete_logs_for_benefits_nikshay(self):
        mssql_helper = MssqlHelper()
        query = 'DELETE FROM _HierarchyBenefitStatusMap'
        mssql_helper.execute(query, 'nikshay_new')

    def trigger_hangfire_job(self, token, job_name, success_count_difference):
        headers = {
            'Authorization': f'Bearer {token}',
            'Content-Type': 'application/x-www-form-urlencoded'
        }

        payload = {'jobs[]': job_name}

        success_count_before = self.get_succeeded_count_hangfire(token)

        endpoint = self.api_helper.getEndpoint('nikshay')
        url = f'{endpoint}/hangfire/recurring/trigger'
        response = self.api_helper.post(url, payload, headers)

        success_count_after = -1
        Logger.info('dbt', 'Waiting for job success')
        while success_count_after < (success_count_before + success_count_difference):
            success_count_after = self.get_succeeded_count_hangfire(token)

        return response

    def initiate_generate_beneficiaries(self, token):
        self.trigger_hangfire_job(token, 'india-generate-beneficiaries', 1)

    def initiate_upload_beneficiaries(self, token):
        self.trigger_hangfire_job(token, 'india-upload-beneficiaries', 1)

    def initiate_generate_ts_benefit(self, token):
        self.trigger_hangfire_job(token, 'india-generate-benefits-scheme-TS', 1)

    def initiate_download_read_beneficiaries(self, token):
        self.trigger_hangfire_job(token, 'india-download-read-beneficiaries', 1)

    def initiate_generate_psn_informant_benefit(self, token):
        self.trigger_hangfire_job(token, 'india-generate-benefits-scheme-PSN-Informant-incentive', 1)

    def initiate_generate_upload_benefits(self, token):
        self.trigger_hangfire_job(token, 'india-generate-upload-benefits', 1)

    def initiate_download_read_benefits(self, token):
        self.trigger_hangfire_job(token, 'india-download-read-benefits', 1)

    def get_beneficiary_id(self, name):
        query = f"SELECT Id FROM _Beneficiary WHERE BeneficiaryName = '{name}' ORDER BY Id DESC"
        rows = self.mssql_helper.select(query, 'nikshay_new')
        return rows[0]['Id']

    def add_bank_details(self, token, data):
        entity_id = data['entityId']
        entity_type = data['entityType']
        beneficiary_id = data['beneficiaryId']
        bank_name = data['bankName']
        branch_name = data['branchName']
        account_number = data['accountNumber']

        bank_details = self.get_bank_details(bank_name, branch_name)

        payload = {
            "BankId": bank_details['Id'],
            "BankName": bank_name,
            "BranchName": branch_name,
            "IfscCode": bank_details['IfscCode'],
            "BranchId": None,
            "BankAccountNo": account_number,
            "beneficiaryId": beneficiary_id,
            "EntityId": entity_id,
            "EntityType": entity_type
        }

        headers = {'Authorization': f'Bearer {token}'}

        endpoint = self.api_helper.getEndpoint('nikshay')
        url = f'{endpoint}/api/Dbt/UpdateBeneficiaryDetails/{beneficiary_id}'
        response = self.api_helper.put(url, payload, headers)

        return response

    def get_succeeded_count_hangfire(self, token):
        headers = {
            'Authorization': f'Bearer {token}',
            'Content-Type': 'application/x-www-form-urlencoded'
        }

        payload = {'metrics[]': 'succeeded:count'}

        endpoint = self.api_helper.getEndpoint('nikshay')
        url = f'{endpoint}/hangfire/stats'
        response = self.api_helper.post(url, payload, headers)
        json_data = response['result']
        return json_data['succeeded:count']['intValue']

    def update_dbt_data(self, data):
        file_path = f"{APP_PATH}data/dbtData.json"
        with open(file_path, 'r') as f:
            dbt_data = json.load(f)

        entity_type = data['type']
        entry_id = data['id']
        key_values = data['keyValues']

        for entity_type_key, entry_list in dbt_data.items():
            if entity_type_key == entity_type:
                for index, entry in enumerate(entry_list):
                    if entry['id'] == entry_id:
                        for key, value in key_values.items():
                            entry[key] = value
                    dbt_data[entity_type_key][index] = entry

        with open(file_path, 'w') as f:
            json.dump(dbt_data, f, indent=2)

    def reset_pfms_sent_time(self, beneficiary_id):
        query = f'UPDATE _Beneficiary SET LastBenefitSentToPfmsOn = NULL WHERE Id = {beneficiary_id}'
        self.mssql_helper.execute(query, 'nikshay_new')

    def initiate_v2_benefits(self):
        self.trigger_job_runner_job('generate-NPY-benefits-V2', 3)

    def generate_beneficiary_for_private_hierarchy(self, token, hierarchy_id):
        query = f"""
            SELECT ua.id as user_id
            FROM user_access ua
            INNER JOIN staff s ON s.id = ua.staff_id
            WHERE ua.hierarchy_id = {hierarchy_id} AND s.designation = 'ADMIN'
        """
        result = self.postgres_helper.execute(query, 'registry_new')
        user_id = result[0]['user_id']

        headers = {'Authorization': f'Bearer {token}'}

        endpoint = self.api_helper.getEndpoint('nikshay')
        url = f'{endpoint}/api/dbt/GetBeneficiaryDetailsForPrivateProvider?userId={user_id}'
        response = self.api_helper.get(url, headers=headers)
        return response
