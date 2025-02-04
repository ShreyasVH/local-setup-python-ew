import os
import sys

from app.helpers.ApiHelper import ApiHelper
from app.enums.Server import Server
import json
from app.utils.Utils import replace_time_strings
from app.helpers.MssqlHelper import MssqlHelper
from app.helpers.BaseHelper import BaseHelper
from app.helpers.PostgresHelper import PostgresHelper
import re
from app.utils.Logger import Logger
from app.helpers.ElasticHelper import ElasticHelper
from datetime import datetime
from app.helpers.MQHelper import MQHelper
import time
import urllib.parse

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

    def add_patient(self, token, data):
        selected_hierarchy_name = data['selectedHierarchyName']
        selected_hierarchy_id = self.get_hierarchy_id(selected_hierarchy_name, 5)

        residence_hierarchy_name = data['residenceHierarchyName']
        residence_hierarchy_level = data['residenceHierarchyLevel']

        residence_hierarchy_id = self.get_hierarchy_id(residence_hierarchy_name, residence_hierarchy_level)

        payload = {
            "TypeOfPatient": data['typeOfEpisode'],
            "Stage": "PRESUMPTIVE_OPEN",
            "RegistrationDate": data['enrollmentDate'],
            "SelectedHierarchyId": selected_hierarchy_id,
            "FirstName": data['firstName'],
            "LastName": data['lastName'],
            "FathersName": None,
            "Age": data['age'],
            "Gender": data['gender'],
            "PrimaryPhone": data['mobile'],
            "SecondaryPhone1": None,
            "SecondaryPhone2": None,
            "SecondaryPhone3": None,
            "Address": data['address'],
            "Ward": None,
            "Taluka": None,
            "Landmark": None,
            "ResidenceHierarchyId": residence_hierarchy_id,
            "ResidenceHierarchyAll": self.get_ancestors(residence_hierarchy_id),
            "Pincode": data['pincode'],
            "Area": data['area'],
            "MaritalStatus": data['maritalStatus'],
            "Occupation": data['occupation'],
            "SocioeconomicStatus": data['socioEconomicStatus'],
            "KeyPopulation": data['keyPopulation'],
            "VaccinationDate": data.get('vaccinationDate', None),
            "Symptom": data['symptom'],
            "HIVStatus": data['hivStatus'],
            "ContactPersonPhone": None,
            "ContactPersonName": None,
            "ContactPersonAddress": None,
            "parentEpisodeId": None,
            "IsPossibleDuplicate": None,
            "Source": None,
            "SourcePatientId": None,
            "TypeOfCaseFinding": data['typeOfCaseFinding'],
            "InformantId": data.get('informantId', None),
            "DateOfBirth": data['dateOfBirth'],
            "FollowUpsDone": [],
            "TbWinReferenceId": data.get('tbWinReferenceId', None)
        }

        endpoint = self._api_helper.get_endpoint('nikshay')
        url = f"{endpoint}/api/patients/AddIndiaTB"

        headers = {
            'Authorization': f"Bearer {token}"
        }

        response = self._api_helper.post(url, payload, headers)
        return response

    def add_test(self, token, data):
        postgres_helper = PostgresHelper()
        test_facility_name = data['testFacilityName']
        query = f"SELECT id, level_2_id, level_2_name, level_3_name, level_3_id FROM hierarchy WHERE level = 5 AND name = '{test_facility_name}'"
        rows = postgres_helper.select(query, 'registry_new')
        test_facility_data = rows[0]
        test_facility_id = test_facility_data['id']
        test_facility_state_name = test_facility_data['level_2_name']
        test_facility_state_id = test_facility_data['level_2_id']
        test_facility_district_name = test_facility_data['level_3_name']
        test_facility_district_id = test_facility_data['level_3_id']

        sample_collection_facility_name = data['sampleCollectionFacilityName']
        query = f"SELECT id, level_2_id, level_2_name, level_3_name, level_3_id FROM hierarchy WHERE level = 5 AND name = '{sample_collection_facility_name}'"
        rows = postgres_helper.select(query, 'registry_new')
        sample_collection_facility_data = rows[0]
        sample_collection_facility_id = sample_collection_facility_data['id']
        sample_collection_facility_state_name = sample_collection_facility_data['level_2_name']
        sample_collection_facility_state_id = sample_collection_facility_data['level_2_id']
        sample_collection_facility_district_name = sample_collection_facility_data['level_3_name']
        sample_collection_facility_district_id = sample_collection_facility_data['level_3_id']

        episode_id = data['episodeId']

        payload = {
            "ReasonForTesting": data['reason'],
             "PredominantSymptom": None,
            "PredominantSymptomDuration": None,
            "HCPVisits": None,
            "TypeOfCase": data['typeOfCase'],
           "MonthsOfTreatment": None,
            "MonthsSinceEpisode": None,
            "DiagnosisOfTB": [],
            "FollowUpReasonDSTB": None,
            "TypeOfPresumptiveDRTB": [],
            "CulturePositiveMonth": None,
            "FollowUpReasonDRTB": None,
            "FollowUpReasonDRTBMonth": None,
            "TestType": data['type'],
            "TestingFacilityState": {
                "Value": test_facility_state_name,
                "Key": test_facility_state_id,
                "Level": 5
            },
            "TestingFacilityDistrict": {
                "Value": test_facility_district_name,
                "Key": test_facility_district_id,
                "Level": 5
            },
            "TestingFacility": {
                "Value": data['testFacilityName'],
                "Key": test_facility_id
            },
            "SampleAvailability": "Present",
            "ResultAvailability": "Present",
            "TestSampleDetails": [
                {
                    "SampleMappingOption": "Add New Sample",
                    "SampleSpecimenType": data['sampleSpecimenType'],
                    "SampleSpecimenTypeIfOther": None,
                    "SampleSputumCollectionDetail": data['sampleSputumCollectionDetail'],
                    "SampleDescription": data['sampleDescription'],
                    "SampleCollectionDate": data['sampleCollectionDate'],
                    "SampleCollectionTime": "00:00",
                    "SampleCollectionSiteState": {
                        "Value": sample_collection_facility_state_name,
                        "Key": sample_collection_facility_state_id,
                        "Level": 5
                    },
                    "SampleCollectionSiteDistrict": {
                        "Value": sample_collection_facility_district_name,
                        "Key": sample_collection_facility_district_id,
                        "Level": 5
                    },
                    "SampleCollectionSite": {
                        "Value": data['sampleCollectionFacilityName'],
                        "Key": sample_collection_facility_id,
                        "Level": 5
                    },
                    "SampleReferralDate": None,
                    "SampleReferralSiteState": None,
                    "SampleReferralSiteDistrict": None,
                    "SampleReferralSite": None,
                    "SampleSerialId": None,
                    "SampleQrCode": None,
                    "MappedSampleId": None,
                    "MappedSampleSpecimenType": None,
                    "MappedSampleSpecimenTypeIfOther": None,
                    "MappedSampleSputumCollectionDetail": None,
                    "MappedSampleDescription": None,
                    "MappedSampleCollectionDate": None,
                    "MappedSampleCollectionTime": None,
                    "MappedSampleCollectionSiteState": None,
                    "MappedSampleCollectionSiteDistrict": None,
                    "MappedSampleCollectionSite": None,
                    "MappedSampleReferralDate": None,
                    "MappedSampleReferralSiteState": None,
                    "MappedSampleReferralSiteDistrict": None,
                    "MappedSampleReferralSite": None,
                    "MappedSampleSerialId": None,
                    "MappedSampleQrCode": None
                }
            ],
            "LabSerialNumber": None,
            "ResultSampleId": {
                "Key": "1",
                "Value": "Sample-1",
                "Label": "Sample-1",
                "ValueKey": "Sample1"
            },
            "IndurationSize": None,
            "ResultDateTested": None,
            "ResultDateReported": data['diagnosisDate'],
            "ResultReportedBy": None,
            "FLLPA_AddMutationDetails": "Skip",
            "SLLPA_AddMutationDetails": "Skip",
            "FLLPASample": None,
            "FLLPA_TUB_BAND": None,
            "FLLPA_Rpob_Locus_Control": None,
            "FLLPA_RpoB_WT1": None,
            "FLLPA_RpoB_WT2": None,
            "FLLPA_WT3": None,
            "FLLPA_WT4": None,
            "FLLPA_WT5": None,
            "FLLPA_WT6": None,
            "FLLPA_WT7": None,
            "FLLPA_WT8": None,
            "FLLPA_MUT1_D516V": None,
            "FLLPA_MUT2A_H526Y": None,
            "FLLPA_MUT2B_H526D": None,
            "FLLPA_MUT3_S513L": None,
            "FLLPA_KAT_G": None,
            "FLLPA_KAT_WT1": None,
            "FLLPA_KAT_MUT1": None,
            "FLLPA_KAT_MUT2": None,
            "FLLPA_INH_A": None,
            "FLLPA_INH_WT1": None,
            "FLLPA_INH_WT2": None,
            "FLLPA_INH_MUT1": None,
            "FLLPA_INH_MUT2": None,
            "FLLPA_MUT3A": None,
            "FLLPA_MUT3B": None,
            "GYR_A_Locus_Control": None,
            "SLLPA_WT1_85_90": None,
            "SLLPA_WT2_89_93": None,
            "SLLPA_WT3_92_97": None,
            "SLLPA_MUT1_A90V": None,
            "SLLPA_MUT2_S91P": None,
            "SLLPA_MUT3A_D94A": None,
            "SLLPA_MUT3B_D94N": None,
            "SLLPA_MUT3C_D94G": None,
            "SLLPA_MUT3D_D94H": None,
            "GYR_B_Locus_Control": None,
            "SLLPA_WT1_536_541": None,
            "SLLPA_MUT1_N538D": None,
            "SLLPA_MUT2_E540V": None,
            "RRS_Locus_Control": None,
            "SLLPA_WT1_1401_02": None,
            "SLLPA_WT2_1484": None,
            "SLLPA_MUT1_A1401G": None,
            "SLLPA_MUT2_G148T": None,
            "EIS_Locus_Control": None,
            "SLLPA_WT1_37": None,
            "SLLPA_WT2_14_12_10": None,
            "SLLPA_WT3_2": None,
            "SLLPA_MUT1_C_14T": None,
            "TextResult": None,
            "CultureType": None,
            "DSTToDrug": None,
            "ResistanceStatus": None,
            "FLLPA_Result": None,
            "SLLPA_Result": None,
            "PathodetectResult": None,
            "ResistanceToRifampicin": None,
            "HighLevelResistanceToIsoniazid": None,
            "LowLevelResistanceToIsoniazid": None,
            "ResistanceToFluoroquinolones": None,
            "ResistanceToSecondLineInjectableDrugs": None,
            "ResistanceToSecondLineInjectableDrugsLowLevel": None,
            "FinalInterpretation": data['finalInterpretation'],
            "Remarks": None,
            "PatientId": episode_id
        }

        endpoint = self._api_helper.get_endpoint('nikshay')
        url = f"{endpoint}/API/TestResults/AddDiagnosticsTest"

        headers = {
            'Authorization': f"Bearer {token}"
        }

        response = self._api_helper.post(url, payload, headers)
        self.ensure_stage_transitioned(episode_id, 'DIAGNOSED_NOT_ON_TREATMENT')

        return response

    def ensure_stage_transitioned(self, episode_id, expected_stage, is_retry=False):
        Logger.info('nikshay', 'Ensuring stage transition')
        elastic_helper = ElasticHelper()
        stage_transitioned = False
        start = time.time()
        buffer_time = 120
        while not stage_transitioned:
            # Logger.info('nikshay', f"Ensuring stage transitions for {episode_id}")
            document = elastic_helper.get_document('episode', episode_id)
            stage_transitioned = expected_stage == document['stageKey']
            if (time.time() - start) > buffer_time:
                break
        if not is_retry and not stage_transitioned:
            mq_helper = MQHelper()
            data = {
                'EventName': 'q.episode.update_elastic_document',
                'Field': {
                    'episodeId': episode_id,
                    'clientId': 29,
                    'isUpdate': True
                }
            }

            headers = {
                'clientId': 29
            }

            mq_helper.publish_message('q.episode.update_elastic_document', json.dumps(data), headers)
            self.ensure_stage_transitioned(episode_id, expected_stage, True)

    def get_dbt_maker_user_name(self, hierarchy_name, hierarchy_level):
        postgres_helper = PostgresHelper()
        tu_id = self.get_tu_id(hierarchy_name, hierarchy_level)

        query = f"select ua.username from user_access ua inner join staff s on s.id = ua.staff_id where s.designation = 'DBT Maker' and ua.hierarchy_id = {tu_id}"
        rows = postgres_helper.select(query, os.getenv('POSTGRES_REGISTRY_DB'))
        return rows[0]['username']

    def update_benefit_status(self, token, scheme, payload):
        endpoint = self._api_helper.get_endpoint('nikshay')
        url = f"{endpoint}/api/Dbt/UpdateBenefits/{scheme}/PENDING"

        headers = {
            'Authorization': f"Bearer {token}"
        }

        response = self._api_helper.put(url, payload, headers)
        return response

    def remove_benefits(self, token, episode_id, scheme):
        mssql_helper = MssqlHelper()
        query = f"SELECT Id FROM _Benefit WHERE EpisodeId = {episode_id} AND Scheme = '{scheme}'"
        rows = mssql_helper.select(query, os.getenv('MSSQL_NIKSHAY_DB'))

        benefit_list = [
            {
                "BenefitId": row['Id'],
                "TransactionDate": None,
                "TransactionId": None,
                "PrimaryAction": {
                    "Action": "REMOVE",
                    "Comment": "Removing"
                }
            }
            for row in rows
        ]

        payload = {
            'Benefits': benefit_list
        }

        return self.update_benefit_status(token, scheme, payload)

    def start_treatment(self, token, data):
        episode_id = data['episodeId']
        expected_stage = 'DIAGNOSED_ON_TREATMENT_PUBLIC' if data['typeOfEpisode'] == 'IndiaTbPublic' else 'DIAGNOSED_ON_TREATMENT_PRIVATE'

        payload = {
            "EpisodeId": episode_id,
            "TypeOfTreatment": {
                "Value": data['typeOfTreatment'],
                "Key": data['typeOfTreatment']
            },
            "InitialWeight": data['weight'],
            "SiteOfDisease": data['siteOfDisease'],
            "ExtraPulmonarySite": "",
            "Height": data['height'],
            "DateOfTBTreatmentInitiation": data['startDate'],
            "TreatmentPhase": data['treatmentPhase'],
            "EndOfIP": "",
            "DateofTPTInitiation": "",
            "HasDSTBTest": data['hasDstbTest'],
            "DateOfDSTBDiagnosis": data['diagnosisDate'],
            "BasisOfDSTBDiagnosis": data['testType'],
            "HasDRTBTest": data['hasDrtbTest'],
            "DateOfDRTBDiagnosis": "",
            "BasisOfDRTBDiagnosis": "",
            "HasLTBITest": data['hasLtbiTest'],
            "DateOfLTBIDiagnosis": "",
            "BasisOfLTBIDiagnosis": "",
            "DSTBNotificationTestId": None,
            "DRTBNotificationTestId": None,
            "LTBINotificationTestId": None,
            "AdherenceTechnology": {
                "Value": data['monitoringMethod'],
                "Key": data['monitoringMethod']
            },
            "MermSerialNoObj": None,
            "AdherenceDispensationCorrelation": "True",
            "TypeOfDot": "",
            "LastSeen": None,
            "BatteryLevel": None,
            "DSTBRegimen": {
                "Key": data['regimen'],
                "Value": data['regimen']
            },
            "DRTBRegimen": "",
            "TPTRegimen": ""
        }

        endpoint = self._api_helper.get_endpoint('nikshay')
        url = f"{endpoint}/api/Patients/TreatmentDetails?patientId={episode_id}"

        headers = {
            'Authorization': f"Bearer {token}"
        }

        response = self._api_helper.post(url, payload, headers)

        self.ensure_stage_transitioned(episode_id, expected_stage)
        return response

    def close_case(self, token, data):
        episode_id = data['episodeId']
        treatment_outcome = data['treatmentOutcome']
        end_date = data['endDate']
        expected_stage = data['stage']

        endpoint = self._api_helper.get_endpoint('nikshay')
        url = f"{endpoint}/Api/Patients/CloseCase/{episode_id}"
        url = f"{url}?PatientId={episode_id}&TreatmentOutcome={treatment_outcome}&EndDate={urllib.parse.quote(end_date)}Z"
        print(url)

        headers = {
            'Authorization': f"Bearer {token}"
        }

        payload = {
            'PatientId': episode_id,
            'TreatmentOutcome': treatment_outcome,
            'EndDate': end_date
        }

        response = self._api_helper.put(url, payload, headers)

        self.ensure_stage_transitioned(episode_id, expected_stage)
        return response

    def update_duplicate_status(self, token, data):
        episode_id = data['episodeId']
        status = data['status']
        duplicate_of = data['duplicateOf']

        endpoint = self._api_helper.get_endpoint('nikshay')
        url = f"{endpoint}/api/Patients/UpdateDuplicateStatus"

        headers = {
            'Authorization': f"Bearer {token}"
        }

        payload = [
            {
                'PatientId': episode_id,
                'DuplicationStatus': status,
                'DuplicateOf': duplicate_of
            }
        ]

        response = self._api_helper.post(url, payload, headers)
        return response
