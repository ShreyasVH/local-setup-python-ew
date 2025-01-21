from app.helpers.ApiHelper import ApiHelper
from app.enums.Server import Server
import json
from app.utils.Utils import replace_time_strings
from app.helpers.MssqlHelper import MssqlHelper
from app.helpers.BaseHelper import BaseHelper
from app.helpers.PostgresHelper import PostgresHelper
import re

class NikshayHelper(BaseHelper):
    def __init__(self):
        self._api_helper = ApiHelper()

    def warmup(self):
        endpoint = self._api_helper.get_endpoint(Server.NIKSHAY.value)
        url = endpoint + '/'

        while True:
            response = self._api_helper.get(url)
            if response.get('status') == 200:
                break

    def warmup_webapp(self):
        endpoint = self._api_helper.get_endpoint(Server.NIKSHAY_WEBAPP.value)
        url = endpoint + '/'

        while True:
            response = self._api_helper.get(url)
            if response.get('status') == 200:
                break

    def get_token(self, user_name, password):
        endpoint = self._api_helper.get_endpoint('nikshay')
        url = f"{endpoint}/Token"

        headers = {
            'Content-Type': 'application/x-www-form-urlencoded'
        }

        payload = {
            'grant_type': 'password',
            'username': user_name,
            'password': password
        }

        response = self._api_helper.post(url, payload, headers)
        access_token = ''

        if response['status'] == 200:
            data = json.loads(response['result'])
            access_token = data.get('access_token', '')

        return access_token

    def create_facility(self, token, data):
        endpoint = self._api_helper.get_endpoint('nikshay')
        url = f"{endpoint}/API/UserFacility/SaveUserFacility"

        headers = {
            'Authorization': 'Bearer ' + token,
        }

        payload = {
            "inputAction": "Insert",
            "ChooseFacilityType": data['type'],
            "Description": data['description'] if 'description' in data else data['name'] + " " + data['type'] + " Login",
            "facility_name": data['name'],
            "UserId": 1,
            "lUserID": None,
            "Email_ID": data['email'],
            "Primary_Phone_No": data['mobile'],
            "Address": data['address'] if 'address' in data else '',
            "Pincode": data['pincode'] if 'pincode' in data else None,
            "Name": "",
            "IsNotActive": not data['active'] if 'active' in data else None,
            "levelID": data['level'],
            "Secondary_Phone_No_1": data['secondaryMobile1'] if 'secondaryMobile1' in data else None,
            "Secondary_Phone_No_2": data['secondaryMobile2'] if 'secondaryMobile2' in data else None,
            "json_data": data['extraData'],
            "resource": "Hierarchy",
            "rcountry": "READ",
            "rstate": "READ",
            "rdistrict": "READ",
            "rtu": "READ",
            "rphi": "READ",
            "rngo": "READ",
            "rart": "READ",
            "DrugRegimen": "UNKNOWN",
            "HasMERM": False,
            "HasChildren": True,
            "ViewOnly": False,
            "CanDeletePatients": True,
            "CanDelete": False,
            "Access_Default": False,
            "Access_IndiaTbPublic": data['accessPublicPatients'] if 'accessPublicPatients' in data else False,
            "Access_IndiaTbPrivate": data['accessPrivatePatients'] if 'accessPrivatePatients' in data else False,
            "facility_code": data['code'] if 'code' in data else None,
            "facility_sector": "ALL",
            "Password": "MlpCmYX96kmXzSCjuBFMKQ==",
            "facility_Parent_Id": data['parentId'],
            "TypeOfPatientAdded": data['typeOfPatientsAdded'],
            "ForgoIncentive": False
        }

        cookies = {
            'IsUserFacilityOtpVerified': 'true'
        }

        response = self._api_helper.post(url, payload, headers, cookies)
        return json.loads(response['result'])

    def create_state(self, token):
        return self.create_facility(token, {
            'name': 'Karnataka',
            'code': 'KA',
            'type': 'STATE',
            'mobile': '9999999998',
            'email': 'mail.one@gmail.com',
            'pincode': '999999',
            'secondaryMobile1': '9999999997',
            'level': 2,
            'typeOfPatientsAdded': 'NONE',
            'accessPublicPatients': True,
            'accessPrivatePatients': True,
            'extraData': json.dumps({
                "StoName": "",
                "Email": "mail.one@gmail.com",
                "PhoneOffice": '9999999997',
                "PhoneRes": '9999999998',
                "MobileNo": '9999999998',
                "StcAddress": "",
                "StcPincode": "999999",
                "UpdatedBy": "india-all",
                "UpdatedDate": replace_time_strings('DATE_TIME_PLUS_0_DAY')
            }),
            'parentId': self.get_hierarchy_id('India', 1)
        })

    def create_district(self, token):
        return self.create_facility(token, {
            'name': 'Dharwad',
            'code': 'DHA',
            'type': 'DISTRICT',
            'mobile': '9999999996',
            'email': 'mail.two@gmail.com',
            'pincode': '999999',
            'secondaryMobile1': '9999999995',
            'level': 3,
            'typeOfPatientsAdded': 'IndiaTbPublic,IndiaTbPrivate',
            'extraData': json.dumps({
                "DtoName": "",
                "Email": "mail.two@gmail.com",
                "PhoneOffice": '9999999995',
                "MobileNo": '9999999996',
                "DtcAddress": "",
                "DtcPincode": "999999",
                "PfmsDistrictCode": 0,
                "UpdatedBy": "india-all",
                "UpdatedDate": replace_time_strings('DATE_TIME_PLUS_0_DAY')
            }),
            'parentId': self.get_hierarchy_id('Karnataka', 2),
            'accessPublicPatients': True,
            'accessPrivatePatients': True
        })

    def update_state_type_of_staff_allowed_to_add(self):
        query = 'UPDATE _UserAccess SET TypeOfStaffAllowedToAdd = \'IndiaTbPublic,IndiaTbPrivate\' WHERE Username = \'sto-KA\''
        mssql_helper = MssqlHelper()
        mssql_helper.execute(query, 'nikshay_new')

    def create_tu(self, token, data):
        return self.create_facility(token, {
            'name': data['name'],
            'type': 'TU',
            'mobile': data['mobile'],
            'email': data['email'],
            'pincode': '999999',
            'secondaryMobile1': data['secondaryMobile1'],
            'secondaryMobile2': data['secondaryMobile2'],
            'level': 4,
            'typeOfPatientsAdded': 'IndiaTbPublic,IndiaTbPrivate',
            'extraData': json.dumps({
                "MotcName": "",
                "MobileNo": data['mobile'],
                "Email": data['email'],
                "Sts": "",
                "MobileSts": data['secondaryMobile1'],
                "Stls": "",
                "MobileStls": data['secondaryMobile2'],
                "TuAddress": "",
                "TuPincode": "999999",
                "UpdatedBy": "india-all",
                "UpdatedDate": replace_time_strings('DATE_TIME_PLUS_0_DAY')
            }),
            'parentId': self.get_hierarchy_id('Dharwad', 3),
            'accessPublicPatients': True,
            'accessPrivatePatients': True
        })

    def create_phi(self, token, data):
        return self.create_facility(token, {
            'name': data['name'],
            'type': 'PHI',
            'mobile': data['mobile'],
            'email': '',
            'address': 'address',
            'level': 5,
            'typeOfPatientsAdded': 'IndiaTbPublic',
            'extraData': data['extraData'],
            'parentId': data['parentId'],
            'accessPublicPatients': True,
            'accessPrivatePatients': False
        })

    def create_pfms_agency(self, token, data):
        endpoint = self._api_helper.get_endpoint('nikshay')
        url = endpoint + '/api/ApiAutomatedUpdate/UpdatePfmsAgencyMappings'

        agency_name = data['name']
        agency_code = data['code']

        hierarchy_name = data['tuName']
        hierarchy_level = 4
        state_code = self.get_state_code(hierarchy_name, hierarchy_level)
        district_code = self.get_district_code(hierarchy_name, hierarchy_level)
        tu_code = self.get_hierarchy_code(hierarchy_name, hierarchy_level)

        payload = [
            {
                "StateCode": state_code,
                "DistrictCode": district_code,
                "TBUCodeFormatted": tu_code,
                "PfmsAgencyName": agency_name,
                "PfmsAgencyCode": agency_code
            }
        ]

        headers = {
            'Authorization': f"Bearer {token}"
        }

        response = self._api_helper.post(url, payload, headers)
        return json.loads(response['result'])

    def create_single_clinic(self, token, data):
        return self.create_facility(token, {
            'name': data['name'],
            'type': 'HUB',
            'description': f"{data['name']} SINGLE Login",
            'mobile': data['mobile'],
            'email': '',
            'address': 'address',
            'level': 5,
            'typeOfPatientsAdded': 'IndiaTbPrivate',
            'extraData': data['extraData'],
            'parentId': data['parentId'],
            'accessPublicPatients': False,
            'accessPrivatePatients': True
        })

    def create_multi_clinic(self, token):
        return self.create_facility(token, {
            'name': 'multi clinic',
            'type': 'HUB',
            'description': 'multi clinic MULTI Login',
            'mobile': '9999999989',
            'email': '',
            'address': 'address',
            'level': 5,
            'typeOfPatientsAdded': 'IndiaTbPrivate',
            'extraData': json.dumps({
                "DmcNin": "",
                "HFRegNo": "",
                "ContactPersonName": "",
                "ContactPersonDesg": "",
                "ContactPersonEmail": "",
                "MobileNo": "9999999989",
                "Address": "address",
                "FacilityType": "MULTI",
                "IsAfterLogin": True,
                "UpdatedBy": "india-all",
                "UpdatedDate": replace_time_strings('DATE_TIME_PLUS_0_DAY')
            }),
            'parentId': self.get_hierarchy_id('tu', 4),
            'accessPublicPatients': False,
            'accessPrivatePatients': True
        })

    def create_private_lab(self, token):
        return self.create_facility(token, {
            'name': 'private lab',
            'type': 'PVTLAB',
            'mobile': '9999999988',
            'email': '',
            'address': 'address',
            'level': 5,
            'typeOfPatientsAdded': 'IndiaTbPrivate',
            'extraData': json.dumps({
                "DmcNin": "",
                "HFRegNo": "",
                "ContactPersonName": "",
                "ContactPersonDesg": "",
                "ContactPersonEmail": "",
                "MobileNo": "9999999988",
                "Address": "address",
                "FacilityType": "PVTLAB",
                "IsAfterLogin": True,
                "UpdatedBy": "india-all",
                "UpdatedDate": replace_time_strings('DATE_TIME_PLUS_0_DAY')
            }),
            'parentId': self.get_hierarchy_id('tu', 4),
            'accessPublicPatients': False,
            'accessPrivatePatients': True
        })

    def create_private_chemist(self, token):
        return self.create_facility(token, {
            'name': 'private chemist',
            'type': 'PVTCHEM',
            'mobile': '9999999987',
            'email': '',
            'address': 'address',
            'level': 5,
            'typeOfPatientsAdded': 'IndiaTbPrivate',
            'extraData': json.dumps({
                "DmcNin": "",
                "HFRegNo": "",
                "ContactPersonName": "",
                "ContactPersonDesg": "",
                "ContactPersonEmail": "",
                "MobileNo": "9999999987",
                "Address": "address",
                "FacilityType": "PVTCHEM",
                "IsAfterLogin": True,
                "UpdatedBy": "india-all",
                "UpdatedDate": replace_time_strings('DATE_TIME_PLUS_0_DAY')
            }),
            'parentId': self.get_hierarchy_id('tu', 4),
            'accessPublicPatients': False,
            'accessPrivatePatients': True
        })

    def read_otp(self, mobile_number):
        postgres_helper = PostgresHelper()

        query = f"SELECT message FROM ins_sms_logs WHERE phone_number = '{mobile_number}' ORDER BY id desc LIMIT 1"

        rows = postgres_helper.select(query, 'ins_new')
        text = rows[0]['message']
        pattern = r"(.*) is the OTP for (.*)"
        return (re.search(pattern, text)).group(1)

    def add_staff(self, token, data):
        endpoint = self._api_helper.get_endpoint('nikshay')
        url = endpoint + '/api/FieldStaff/Add'
        payload = {
            "Name": data['name'],
            "Type": data['type'],
            "Designation": data['designation'],
            "PrimaryNumber": data['mobile'],
            "SecondaryNumber": None,
            "Email": None,
            "AllowLogin": data['allowLogin'],
            "Username": data['userName'],
            "Id": 0,
            "StaffId": 0,
            "HierarchyMapping": data['hierarchyId'],
            "Otp": data['otp'],
            "AddedPatientIds": [],
            "RemovedPatientIds": []
        }

        headers = {
            'Authorization': f"Bearer {token}"
        }

        response = self._api_helper.post(url, payload, headers, {})
        return json.loads(response.get('result'))

    def add_dbt_checker(self, token, data):
        hierarchy_name = data['hierarchyName']

        hierarchy_id = self.get_hierarchy_id(hierarchy_name, 3)

        endpoint = self._api_helper.get_endpoint('nikshay')
        url = f"{endpoint}/api/FieldStaff/GenerateAndSendOtpFor/{hierarchy_id}/Add"

        headers = {
            'Authorization': f"Bearer {token}"
        }

        self._api_helper.get(url, {}, headers)

        otp = self.read_otp(self.get_state_mobile(hierarchy_name, 3))

        payload = {
            'name': data['name'],
            'type': 'PublicAndPrivate',
            'designation': 'DBT Checker',
            'mobile': data['mobile'],
            'allowLogin': True,
            'userName': data['mobile'],
            'hierarchyId': hierarchy_id,
            'otp': otp
        }
        response = self.add_staff(token, payload)
        return response

    def add_dbt_maker(self, token, data):
        hierarchy_name = data['hierarchyName']
        hierarchy_id = self.get_hierarchy_id(hierarchy_name, 4)

        endpoint = self._api_helper.get_endpoint('nikshay')
        url = f"{endpoint}/api/FieldStaff/GenerateAndSendOtpFor/{hierarchy_id}/Add"

        headers = {
            'Authorization': f"Bearer {token}"
        }

        response = self._api_helper.get(url, {}, headers)

        otp = self.read_otp(self.get_district_mobile(hierarchy_name, 4))

        payload = {
            'name': data['name'],
            'type': 'PublicAndPrivate',
            'designation': 'DBT Maker',
            'mobile': data['mobile'],
            'allowLogin': True,
            'userName': data['mobile'],
            'hierarchyId': hierarchy_id,
            'otp': otp
        }

        response = self.add_staff(token, payload)
        return response