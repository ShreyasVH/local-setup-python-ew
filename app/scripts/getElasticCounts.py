import os
import json
from app.helpers.ElasticHelper import ElasticHelper
from app.helpers.FileHelper import FileHelper
from app.scripts.commonDefinitions import APP_PATH

directory_path = os.path.join(APP_PATH, 'data/elasticCounts')
file_helper = FileHelper()
next_file_name = file_helper.get_next_file_name(directory_path)
file_path = os.path.join(directory_path, f'{next_file_name}.json')

elastic_helper = ElasticHelper()
row_counts = elastic_helper.get_row_counts()

with open(file_path, 'w') as file:
    json.dump(row_counts, file, indent=4)
