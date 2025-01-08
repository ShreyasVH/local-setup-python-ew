import os
import json
import logging
from datetime import datetime
from app.helpers.DatabaseHelper import DatabaseHelper
from app.helpers.FileHelper import FileHelper
from app.scripts.commonDefinitions import APP_PATH


try:
    directory_path = os.path.join(APP_PATH, 'data', 'tableCounts')

    file_helper = FileHelper()
    next_file_name = file_helper.get_next_file_name(directory_path)
    file_path = os.path.join(directory_path, f'{next_file_name}.json')

    database_helper = DatabaseHelper()
    table_counts = database_helper.get_table_counts()

    with open(file_path, 'w') as f:
        json.dump(table_counts, f, indent=4)

except Exception as e:
    logging.error(e)
    exit(255)
