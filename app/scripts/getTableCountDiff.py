import os
import json
from functools import cmp_to_key
from app.scripts.commonDefinitions import APP_PATH
from app.helpers.FileHelper import FileHelper


try:
    os.environ['TZ'] = 'Asia/Kolkata'

    directory_path = APP_PATH + '/data/tableCounts'

    file_helper = FileHelper()
    files = file_helper.get_files(directory_path)

    files = sorted(files, key=lambda f: int(''.join(filter(str.isdigit, f))))

    diff = {}

    if len(files) > 1:
        new_counts_file_name = files[-1]
        old_counts_file_name = files[-2]

        new_counts_file_path = os.path.join(directory_path, new_counts_file_name)
        old_counts_file_path = os.path.join(directory_path, old_counts_file_name)

        print(new_counts_file_path)
        print(old_counts_file_path)

        with open(new_counts_file_path, 'r') as f:
            new_counts = json.load(f)

        with open(old_counts_file_path, 'r') as f:
            old_counts = json.load(f)

        for database_name, old_count in old_counts.items():
            new_count = new_counts.get(database_name, 0)

            if old_count != new_count:
                diff[database_name] = new_count - old_count

    file_path = os.path.join(APP_PATH, 'data', 'tableCountDiff.json')
    with open(file_path, 'w') as f:
        json.dump(diff, f, indent=4)

except Exception as e:
    print(str(e))
    exit(255)
