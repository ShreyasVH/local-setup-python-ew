import os
from app.scripts.commonDefinitions import APP_PATH
import json
from app.helpers.FileHelper import FileHelper


def format_value(value):
    formatted_value = value
    if value is None:
        formatted_value = 'null'
    elif type(value) == bool:
        formatted_value = json.dumps(value)
    elif type(value) == int:
        formatted_value = str(value)
    return formatted_value


def get_query(data):
    if data.get('type') == 'INSERT':
        return get_insert_query(data)
    elif data.get('type') == 'AUTO_INCREMENT':
        return get_auto_increment_query(data)
    elif data.get('type') == 'UPDATE':
        return get_update_query(data)
    elif data.get('type') == 'DEFAULT':
        return get_default_query(data)


def get_insert_query(data):
    table_name = data.get('table')
    key_values = data.get('keyValues')
    return f"INSERT INTO {table_name} ({', '.join(key_values.keys())}) VALUES ({', '.join(format_value(value) for value in key_values.values())});"


def get_auto_increment_query(data):
    table_name = data.get('table')
    sequence_name = data.get('sequenceName')
    return f"SELECT SETVAL('{sequence_name}', (SELECT MAX(id) FROM {table_name}));"


def get_filter_string(key, value):
    if value is None:
        formatted_string = f"{key} IS NULL"
    elif type(value) == list:
        formatted_string = f"{key} IN ({', '.join(value)})"
    else:
        formatted_string = f"{key} = {format_value(value)}"

    return formatted_string


def get_update_query(data):
    table_name = data.get('table')
    key_values = data.get('keyValues')
    filters = data.get('filters')
    return f"UPDATE {table_name} SET {', '.join(key + ' = ' + format_value(value) for key, value in key_values.items())} WHERE {' AND '.join(get_filter_string(key, value) for key, value in filters.items())};"


def get_default_query(data):
    return data.get('query')


databases = {
    'iam': {
        'dbName': os.getenv('POSTGRES_IAM_DB')
    },
    'dbt': {
        'dbName': os.getenv('POSTGRES_DBT_DB')
    },
    'diagnostics': {
        'dbName': os.getenv('POSTGRES_DIAGNOSTICS_DB')
    },
    'dispensation': {
        'dbName': os.getenv('POSTGRES_DISPENSATION_DB')
    },
    'dataGateway': {
        'dbName': os.getenv('POSTGRES_DATA_GATEWAY_DB')
    },
    'hub': {
        'dbName': os.getenv('MSSQL_HUB_DB')
    },
    'ins': {
        'dbName': os.getenv('POSTGRES_INS_DB')
    },
    'nikshayArchival': {
        'dbName': os.getenv('MSSQL_NIKSHAY_ARCHIVAL_DB')
    },
    'nikshayReports': {
        'dbName': os.getenv('MSSQL_NIKSHAY_REPORTS_DB')
    },
    'nikshayReportsWebService': {
        'dbName': os.getenv('MSSQL_NIKSHAY_REPORTS_WEBSERVICE_DB')
    },
    'registry': {
        'dbName': os.getenv('POSTGRES_REGISTRY_DB')
    }
}

file_helper = FileHelper()
queries = []

for db, config in databases.items():
    database_name = config['dbName']

    file_path = os.path.join(APP_PATH, 'data', 'queryData', db + '.json')

    base_folder_path = os.path.join(APP_PATH, 'data', 'queries')
    os.makedirs(base_folder_path, exist_ok=True)

    folder_path = os.path.join(APP_PATH, 'data', 'queries', database_name)
    os.makedirs(folder_path, exist_ok=True)

    if os.path.exists(file_path):
        with open(file_path) as f:
            file_configs = json.load(f)

        for file_config in file_configs:
            version = file_config.get('version')
            name = file_config.get('name')

            file_name = file_helper.get_padded_version(version) + '_' + name + '.sql'
            query_file_path = os.path.join(APP_PATH, 'data', 'queries', database_name, file_name)
            # print(query_file_path)

            with open(query_file_path, 'w') as query_file:
                for section in file_config.get('sections'):
                    section_title = section.get('title')
                    if section_title != '':
                        query_file.write('# ' + section_title)
                        query_file.write('\n')

                    for sub_section in section.get('subSections'):
                        sub_section_title = sub_section.get('title')

                        if sub_section_title != '':
                            query_file.write('# ' + sub_section_title)
                            query_file.write('\n')

                        for query_data in sub_section.get('queries'):
                            table_name = query_data.get('table')

                            query_file.write('    ' + get_query(query_data))
                            query_file.write('\n')

                        query_file.write('\n')
