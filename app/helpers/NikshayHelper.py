from app.helpers.ApiHelper import ApiHelper
from app.enums.Server import Server
import json
from app.utils.Utils import replace_time_strings
from app.helpers.MssqlHelper import MssqlHelper
from app.helpers.BaseHelper import BaseHelper
from app.helpers.PostgresHelper import PostgresHelper

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
            "Description": data['name'] + " " + data['type'] + " Login",
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
            'phoneOffice': '9999999997',
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
            'phoneOffice': '9999999995',
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

    def create_tu(self, token):
        return self.create_facility(token, {
            'name': 'tu',
            'type': 'TU',
            'mobile': '9999999994',
            'email': 'mail.three@gmail.com',
            'pincode': '999999',
            'phoneOffice': '9999999993',
            'secondaryMobile1': '9999999993',
            'secondaryMobile2': '9999999992',
            'level': 4,
            'typeOfPatientsAdded': 'IndiaTbPublic,IndiaTbPrivate',
            'extraData': json.dumps({
                "MotcName": "",
                "MobileNo": '9999999994',
                "Email": "mail.three@gmail.com",
                "Sts": "",
                "MobileSts": "9999999993",
                "Stls": "",
                "MobileStls": "9999999992",
                "TuAddress": "",
                "TuPincode": "999999",
                "UpdatedBy": "india-all",
                "UpdatedDate": replace_time_strings('DATE_TIME_PLUS_0_DAY')
            }),
            'parentId': self.get_hierarchy_id('Dharwad', 3),
            'accessPublicPatients': True,
            'accessPrivatePatients': True
        })

    def create_phi(self, token):
        return self.create_facility(token, {
            'name': 'phi',
            'type': 'PHI',
            'mobile': '9999999991',
            'email': '',
            'address': 'address',
            'level': 5,
            'typeOfPatientsAdded': 'IndiaTbPublic',
            'extraData': json.dumps({
                "DmcNin": "",
                "HFRegNo": "",
                "ContactPersonName": "",
                "ContactPersonDesg": "",
                "ContactPersonEmail": "",
                "MobileNo": "9999999991",
                "Address": "address",
                "FacilityType": "PHI",
                "IsAfterLogin": True,
                "UpdatedBy": "india-all",
                "UpdatedDate": replace_time_strings('DATE_TIME_PLUS_0_DAY')
            }),
            'parentId': self.get_hierarchy_id('tu', 4),
            'accessPublicPatients': True,
            'accessPrivatePatients': False
        })

    def create_pfms_agency(self, token):
        endpoint = self._api_helper.get_endpoint('nikshay')
        url = endpoint + '/api/ApiAutomatedUpdate/UpdatePfmsAgencyMappings'

        agency_name = 'Agency Name'
        agency_code = 'AGC'

        hierarchy_name = 'tu'
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

