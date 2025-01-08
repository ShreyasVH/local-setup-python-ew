import os
import json
from app.helpers.FileHelper import FileHelper
from app.scripts.commonDefinitions import APP_PATH


def main():
    try:
        directory_path = os.path.join(APP_PATH, 'data', 'elasticCounts')
        file_helper = FileHelper()
        files = file_helper.get_files(directory_path)

        files.sort(key=lambda file: int(file_helper.get_num_from_file(file)))

        print(files)
        diff = {}

        if len(files) > 1:
            new_counts_file_name = files[-1]
            old_counts_file_name = files[-2]

            new_counts_file_path = os.path.join(directory_path, new_counts_file_name)
            old_counts_file_path = os.path.join(directory_path, old_counts_file_name)

            print(new_counts_file_path)
            print(old_counts_file_path)

            with open(new_counts_file_path, 'r') as file:
                new_counts = json.load(file)

            with open(old_counts_file_path, 'r') as file:
                old_counts = json.load(file)

            for index_name, old_count in old_counts.items():
                new_count = new_counts.get(index_name, 0)
                if old_count != new_count:
                    diff[index_name] = new_count - old_count

        file_path = os.path.join(APP_PATH, 'data', 'elasticCountDiff.json')
        with open(file_path, 'w') as file:
            json.dump(diff, file, indent=4)

    except Exception as e:
        print(e)
        exit(255)

if __name__ == "__main__":
    main()
