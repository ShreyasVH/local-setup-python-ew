import os
import json
import glob
from datetime import datetime
from app.scripts.commonDefinitions import APP_PATH
from app.helpers.FileHelper import FileHelper


try:
    directory_path = os.path.join(APP_PATH, 'data', 'rowCounts')
    file_helper = FileHelper()
    files = file_helper.get_files(directory_path)

    # Sort files by the extracted number from the file name
    files.sort(key=lambda f: int(file_helper.get_num_from_file(f)))

    diff = {}

    if len(files) > 1:
        new_counts_file_name = files[-1]
        old_counts_file_name = files[-2]

        new_counts_file_path = os.path.join(directory_path, new_counts_file_name)
        old_counts_file_path = os.path.join(directory_path, old_counts_file_name)

        with open(new_counts_file_path, 'r') as f:
            new_counts = json.load(f)

        with open(old_counts_file_path, 'r') as f:
            old_counts = json.load(f)

        for database_name, row_counts in old_counts.items():
            database_diff = {}

            for table_name, old_count in row_counts.items():
                new_count = 0
                if database_name in new_counts and table_name in new_counts[database_name]:
                    new_count = new_counts[database_name][table_name]
                if old_count != new_count:
                    database_diff[table_name] = new_count - old_count

            if database_diff:
                diff[database_name] = database_diff

    file_path = os.path.join(APP_PATH, 'data', 'rowCountDiff.json')
    with open(file_path, 'w') as f:
        json.dump(diff, f, indent=4)

except Exception as e:
    print(str(e))
    exit(255)
