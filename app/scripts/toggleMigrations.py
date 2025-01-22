import os
import sys
import re
from app.scripts.commonDefinitions import APP_PATH
from datetime import datetime

if len(sys.argv) > 2:
    required_version = int(sys.argv[1])
    toggle_value = int(sys.argv[2])
else:
    print("Usage: python3 toggle_migrations.py <version> <toggle_value>")
    sys.exit(1)

try:
    # File Helper equivalent
    class FileHelper:
        @staticmethod
        def get_files(directory):
            return [f for f in os.listdir(directory) if os.path.isfile(os.path.join(directory, f))]

    file_helper = FileHelper()
    base_dir = os.path.join(APP_PATH, 'data/queries')
    folders = os.listdir(base_dir)
    version_map = []

    for folder in folders:
        folder_path = os.path.join(base_dir, folder)
        if os.path.isdir(folder_path):
            files = file_helper.get_files(folder_path)
            for file in files:
                index = file.find("_")
                version = int(file[:index])
                file_name = file[index + 1:]

                if version == required_version:
                    file_path = os.path.join(folder_path, file)

                    with open(file_path, 'r') as f:
                        content = f.read()

                    queries = content.split("\r\n") if '\r' in content else content.split("\n")
                    final_queries = []

                    for query in queries:
                        trimmed_query = query.strip()
                        replacement_query = trimmed_query

                        if toggle_value == 0:
                            replacement_query = re.sub(r'^INSERT', '#INSERT', replacement_query)
                            replacement_query = re.sub(r'^UPDATE', '#UPDATE', replacement_query)
                            replacement_query = re.sub(r'^SET', '#SET', replacement_query)
                        elif toggle_value == 1:
                            replacement_query = re.sub(r'^#INSERT', 'INSERT', replacement_query)
                            replacement_query = re.sub(r'^#UPDATE', 'UPDATE', replacement_query)
                            replacement_query = re.sub(r'^#SET', 'SET', replacement_query)

                        final_query = final_queries.append(query.replace(trimmed_query, replacement_query))

                    # Writing the modified content back to the file
                    with open(file_path, 'w') as f:
                        f.write("\n".join(final_queries))

except Exception as e:
    print(str(e))
    sys.exit(255)
