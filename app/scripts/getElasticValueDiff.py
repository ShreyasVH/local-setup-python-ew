import json
import os
from datetime import datetime
from app.scripts.commonDefinitions import APP_PATH
from app.helpers.FileHelper import FileHelper

buffer_in_minutes = 60 * 2

date_time_fields = {
    'episode': {
        'createdDate': {
            'format': '%Y-%m-%d %H:%M:%S',
            'additionalData': []
        },
        'lastActivityDate': {
            'format': '%Y-%m-%d %H:%M:%S',
            'additionalData': []
        }
    }
}

timestamp_fields = {
    'episode': {
        'stageData.mobileList.createdAt': {
            'multiplier': 1000
        },
        'stageData.mobileList.updatedAt': {
            'multiplier': 1000
        }
    }
}

def compare_datetime(old_value, new_value, format):
    global buffer_in_minutes

    if '.' in new_value:
        new_value = new_value.split('.')[0]

    if '.' in old_value:
        old_value = old_value.split('.')[0]

    new_value = datetime.strptime(new_value, format)
    old_value = datetime.strptime(old_value, format)

    return abs(int((new_value.timestamp() - old_value.timestamp()) / 60)) > buffer_in_minutes

def compare_timestamp(index_name, old_value, new_value, full_path):
    global buffer_in_minutes
    global timestamp_fields

    data = timestamp_fields[index_name][full_path]
    multiplier = data['multiplier']
    return abs(int((new_value - old_value) / (60 * multiplier))) > buffer_in_minutes

def is_date_time_field(index_name, full_path, format_ref):
    global date_time_fields
    is_date_time_field_check = index_name in date_time_fields and full_path in date_time_fields[index_name]
    if is_date_time_field_check:
        field_data = date_time_fields[index_name][full_path]
        format_ref[0] = field_data['format']

    return is_date_time_field_check

def is_timestamp_field(index_name, full_path):
    global timestamp_fields
    return index_name in timestamp_fields and full_path in timestamp_fields[index_name]

def compare(index_name, column, old_value, new_value, old_row, full_path=[]):
    global buffer_in_minutes
    global date_time_fields
    global timestamp_fields

    different_values = True
    differences = {}
    full_path_string = '.'.join(full_path + [column])
    format_ref = ['']

    if is_date_time_field(index_name, full_path_string, format_ref):
        different_values = compare_datetime(old_value, new_value, format_ref[0])
        if different_values:
            differences = {
                'oldValue': old_value,
                'newValue': new_value
            }
    elif is_timestamp_field(index_name, full_path_string):
        different_values = compare_timestamp(index_name, old_value, new_value, full_path_string)
        if different_values:
            differences = {
                'oldValue': old_value,
                'newValue': new_value
            }
    elif isinstance(old_value, dict) and isinstance(new_value, dict):
        different_values = False
        inner_extra = []
        inner_missing = []
        inner_mismatches = {}

        for inner_key, inner_value_old in old_value.items():
            inner_value_new = new_value.get(inner_key, None)
            if inner_key in new_value:
                inner_differences = compare(index_name, inner_key, inner_value_old, inner_value_new, old_value, full_path + [column])
                if inner_differences:
                    inner_mismatches[inner_key] = inner_differences
            else:
                inner_missing.append(inner_key)

        for inner_key, inner_value_new in new_value.items():
            if inner_key not in old_value:
                inner_extra.append(inner_key)

        if inner_missing or inner_extra or inner_mismatches:
            inner_differences = {}
            if inner_missing:
                inner_differences['missing'] = inner_missing
            if inner_extra:
                inner_differences['extra'] = inner_extra
            if inner_mismatches:
                inner_differences['mismatches'] = inner_mismatches
            differences = inner_differences
    elif isinstance(old_value, list) and isinstance(new_value, list):
        different_values = False
        inner_extra = []
        inner_missing = []
        inner_mismatches = {}
        index = 0
        for inner_value_old in old_value:
            inner_value_new = None
            if len(new_value) > index:
                inner_value_new = new_value[index]
                inner_differences = compare(index_name, column, inner_value_old, inner_value_new, old_value, full_path)
                if len(inner_differences.keys()) > 0:
                    inner_mismatches[index] = inner_differences
            else:
                inner_missing.append(inner_value_old)
            index += 1

        index = 0
        for inner_value_new in new_value:
            inner_value_old = None
            if len(old_value) <= index:
                inner_extra.append(inner_value_new)
            index += 1

        if len(inner_missing) + len(inner_extra) + len(inner_mismatches.keys()) > 0:
            inner_differences = {}
            if len(inner_missing) > 0:
                inner_differences['missing'] = inner_missing
            if len(inner_extra) > 0:
                inner_differences['extra'] = inner_extra
            if len(inner_mismatches.keys()) > 0:
                inner_differences['mismatches'] = inner_mismatches
            differences = inner_differences
    else:
        different_values = new_value != old_value
        if different_values:
            differences = {
                'oldValue': old_value,
                'newValue': new_value
            }

    return differences

try:
    file_helper = FileHelper()
    directory_path = os.path.join(APP_PATH, 'data', 'elasticValues')
    files = file_helper.get_files(directory_path)

    files.sort(key=lambda file: int(file_helper.get_num_from_file(file)))

    diff = {}

    if len(files) > 1:
        new_values_file_name = files[-1]
        old_values_file_name = files[-2]

        new_values_file_path = os.path.join(directory_path, new_values_file_name)
        old_values_file_path = os.path.join(directory_path, old_values_file_name)

        # print(new_values_file_path)
        # print(old_values_file_path)

        with open(new_values_file_path, 'r') as file:
            new_values_data = json.load(file)
        with open(old_values_file_path, 'r') as file:
            old_values_data = json.load(file)

        for index_name, old_values in old_values_data.items():
            index_diff = {}

            if old_values:
                id_column = 'id'
                if id_column in old_values[0]:
                    old_values_by_id = {old_value[id_column]: old_value for old_value in old_values}
                    new_values = new_values_data.get(index_name, [])
                    new_values_by_id = {new_value[id_column]: new_value for new_value in new_values}

                    for old_row in old_values:
                        row_diff = {}

                        try:
                            id = old_row[id_column]
                            if id not in new_values_by_id:
                                index_diff[id] = ['Deleted']
                            else:
                                new_row = new_values_by_id[id]

                                missing = []
                                extra = []
                                mismatches = {}

                                for column, old_value in old_row.items():
                                    if column in new_row:
                                        new_value = new_row[column]
                                        field_mismatches = compare(index_name, column, old_value, new_value, old_row)
                                        if field_mismatches:
                                            mismatches[column] = field_mismatches
                                    else:
                                        missing.append(column)

                                for column, new_value in new_row.items():
                                    if column not in old_row:
                                        extra.append(column)

                                if missing or extra or mismatches:
                                    differences = {}
                                    if missing:
                                        differences['missing'] = missing
                                    if extra:
                                        differences['extra'] = extra
                                    if mismatches:
                                        differences['mismatches'] = mismatches
                                    index_diff[id] = differences

                        except Exception as e:
                            print(e)
                            # print(index_name)
                            # print(old_row)
                            # print(new_row)

                else:
                    print(f'####################### No id column in {index_name}')

            if index_diff:
                diff[index_name] = index_diff

        file_path = os.path.join(APP_PATH, 'data', 'elasticValueDiff.json')
        with open(file_path, 'w') as file:
            json.dump(diff, file, indent=4)

except Exception as e:
    print(e)
    exit(255)
