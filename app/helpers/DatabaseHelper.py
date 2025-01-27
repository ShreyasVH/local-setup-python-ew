import json
import os

from app.scripts.commonDefinitions import APP_PATH
from app.helpers.PostgresHelper import PostgresHelper
from app.helpers.MssqlHelper import MssqlHelper
from app.utils.Utils import replace_time_strings
from app.utils.Logger import Logger

class DatabaseHelper:
    def __init__(self):
        self._postgresHelper = PostgresHelper()
        self._mssqlHelper = MssqlHelper()

    def create_databases(self):
        with open(os.path.join(APP_PATH, 'data', 'config.json')) as f:
            config = json.load(f)

        for project, configs in config.items():
            databases = configs['databases']
            for database in databases:
                if database['type'] == 'postgres':
                    self._postgresHelper.create_database(database['name'])
                elif database['type'] == 'mssql':
                    self._mssqlHelper.create_database(database['name'])
                    pass

    def destroy_databases(self):
        with open(os.path.join(APP_PATH, 'data', 'config.json')) as f:
            config = json.load(f)

        for project, configs in config.items():
            databases = configs['databases']
            for database in databases:
                if database['type'] == 'postgres':
                    self._postgresHelper.drop_database(database['name'])
                elif database['type'] == 'mssql':
                    self._mssqlHelper.drop_database(database['name'])
                    pass

    def create_tables(self):
        with open(os.path.join(APP_PATH, 'data', 'config.json')) as f:
            config = json.load(f)

        for project, configs in config.items():
            databases = configs['databases']
            for database in databases:
                helper = None
                if database['type'] == 'postgres':
                    helper = self._postgresHelper
                elif database['type'] == 'mssql':
                    helper = self._mssqlHelper

                database_name = database['name']
                Logger.info('db', f"Executing queries for db - {database_name}")

                if 'additionalQueries' in database:
                    for file_name in database['additionalQueries']:
                        file_path = os.path.join(APP_PATH, 'data', 'queries', file_name)
                        self.execute_queries_in_file(file_path, database_name, helper)

                db_queries_path = os.path.join(APP_PATH, 'data', 'queries', database_name)
                if os.path.exists(db_queries_path):
                    files = sorted(os.listdir(db_queries_path))
                    for file_name in files:
                        if file_name in ['.', '..']:
                            continue
                        file_path = os.path.join(db_queries_path, file_name)
                        Logger.info('db', f"\tExecuting queries from file - {file_name}")
                        self.execute_queries_in_file(file_path, database_name, helper)

    def execute_queries_in_file(self, file_path, database_name, helper):
        with open(file_path, 'r') as f:
            content = f.read()

        queries = content.split('\r\n') if '\r' in content else content.split('\n')
        queries = [query.strip() for query in queries if query.strip() and query.strip()[0] != '#']

        for query in queries:
            query = replace_time_strings(query)
            Logger.info('db', query)
            helper.execute(query, database_name)

    def get_row_counts(self):
        excluded_tables = {
            'dbt_new': [
                'jobrunr_backgroundjobservers',
                'jobrunr_jobs',
                'jobrunr_jobs_stats',
                'jobrunr_metadata',
                'jobrunr_migrations',
                'jobrunr_recurring_jobs',
                'revinfo'
            ],
            'gateway_new': [
                'jobrunr_backgroundjobservers',
                'jobrunr_jobs',
                'jobrunr_jobs_stats',
                'jobrunr_metadata',
                'jobrunr_migrations',
                'jobrunr_recurring_jobs'
            ],
            'nikshay_new': [
                'Job',
                'State',
                'JobParameter',
                'AggregatedCounter',
                'Hash',
                'Counter',
                'JobQueue',
                'Server',
                'List',
                'Set',
                'Schema'
            ],
            'jobrunr': [
                'jobrunr_backgroundjobservers',
                'jobrunr_jobs',
                'jobrunr_jobs_stats',
                'jobrunr_metadata',
                'jobrunr_migrations',
                'jobrunr_recurring_jobs'
            ],
            'sso_new': [
                'sso_session'
            ],
            'transition_new': [
                'jobrunr_backgroundjobservers',
                'jobrunr_jobs',
                'jobrunr_jobs_stats',
                'jobrunr_metadata',
                'jobrunr_migrations',
                'jobrunr_recurring_jobs'
            ]
        }

        with open(os.path.join(APP_PATH, 'data', 'config.json')) as f:
            config = json.load(f)

        row_counts = {}
        for project, configs in config.items():
            databases = configs['databases']
            for database in databases:
                helper = self._postgresHelper if database['type'] == 'postgres' else self._mssqlHelper
                database_name = database['name']

                all_tables = helper.get_all_tables(database_name)
                database_row_counts = {}
                for table_name in all_tables:
                    if database_name in excluded_tables and table_name in excluded_tables[database_name]:
                        continue
                    database_row_counts[table_name] = helper.get_row_count(table_name, database_name)

                row_counts[database_name] = database_row_counts

        return row_counts

    def get_row_values(self):
        excluded_tables = {
            'adherence_new': ['flyway_schema_history'],
            'dbt_new': [
                'flyway_schema_history',
                'jobrunr_backgroundjobservers',
                'jobrunr_jobs',
                'jobrunr_jobs_stats',
                'jobrunr_metadata',
                'jobrunr_migrations',
                'jobrunr_recurring_jobs',
                'revinfo'
            ],
            'diagnostics_new': ['flyway_schema_history'],
            'dispensation_new': ['flyway_schema_history'],
            'gateway_new': [
                'flyway_schema_history',
                'jobrunr_backgroundjobservers',
                'jobrunr_jobs',
                'jobrunr_jobs_stats',
                'jobrunr_metadata',
                'jobrunr_migrations',
                'jobrunr_recurring_jobs'
            ],
            'hub_new': ['SchemaVersions'],
            'ins_new': ['flyway_schema_history'],
            'jobrunr': [
                'jobrunr_backgroundjobservers',
                'jobrunr_jobs',
                'jobrunr_jobs_stats',
                'jobrunr_metadata',
                'jobrunr_migrations',
                'jobrunr_recurring_jobs'
            ],
            'nikshay_archival_new': ['SchemaVersions'],
            'nikshay_new': [
                'Job',
                'State',
                'JobParameter',
                'AggregatedCounter',
                'Hash',
                'Counter',
                'JobQueue',
                'Server',
                'List',
                'Set',
                'Schema',
                'SchemaVersions'
            ],
            'nikshay_reports_new': [
                'transition_new_house_keeping'
            ],
            'nikshay_reports_webservice_new': ['table-data', 'table-log'],
            'pfms_new': [],
            'registry_new': [
                'flyway_schema_history',
                'hierarchy_associations_aud',
                'hierarchy_aud',
                'revinfo',
                'spatial_ref_sys'
            ],
            'sso_new': ['flyway_schema_history', 'sso_session'],
            'transition_new': [
                'flyway_schema_history',
                'jobrunr_backgroundjobservers',
                'jobrunr_jobs',
                'jobrunr_jobs_stats',
                'jobrunr_metadata',
                'jobrunr_migrations',
                'jobrunr_recurring_jobs'
            ],
            'user_service_new': ['flyway_schema_history']
        }

        with open(os.path.join(APP_PATH, 'data', 'config.json')) as f:
            config = json.load(f)

        row_values = {}
        for project, configs in config.items():
            databases = configs['databases']
            for database in databases:
                helper = self._postgresHelper if database['type'] == 'postgres' else self._mssqlHelper
                database_name = database['name']

                all_tables = helper.get_all_tables(database_name)
                database_row_values = {}
                for table_name in all_tables:
                    if database_name in excluded_tables and table_name in excluded_tables[database_name]:
                        continue
                    database_row_values[table_name] = helper.get_row_values(table_name, database_name)

                row_values[database_name] = database_row_values

        return row_values

    def get_table_counts(self):
        excluded_tables = {
            'dbt_new': [
                'jobrunr_backgroundjobservers',
                'jobrunr_jobs',
                'jobrunr_metadata',
                'jobrunr_migrations',
                'jobrunr_recurring_jobs'
            ],
            'gateway_new': [
                'jobrunr_backgroundjobservers',
                'jobrunr_jobs',
                'jobrunr_metadata',
                'jobrunr_migrations',
                'jobrunr_recurring_jobs'
            ],
            'jobrunr': [
                'jobrunr_backgroundjobservers',
                'jobrunr_jobs',
                'jobrunr_metadata',
                'jobrunr_migrations',
                'jobrunr_recurring_jobs'
            ],
            'nikshay_new': [
                'Job',
                'State',
                'JobParameter',
                'AggregatedCounter',
                'Hash',
                'Counter',
                'JobQueue',
                'Server',
                'List',
                'Set',
                'Schema'
            ],
            'transition_new': [
                'jobrunr_backgroundjobservers',
                'jobrunr_jobs',
                'jobrunr_metadata',
                'jobrunr_migrations',
                'jobrunr_recurring_jobs'
            ]
        }

        with open(os.path.join(APP_PATH, 'data', 'config.json')) as f:
            config = json.load(f)

        table_counts = {}
        for project, configs in config.items():
            databases = configs['databases']
            for database in databases:
                helper = self._postgresHelper if database['type'] == 'postgres' else self._mssqlHelper
                database_name = database['name']

                all_tables = helper.get_all_tables(database_name)
                if database_name in excluded_tables:
                    all_tables = [table for table in all_tables if table not in excluded_tables[database_name]]

                table_counts[database_name] = len(all_tables)

        return table_counts

    def get_column_counts(self):
        excluded_tables = {
            'dbt_new': [
                'jobrunr_backgroundjobservers',
                'jobrunr_jobs',
                'jobrunr_jobs_stats',
                'jobrunr_metadata',
                'jobrunr_migrations',
                'jobrunr_recurring_jobs'
            ],
            'gateway_new': [
                'jobrunr_backgroundjobservers',
                'jobrunr_jobs',
                'jobrunr_jobs_stats',
                'jobrunr_metadata',
                'jobrunr_migrations',
                'jobrunr_recurring_jobs'
            ],
            'nikshay_new': [
                'Job',
                'State',
                'JobParameter',
                'AggregatedCounter',
                'Hash',
                'Counter',
                'JobQueue',
                'Server',
                'List',
                'Set',
                'Schema'
            ],
            'jobrunr': [
                'jobrunr_backgroundjobservers',
                'jobrunr_jobs',
                'jobrunr_jobs_stats',
                'jobrunr_metadata',
                'jobrunr_migrations',
                'jobrunr_recurring_jobs'
            ],
            'transition_new': [
                'jobrunr_backgroundjobservers',
                'jobrunr_jobs',
                'jobrunr_jobs_stats',
                'jobrunr_metadata',
                'jobrunr_migrations',
                'jobrunr_recurring_jobs'
            ]
        }

        with open(os.path.join(APP_PATH, 'data', 'config.json')) as f:
            config = json.load(f)

        column_counts = {}
        for project, configs in config.items():
            databases = configs['databases']
            for database in databases:
                helper = self._postgresHelper if database['type'] == 'postgres' else self._mssqlHelper
                database_name = database['name']

                all_tables = helper.get_all_tables(database_name)
                database_column_counts = {}
                for table_name in all_tables:
                    if database_name in excluded_tables and table_name in excluded_tables[database_name]:
                        continue
                    database_column_counts[table_name] = len(helper.get_column_names(database_name, table_name))

                column_counts[database_name] = database_column_counts

        return column_counts

    def get_column_definitions(self):
        excluded_tables = {
            'adherence_new': ['flyway_schema_history'],
            'dbt_new': [
                'jobrunr_backgroundjobservers',
                'jobrunr_jobs',
                'jobrunr_jobs_stats',
                'jobrunr_metadata',
                'jobrunr_migrations',
                'jobrunr_recurring_jobs'
            ],
            'gateway_new': [
                'jobrunr_backgroundjobservers',
                'jobrunr_jobs',
                'jobrunr_jobs_stats',
                'jobrunr_metadata',
                'jobrunr_migrations',
                'jobrunr_recurring_jobs'
            ],
            'nikshay_new': [
                'Job',
                'State',
                'JobParameter',
                'AggregatedCounter',
                'Hash',
                'Counter',
                'JobQueue',
                'Server',
                'List',
                'Set',
                'Schema'
            ],
            'jobrunr': [
                'jobrunr_backgroundjobservers',
                'jobrunr_jobs',
                'jobrunr_jobs_stats',
                'jobrunr_metadata',
                'jobrunr_migrations',
                'jobrunr_recurring_jobs'
            ],
            'transition_new': [
                'jobrunr_backgroundjobservers',
                'jobrunr_jobs',
                'jobrunr_jobs_stats',
                'jobrunr_metadata',
                'jobrunr_migrations',
                'jobrunr_recurring_jobs'
            ]
        }

        with open(os.path.join(APP_PATH, 'data', 'config.json')) as f:
            config = json.load(f)

        column_definitions = {}
        for project, configs in config.items():
            databases = configs['databases']
            for database in databases:
                helper = self._postgresHelper if database['type'] == 'postgres' else self._mssqlHelper
                database_name = database['name']

                all_tables = helper.get_all_tables(database_name)
                database_column_definitions = {}
                for table_name in all_tables:
                    if database_name in excluded_tables and table_name in excluded_tables[database_name]:
                        continue
                    database_column_definitions[table_name] = helper.get_column_definitions(database_name, table_name)

                column_definitions[database_name] = database_column_definitions

        return column_definitions
