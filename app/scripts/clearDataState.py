import os
import shutil
from app.helpers.FileHelper import FileHelper
from app.scripts.commonDefinitions import APP_PATH


try:
    file_helper = FileHelper()
    directories = [
        'elasticCounts',
        'elasticValues',
        'rowCounts',
        'rowValues',
        'tableCounts',
        'columnCounts',
        'columnDefinitions'
    ]
    data_directory = os.path.join(APP_PATH, 'data')

    for directory in directories:
        full_path = os.path.join(data_directory, directory)
        files = file_helper.get_files(full_path)

        for file in files:
            file_path = os.path.join(full_path, file)
            os.remove(file_path)

except Exception as e:
    print(str(e))
    exit(255)
