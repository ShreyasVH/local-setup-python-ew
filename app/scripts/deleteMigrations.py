import sys
import os
from app.scripts.commonDefinitions import APP_PATH, AUTO_INCREMENT_VERSION
from app.helpers.FileHelper import FileHelper

if len(sys.argv) > 1:
    try:
        required_version = int(sys.argv[1])
    except ValueError:
        print("Invalid version number provided.")
        sys.exit(1)
else:
    print("Missing version")
    sys.exit(1)

file_helper = FileHelper()
base_dir = os.path.join(APP_PATH, 'data/queries')

try:
    folders = file_helper.get_files(base_dir)

    for folder in folders:
        folder_path = os.path.join(base_dir, folder)
        if os.path.isdir(folder_path):
            queries = file_helper.get_files(folder_path)

            for query in queries:
                try:
                    index = query.find("_")
                    if index == -1:
                        continue

                    version = int(query[:index])
                    file_name = query[index + 1:]

                    if required_version < version < AUTO_INCREMENT_VERSION:
                        full_path = os.path.join(folder_path, query)
                        os.remove(full_path)

                except ValueError:
                    print(f"Skipping malformed query file: {query}")

except Exception as e:
    sys.exit(255)