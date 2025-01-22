import os
from app.helpers.PostgresHelper import PostgresHelper


class EpisodeHelper:
    def get_episode_id(self, first_name, last_name):
        postgres_helper = PostgresHelper()
        query = f"SELECT id FROM users WHERE first_name = '{first_name}' AND last_name = '{last_name}' ORDER BY id DESC"
        rows = postgres_helper.select(query, os.getenv('POSTGRES_PERSON_DB'))
        person_id = rows[0]['id']

        query = f"SELECT id FROM episode WHERE person_id = {person_id}"
        rows = postgres_helper.select(query, os.getenv('POSTGRES_TRANSITION_DB'))
        return rows[0]['id']