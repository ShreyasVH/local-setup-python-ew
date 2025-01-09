from app.helpers.ApiHelper import ApiHelper
from app.enums.Server import Server
import json
from app.utils.Utils import replace_time_strings
from app.helpers.MssqlHelper import MssqlHelper
from app.helpers.BaseHelper import BaseHelper

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
            "Address": "",
            "Pincode": data['pincode'],
            "Name": "",
            "levelID": data['level'],
            "Secondary_Phone_No_1": data['phoneOffice'],
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
            "Access_IndiaTbPublic": True,
            "Access_IndiaTbPrivate": True,
            "facility_code": data['code'],
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
            'level': 2,
            'typeOfPatientsAdded': 'NONE',
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
            'parentId': self.get_hierarchy_id('Karnataka', 2)
        })

    def update_state_type_of_staff_allowed_to_add(self):
        query = 'UPDATE _UserAccess SET TypeOfStaffAllowedToAdd = \'IndiaTbPublic,IndiaTbPrivate\' WHERE Username = \'sto-KA\''
        mssql_helper = MssqlHelper()
        mssql_helper.execute(query, 'nikshay_new')
