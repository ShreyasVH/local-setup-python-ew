import os
import json
import time
from datetime import datetime
from app.helpers.DatabaseHelper import DatabaseHelper
from app.helpers.FileHelper import FileHelper
from app.scripts.commonDefinitions import APP_PATH

try:
    directory_path = os.path.join(APP_PATH, 'data/rowValues')
    file_helper = FileHelper()
    next_file_name = file_helper.get_next_file_name(directory_path)
    file_path = os.path.join(directory_path, f'{next_file_name}.json')

    database_helper = DatabaseHelper()  # Assuming you have a DatabaseHelper class in Python
    row_values = database_helper.get_row_values()

    # for database_name

    with open(file_path, 'w') as f:
        json.dump(row_values, f, indent=4)

except Exception as e:
    print(str(e))
    exit(255)
