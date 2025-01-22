from app.helpers.PostgresHelper import PostgresHelper

class BaseHelper:
    def get_hierarchy_details(self, name, level):
        postgres_helper = PostgresHelper()
        query = f"SELECT id, code FROM hierarchy WHERE name = '{name}' AND level = {level}"
        rows = postgres_helper.select(query, 'registry_new')
        return rows[0]

    def get_hierarchy_id(self, name, level):
        return self.get_hierarchy_details(name, level)['id']

    def get_hierarchy_code(self, name, level):
        return self.get_hierarchy_details(name, level)['code']

    def get_client_id(self):
        postgres_helper = PostgresHelper()

        query = f"SELECT id FROM client WHERE name = 'Nikshay'"
        rows = postgres_helper.select(query, 'registry_new')
        return rows[0]['id']

    def get_state_details(self, hierarchy_name, hierarchy_level):
        postgres_helper = PostgresHelper()
        query = f"SELECT CASE WHEN level_2_id IS null THEN id ELSE level_2_id END as state_id, CASE WHEN level_2_name IS null THEN name ELSE level_2_name END as name, CASE WHEN level_2_code IS null THEN code ELSE level_2_code END as code FROM hierarchy WHERE name = '{hierarchy_name}' AND level = {hierarchy_level}"
        rows = postgres_helper.select(query, 'registry_new')
        return rows[0]

    def get_state_id(self, hierarchy_name, hierarchy_level):
        return self.get_state_details(hierarchy_name, hierarchy_level).get('state_id')

    def get_state_code(self, hierarchy_name, hierarchy_level):
        return self.get_state_details(hierarchy_name, hierarchy_level).get('code')

    def get_district_details(self, hierarchy_name, hierarchy_level):
        postgres_helper = PostgresHelper()
        query = f"SELECT CASE WHEN level_3_id IS null THEN id ELSE level_3_id END as id, CASE WHEN level_3_name IS null THEN name ELSE level_3_name END as name, CASE WHEN level_3_code IS null THEN code ELSE level_3_code END as code FROM hierarchy WHERE name = '{hierarchy_name}' AND level = {hierarchy_level}"
        rows = postgres_helper.select(query, 'registry_new')
        return rows[0]

    def get_district_id(self, hierarchy_name, hierarchy_level):
        return self.get_district_details(hierarchy_name, hierarchy_level).get('id')

    def get_district_code(self, hierarchy_name, hierarchy_level):
        return self.get_district_details(hierarchy_name, hierarchy_level).get('code')

    def get_state_mobile(self, hierarchy_name, hierarchy_level):
        postgres_helper = PostgresHelper()

        state_id = self.get_state_id(hierarchy_name, hierarchy_level)

        query = f"SELECT ha.value from hierarchy_associations ha INNER JOIN associations_master am ON am.id = ha.association_id WHERE ha.hierarchy_id = {state_id} AND am.type = 'mobileNumber'"
        rows = postgres_helper.select(query, 'registry_new')
        return rows[0]['value']

    def get_district_mobile(self, hierarchy_name, hierarchy_level):
        postgres_helper = PostgresHelper()

        district_id = self.get_district_id(hierarchy_name, hierarchy_level)

        query = f"SELECT ha.value from hierarchy_associations ha INNER JOIN associations_master am ON am.id = ha.association_id WHERE ha.hierarchy_id = {district_id} AND am.type = 'mobileNumber'"
        rows = postgres_helper.select(query, 'registry_new')
        return rows[0]['value']

    def get_ancestors(self, hierarchy_id):
        postgres_helper = PostgresHelper()

        query = f"SELECT level_1_id, level_2_id, level_3_id, level_4_id, level_5_id, id FROM hierarchy WHERE id = {hierarchy_id}"
        rows = postgres_helper.select(query, 'registry_new')
        ancestor_ids = rows[0]
        return list(filter(lambda id: id is not None, [
            ancestor_ids['level_1_id'],
            ancestor_ids['level_2_id'],
            ancestor_ids['level_3_id'],
            ancestor_ids['level_4_id'],
            ancestor_ids['level_5_id'],
            ancestor_ids['id'],
        ]))

    def get_tu_details(self, hierarchy_name, hierarchy_level):
        postgres_helper = PostgresHelper()
        query = f"SELECT CASE WHEN level_4_id IS null THEN id ELSE level_4_id END as id, CASE WHEN level_4_name IS null THEN name ELSE level_4_name END as name, CASE WHEN level_4_code IS null THEN code ELSE level_4_code END as code FROM hierarchy WHERE name = '{hierarchy_name}' AND level = {hierarchy_level}"
        rows = postgres_helper.select(query, 'registry_new')
        return rows[0]

    def get_tu_id(self, hierarchy_name, hierarchy_level):
        return self.get_tu_details(hierarchy_name, hierarchy_level).get('id')
