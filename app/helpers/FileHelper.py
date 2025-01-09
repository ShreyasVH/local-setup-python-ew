import os


class FileHelper:

    def get_files(self, directory_path):
        if os.path.isdir(directory_path):
            return [file_name for file_name in os.listdir(directory_path) if file_name not in ['.', '..']]
        return []

    def get_next_file_name(self, directory_path):
        files = self.get_files(directory_path)
        next_name = 1
        if len(files) > 0:
            next_name = max([self.get_num_from_file(file_name) for file_name in files]) + 1
        return next_name

    def get_num_from_file(self, file_name):
        return int(file_name.split('.')[0])

    def get_version_from_query_file(self, file_name):
        index = file_name.find('_')
        return int(file_name[:index])

    def get_padded_version(self, version):
        version_string_length = 3
        return ('000' + str(version))[-1 * version_string_length:]

