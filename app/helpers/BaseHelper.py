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
