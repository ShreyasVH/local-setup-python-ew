import os
import json
import time
from datetime import datetime
from app.helpers.DatabaseHelper import DatabaseHelper
from app.helpers.FileHelper import FileHelper
from app.scripts.commonDefinitions import APP_PATH

os.environ['TZ'] = 'Asia/Kolkata'

try:
    directory_path = APP_PATH + '/data/columnDefinitions'
    file_helper = FileHelper()
    next_file_name = file_helper.get_next_file_name(directory_path)
    file_path = directory_path + '/' + str(next_file_name) + '.json'

    database_helper = DatabaseHelper()
    row_counts = database_helper.get_column_definitions()

    with open(file_path, 'w') as file:
        json.dump(row_counts, file, indent=4)

except Exception as e:
    print(e)
    exit(255)
