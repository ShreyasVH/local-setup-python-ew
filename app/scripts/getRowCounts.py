import os
import json
import datetime
from app.helpers.FileHelper import FileHelper
from app.helpers.DatabaseHelper import DatabaseHelper
from app.scripts.commonDefinitions import APP_PATH


try:
    directory_path = os.path.join(APP_PATH, 'data', 'rowCounts')
    file_helper = FileHelper()
    next_file_name = file_helper.get_next_file_name(directory_path)
    file_path = os.path.join(directory_path, f'{next_file_name}.json')

    database_helper = DatabaseHelper()
    row_counts = database_helper.get_row_counts()

    with open(file_path, 'w') as f:
        json.dump(row_counts, f, indent=4)

except Exception as e:
    print(e)
    exit(255)
