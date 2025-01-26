import os
import json
import glob
from datetime import datetime
from app.helpers.FileHelper import FileHelper
from app.scripts.commonDefinitions import APP_PATH


try:
    directory_path = os.path.join(APP_PATH, 'data', 'columnDefinitions')
    file_helper = FileHelper()
    files = file_helper.get_files(directory_path)

    # Sort files based on the number in the filename
    files.sort(key=lambda f: file_helper.get_num_from_file(f))

    # print(files)
    diff = {}

    if len(files) > 1:
        new_definitions_file_name = files[-1]
        old_definitions_file_name = files[-2]

        new_definitions_file_path = os.path.join(directory_path, new_definitions_file_name)
        old_definitions_file_path = os.path.join(directory_path, old_definitions_file_name)

        # print(new_definitions_file_path)
        # print(old_definitions_file_path)

        with open(new_definitions_file_path, 'r') as f:
            new_definition_maps = json.load(f)

        with open(old_definitions_file_path, 'r') as f:
            old_definition_maps = json.load(f)

        for database_name, table_definitions in old_definition_maps.items():
            database_diff = {}
            for table_name, old_definitions in table_definitions.items():
                table_diff = {}
                for column_name, old_definition in old_definitions.items():
                    column_diff = []
                    if (database_name in new_definition_maps and
                            table_name in new_definition_maps[database_name] and
                            column_name in new_definition_maps[database_name][table_name]):

                        new_definition = new_definition_maps[database_name][table_name][column_name]

                        for key, old_value in old_definition.items():
                            new_value = new_definition.get(key)
                            if old_value != new_value:
                                column_diff.append({
                                    'key': key,
                                    'oldValue': old_value,
                                    'newValue': new_value
                                })

                    if column_diff:
                        table_diff[column_name] = column_diff

                if table_diff:
                    database_diff[table_name] = table_diff

            if database_diff:
                diff[database_name] = database_diff

    file_path = os.path.join(APP_PATH, 'data', 'columnDefinitionDiff.json')
    with open(file_path, 'w') as f:
        json.dump(diff, f, indent=4)

except Exception as e:
    print(e)
    exit(255)

