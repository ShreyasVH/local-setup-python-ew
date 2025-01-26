import os
import json
from datetime import datetime
from app.scripts.commonDefinitions import APP_PATH
from app.helpers.FileHelper import FileHelper

try:
    directory_path = os.path.join(APP_PATH, 'data', 'columnCounts')
    file_helper = FileHelper()
    files = file_helper.get_files(directory_path)

    # Sort files based on numeric value in filename
    files.sort(key=lambda f: int(file_helper.get_num_from_file(f)))

    # print(files)

    diff = {}

    if len(files) > 1:
        new_counts_file_name = files[-1]
        old_counts_file_name = files[-2]

        new_counts_file_path = os.path.join(directory_path, new_counts_file_name)
        old_counts_file_path = os.path.join(directory_path, old_counts_file_name)

        # print(new_counts_file_path)
        # print(old_counts_file_path)

        with open(new_counts_file_path, 'r') as f:
            new_counts = json.load(f)

        with open(old_counts_file_path, 'r') as f:
            old_counts = json.load(f)

        for database_name, column_counts in old_counts.items():
            database_diff = {}

            for table_name, old_count in column_counts.items():
                new_count = 0
                if database_name in new_counts and table_name in new_counts[database_name]:
                    new_count = new_counts[database_name][table_name]

                if old_count != new_count:
                    database_diff[table_name] = new_count - old_count

            if database_diff:
                diff[database_name] = database_diff

    file_path = os.path.join(APP_PATH, 'data', 'columnCountDiff.json')
    with open(file_path, 'w') as f:
        json.dump(diff, f, indent=4)

except Exception as e:
    print(str(e))
    exit(255)
