from app.scripts.commonDefinitions import APP_PATH
from app.helpers.FileHelper import FileHelper
import os
import sys

if len(sys.argv) > 1:
    version = int(sys.argv[1])
else:
    print("Usage: python app/scripts/removeDataState.py <version>")
    sys.exit(1)

folders = [
    'rowCounts',
    'rowValues',
    'elasticCounts',
    'elasticValues',
    'tableCounts',
    'columnCounts',
    'columnDefinitions'
]


file_helper = FileHelper()

for folder in folders:
    folder_path = os.path.join(APP_PATH, 'data', folder)
    required_file_path = folder_path + '/' + str(version) + '.json'

    files = file_helper.get_files(folder_path)

    for file in files:
        file_path = folder_path + '/' + file

        if file_path == required_file_path:
            os.remove(file_path)
