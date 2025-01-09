from app.helpers.PostgresHelper import PostgresHelper

class BaseHelper:
    def get_hierarchy_id(self, name, level):
        postgres_helper = PostgresHelper()
        query = f"SELECT id FROM hierarchy WHERE name = '{name}' AND level = {level}"
        rows = postgres_helper.select(query, 'registry_new')
        return rows[0]['id']

    def get_client_id(self):
        postgres_helper = PostgresHelper()

        query = f"SELECT id FROM client WHERE name = 'Nikshay'"
        rows = postgres_helper.select(query, 'registry_new')
        return rows[0]['id']

    def get_state_details(self, hierarchy_name, hierarchy_level):
        postgres_helper = PostgresHelper()
        query = f"SELECT CASE WHEN level_2_id IS null THEN id ELSE level_2_id END as state_id, name FROM hierarchy WHERE name = '{hierarchy_name}' AND level = {hierarchy_level}"
        rows = postgres_helper.select(query, 'registry_new')
        return rows[0]

    def get_state_id(self, hierarchy_name, hierarchy_level):
        return self.get_state_details(hierarchy_name, hierarchy_level).get('id')

