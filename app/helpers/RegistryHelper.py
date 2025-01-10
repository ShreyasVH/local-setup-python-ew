from app.helpers.PostgresHelper import PostgresHelper
from app.helpers.ApiHelper import ApiHelper
from app.enums.Server import Server
import json
from app.helpers.BaseHelper import BaseHelper

class RegistryHelper(BaseHelper):
    def get_token(self, client_id):
        api_helper = ApiHelper()
        endpoint = api_helper.get_endpoint(Server.REGISTRY.value)
        url = endpoint + '/v1/client'

        headers = {
            'X-Client-Id': str(client_id)
        }
        token_response = api_helper.get(url, [], headers)
        json_response = json.loads(token_response['result'])
        data = json_response['data']
        return data['authToken']

    def add_hierarchy_associations(self, hierarchy_id, associations, token):
        api_helper = ApiHelper()
        endpoint = api_helper.get_endpoint(Server.REGISTRY.value)
        url = endpoint + '/v1/hierarchy'

        payload = {
            'hierarchy': {
                'hierarchyId': hierarchy_id
            },
            'associations': associations
        }

        headers = {
            'Authorization': 'Bearer ' + token
        }

        api_helper.put(url, payload, headers)

    def add_state_associations(self):
        client_id = self.get_client_id()
        token = self.get_token(client_id)

        state_id = self.get_hierarchy_id('Karnataka', 2)

        associations = {
            'pfmsStateCode': '29'
        }
        self.add_hierarchy_associations(state_id, associations, token)

    def add_module_permissions(self, data):
        postgres_helper = PostgresHelper()
        query = f"INSERT INTO module_permission (deployment_id, designation, item_id, is_active, hierarchy_type, item_type, view, add, edit, delete) VALUES ((select id from deployment where code = '{data['deploymentCode']}'), '{data['designation']}', {data['itemId']}, True, '{data['hierarchyType']}', '{data['itemType']}', {json.dumps(data['view'])}, {json.dumps(data['add'])}, {json.dumps(data['edit'])}, {json.dumps(data['delete'])})"
        postgres_helper.execute(query, 'registry_new')

    def add_sidebar_permissions(self, hierarchy_type, permission_names):
        item_type = 'sidebar'
        designation = 'ADMIN'
        deployment_code = 'IND'

        postgres_helper = PostgresHelper()
        query = 'SELECT id, name FROM sidebar_item'
        rows = postgres_helper.select(query, 'registry_new')
        item_map = {}
        for item in rows:
            item_map[item['name']] = item['id']

        for permission in permission_names:
            data = {
                'deploymentCode': deployment_code,
                'designation': designation,
                'hierarchyType': hierarchy_type,
                'itemType': item_type,
                'itemId': item_map[permission],
                'view': False,
                'add': False,
                'edit': False,
                'delete': False
            }
            self.add_module_permissions(data)

    def add_state_sidebar_permissions(self):
        hierarchy_type = 'STATE'

        sidebar_permissions = [
            'dashboards',
            'UserManagement',
            'StaffManagement',
            '_reset_password',
            'MappingDetailsActivityReports',
            'ActiveCaseMappingsummary',
            'GeneExpert',
            'AboutUs',
            'Overview',
            'NewEnrollment',
            'AddTestGlobal',
            'PatientManagement',
            'reports',
            'Admin',
            'my_profile',
            'Others',
            'Dispensation',
            'facility_administration',
            'merge_health_facility',
            'EVRIMED_METRICS',
            'CONTRACT_MANAGEMENT',
            'SearchSample',
            'ADD_CONTRACT',
            'SOE',
            'MY_CONTRACTS'
        ]

        self.add_sidebar_permissions(hierarchy_type, sidebar_permissions)

    def add_hierarchy_config(self, hierarchy_id, config_name, value, token):
        api_helper = ApiHelper()
        endpoint = api_helper.get_endpoint(Server.REGISTRY.value)
        url = endpoint + '/v1/config/hierarchy'

        payload = {
            "configName": config_name,
            "value": value,
            "hierarchyId": hierarchy_id
        }

        headers = {
            'Authorization': 'Bearer ' + token
        }

        api_helper.post(url, payload, headers)

    def add_state_configs(self):
        client_id = self.get_client_id()
        token = self.get_token(client_id)

        state_id = self.get_hierarchy_id('Karnataka', 2)

        configs = {
            'DbtSchemeCode': 'KA182',
            'DbtBeneficiaryTypeCodeNS': '4282',
            'DbtPurposeCodeAndBenficiaryTypeCodeTransitionDate': '26-11-2021 11:08:00',
            'DbtBeneficiaryTypeCodeTS': '4283',
            'DbtBeneficiaryTypeCodePSN': '4281',
            'DbtBeneficiaryTypeCodeTSS': '4284',
            'DbtPurposeCodeNS': '7942',
            'DbtPurposeCodeNPY': '7175',
            'DbtPurposeCodeTS': '7176',
            'DbtPurposeCodePSN': '7174',
            'DbtCentreAuthorityCodeNS': 'EID2L',
            'DbtCentreAuthorityCodeTS': 'E8TDP',
            'DbtCentreAuthorityCodePSN': 'E4308'
        }

        for key, value in configs.items():
            self.add_hierarchy_config(state_id, key, value, token)

    def add_district_associations(self):
        client_id = self.get_client_id()
        token = self.get_token(client_id)

        state_id = self.get_hierarchy_id('Dharwad', 3)

        associations = {
            'pfmsDistrictCode': '536'
        }
        self.add_hierarchy_associations(state_id, associations, token)

    def add_district_sidebar_permissions(self):
        hierarchy_type = 'DISTRICT'

        sidebar_permissions = [
            'AboutUs',
            'ActiveCaseMappingsummary',
            'AddTestGlobal',
            'Diagnostics',
            'AdherenceSummary',
            'Admin',
            'AdverseEventReportingSystem',
            'CONTRACT_MANAGEMENT',
            'Deduplication',
            'Dispensation',
            'EVRIMED_METRICS',
            'facility_administration',
            'GeneExpert',
            'INVENTORY_MANAGEMENT',
            'Invoices',
            'MappingDetailsActivityReports',
            'merge_health_facility',
            'my_profile',
            'NewEnrollment',
            'dashboards',
            'reports',
            'Others',
            'Overview',
            'PatientManagement',
            '_reset_password',
            'SearchSample',
            'SOE',
            'StaffManagement',
            'TaskLists',
            'TaskListStats',
            'TransferInOut',
            'UserManagement',
            'TB_MUKT_PANCHAYAT',
            'TBMP_REPORT'
        ]

        self.add_sidebar_permissions(hierarchy_type, sidebar_permissions)

    def add_district_configs(self):
        client_id = self.get_client_id()
        token = self.get_token(client_id)

        state_id = self.get_hierarchy_id('Dharwad', 3)

        configs = {
            'OverviewPage': 'OverallStats'
        }

        for key, value in configs.items():
            self.add_hierarchy_config(state_id, key, value, token)

    def add_district_patient_tab_permissions(self):
        hierarchy_type = 'DISTRICT'

        sidebar_permissions = {
            'Tests': {
                'view': True,
                'add': True,
                'edit': True,
                'delete': True
            },
            'Basic Details': {
                'view': True,
                'add': True,
                'edit': True,
                'delete': False
            },
            'Health Facilities': {
                'view': True,
                'add': False,
                'edit': True,
                'delete': False
            },
            'Treatment Details': {
                'view': True,
                'add': True,
                'edit': True,
                'delete': False
            },
            'Outcomes': {
                'view': True,
                'add': True,
                'edit': True,
                'delete': False
            },
            'DBT': {
                'view': True,
                'add': True,
                'edit': True,
                'delete': False
            }
        }

        self.add_patient_tab_permissions(hierarchy_type, sidebar_permissions)

    def add_tu_sidebar_permissions(self):
        hierarchy_type = 'TU'

        sidebar_permissions = [
            'my_profile',
            'UserManagement',
            'StaffManagement',
            '_reset_password',
            'MappingDetailsActivityReports',
            'ActiveCaseMappingsummary',
            'GeneExpert',
            'AboutUs',
            'Overview',
            'NewEnrollment',
            'Dispensation',
            'AddTestGlobal',
            'Diagnostics',
            'PatientManagement',
            'TaskLists',
            'AdherenceSummary',
            'reports',
            'Admin',
            'Deduplication',
            'Others',
            'TransferInOut',
            'facility_administration',
            'AdverseEventReportingSystem',
            'TaskListStats',
            'EVRIMED_METRICS',
            'INVENTORY_MANAGEMENT',
            'SearchSample'
        ]

        self.add_sidebar_permissions(hierarchy_type, sidebar_permissions)

    def add_phi_sidebar_permissions(self):
        hierarchy_type = 'PHI'

        sidebar_permissions = [
            'AboutUs',
            'ActiveCaseMappingsummary',
            'AddTestGlobal',
            'AdherenceSummary',
            'Admin',
            'AdverseEventReportingSystem',
            'Diagnostics',
            'Dispensation',
            'EVRIMED_METRICS',
            'GeneExpert',
            'INVENTORY_MANAGEMENT',
            'MappingDetailsActivityReports',
            'my_profile',
            'NewEnrollment',
            'reports',
            'Others',
            'Overview',
            'PatientManagement',
            '_reset_password',
            'SearchSample',
            'StaffManagement',
            'TaskLists',
            'TaskListStats',
            'TransferInOut',
            'UserManagement'
        ]

        self.add_sidebar_permissions(hierarchy_type, sidebar_permissions)

    def add_patient_tab_permissions(self, hierarchy_type, permissions):
        item_type = 'patient_tab'
        designation = 'ADMIN'
        deployment_code = 'IND'

        for key, values in permissions.items():
            data = {
                'deploymentCode': deployment_code,
                'designation': designation,
                'hierarchyType': hierarchy_type,
                'itemType': item_type,
                'itemId': f"(SELECT id FROM foreign_supported_tab WHERE name = '{key}')",
                'view': values['view'],
                'add': values['add'],
                'edit': values['edit'],
                'delete': values['delete']
            }
            self.add_module_permissions(data)

    def add_phi_patient_tab_permissions(self):
        hierarchy_type = 'PHI'

        sidebar_permissions = {
            'Tests': {
                'view': True,
                'add': True,
                'edit': True,
                'delete': True
            },
            'Basic Details': {
                'view': True,
                'add': True,
                'edit': True,
                'delete': False
            },
            'Health Facilities': {
                'view': True,
                'add': False,
                'edit': True,
                'delete': False
            },
            'Treatment Details': {
                'view': True,
                'add': True,
                'edit': True,
                'delete': False
            },
            'Outcomes': {
                'view': True,
                'add': True,
                'edit': True,
                'delete': False
            },
            'DBT': {
                'view': True,
                'add': True,
                'edit': True,
                'delete': False
            }
        }

        self.add_patient_tab_permissions(hierarchy_type, sidebar_permissions)

    def add_single_clinic_sidebar_permissions(self):
        hierarchy_type = 'HUB'

        sidebar_permissions = [
            'AboutUs',
            'ActiveCaseMappingsummary',
            'AddTestGlobal',
            'AdherenceSummary',
            'Admin',
            'AdverseEventReportingSystem',
            'Diagnostics',
            'Dispensation',
            'EVRIMED_METRICS',
            'GeneExpert',
            'INVENTORY_MANAGEMENT',
            'MappingDetailsActivityReports',
            'my_profile',
            'NewEnrollment',
            'reports',
            'Others',
            'Overview',
            'PatientManagement',
            '_reset_password',
            'SearchSample',
            'StaffManagement',
            'TaskLists',
            'TaskListStats',
            'TransferInOut',
            'UserManagement'
        ]

        self.add_sidebar_permissions(hierarchy_type, sidebar_permissions)

    def add_single_clinic_patient_tab_permissions(self):
        hierarchy_type = 'HUB'

        sidebar_permissions = {
            'Tests': {
                'view': True,
                'add': True,
                'edit': True,
                'delete': True
            },
            'Basic Details': {
                'view': True,
                'add': True,
                'edit': True,
                'delete': False
            },
            'Health Facilities': {
                'view': True,
                'add': False,
                'edit': True,
                'delete': False
            },
            'Treatment Details': {
                'view': True,
                'add': True,
                'edit': True,
                'delete': False
            },
            'Outcomes': {
                'view': True,
                'add': True,
                'edit': True,
                'delete': False
            },
            'DBT': {
                'view': True,
                'add': True,
                'edit': True,
                'delete': False
            }
        }

        self.add_patient_tab_permissions(hierarchy_type, sidebar_permissions)

    def add_private_lab_sidebar_permissions(self):
        hierarchy_type = 'PVTLAB'

        sidebar_permissions = [
            'AboutUs',
            'ActiveCaseMappingsummary',
            'AddTestGlobal',
            'AdherenceSummary',
            'AdverseEventReportingSystem',
            'Dispensation',
            'EVRIMED_METRICS',
            'GeneExpert',
            'my_profile',
            'NewEnrollment',
            'Others',
            'Overview',
            'PatientManagement',
            'reports',
            '_reset_password',
            'SearchSample',
            'StaffManagement',
            'TaskLists',
            'TaskListStats',
            'TransferInOut',
            'UserManagement'
        ]

        self.add_sidebar_permissions(hierarchy_type, sidebar_permissions)

    def add_private_lab_patient_tab_permissions(self):
        hierarchy_type = 'PVTLAB'

        sidebar_permissions = {
            'Tests': {
                'view': True,
                'add': True,
                'edit': True,
                'delete': True
            },
            'Basic Details': {
                'view': True,
                'add': True,
                'edit': True,
                'delete': False
            },
            'Health Facilities': {
                'view': True,
                'add': False,
                'edit': True,
                'delete': False
            },
            'Treatment Details': {
                'view': True,
                'add': True,
                'edit': True,
                'delete': False
            },
            'Outcomes': {
                'view': True,
                'add': True,
                'edit': True,
                'delete': False
            }
        }

        self.add_patient_tab_permissions(hierarchy_type, sidebar_permissions)

    def add_private_chemist_sidebar_permissions(self):
        hierarchy_type = 'PVTCHEM'

        sidebar_permissions = [
            'AboutUs',
            'ActiveCaseMappingsummary',
            'AddTestGlobal',
            'AdherenceSummary',
            'AdverseEventReportingSystem',
            'Dispensation',
            'EVRIMED_METRICS',
            'GeneExpert',
            'INVENTORY_MANAGEMENT',
            'my_profile',
            'NewEnrollment',
            'Others',
            'Overview',
            'PatientManagement',
            '_reset_password',
            'SearchSample',
            'TaskLists',
            'TaskListStats',
            'TransferInOut',
            'UserManagement'
        ]

        self.add_sidebar_permissions(hierarchy_type, sidebar_permissions)

    def add_private_chemist_patient_tab_permissions(self):
        hierarchy_type = 'PVTCHEM'

        sidebar_permissions = {
            'Tests': {
                'view': True,
                'add': True,
                'edit': True,
                'delete': True
            },
            'Basic Details': {
                'view': True,
                'add': True,
                'edit': True,
                'delete': False
            },
            'Health Facilities': {
                'view': True,
                'add': False,
                'edit': True,
                'delete': False
            },
            'Treatment Details': {
                'view': True,
                'add': True,
                'edit': True,
                'delete': False
            },
            'Outcomes': {
                'view': True,
                'add': True,
                'edit': True,
                'delete': False
            }
        }

        self.add_patient_tab_permissions(hierarchy_type, sidebar_permissions)
