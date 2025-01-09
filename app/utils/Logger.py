import os
from datetime import datetime
import json
from app.scripts.commonDefinitions import APP_PATH, CURRENT_TIME

class Logger:
    MAX_LINES_PER_FILE = 50000
    MAX_FILE_SIZE = 2.5 * 1024 * 1024  # 2.5 MB
    LOG_FOLDER = os.path.join(APP_PATH, 'logs')  # Replace with your app's log folder path

    @staticmethod
    def log(filename_base, log_type, message, timestamp_required=True):
        log_folder = Logger.LOG_FOLDER
        os.makedirs(log_folder, exist_ok=True)

        all_logs_file_path = os.path.join(log_folder, 'all.log')

        message_for_all_logs = ''
        if timestamp_required:
            timestamp = CURRENT_TIME.strftime('[%d-%b-%Y %I:%M:%S %p]')
            message_for_all_logs = f"{timestamp} [ {filename_base} ] [ {log_type.upper()} ] - {message}"
            message = f"{timestamp} [ {log_type.upper()} ] - {message}"
        else:
            message_for_all_logs = f"[ {filename_base} ] [ {log_type.upper()} ] - {message}"
        # message = f"{message}\n"

        files = Logger.get_log_file_names_by_pattern(filename_base)
        files.sort(key=lambda x: x.lower())  # Case-insensitive sort

        if files:
            filename = os.path.splitext(files[-1])[0]
            file_path = os.path.join(log_folder, f"{filename}.log")

            if os.path.getsize(file_path) > Logger.MAX_FILE_SIZE:
                filename = f"{filename_base}_{len(files) + 1}"
        else:
            filename = filename_base

        file_path = os.path.join(log_folder, f"{filename}.log")

        with open(file_path, 'a') as file_handle:
            file_handle.write(message + "\n")

        with open(all_logs_file_path, 'a') as file_handle:
            file_handle.write(message_for_all_logs + "\n")

        trace = Logger.get_call_stack()
        # print('Trace:')
        # print(json.dumps(trace, indent=1))
        # print(len(trace))
        if len(trace) <= 5:
            print(message)

    @staticmethod
    def info(filename, message, timestamp_required=True):
        Logger.log(filename, 'info', message, timestamp_required)

    @staticmethod
    def error(filename, message, timestamp_required=True):
        Logger.log(filename, 'error', message, timestamp_required)

    @staticmethod
    def debug(filename, message, timestamp_required=True):
        if Logger.is_debug_required():
            Logger.log(filename, 'debug', message, timestamp_required)

    @staticmethod
    def clear_logs(filename_pattern):
        files = Logger.get_log_file_names_by_pattern(filename_pattern)
        for file in files:
            os.remove(os.path.join(Logger.LOG_FOLDER, file))

    @staticmethod
    def get_all_log_file_names():
        log_folder = Logger.LOG_FOLDER
        try:
            log_files = [file for file in os.listdir(log_folder) if file.endswith('.log')]
            log_files.sort(key=lambda x: x.lower())  # Case-insensitive sort
            return log_files
        except FileNotFoundError:
            return []

    @staticmethod
    def get_log_file_names_by_pattern(pattern):
        all_files = Logger.get_all_log_file_names()
        if pattern:
            return [file for file in all_files if pattern in file]
        return all_files

    @staticmethod
    def is_debug_required():
        return False

    @staticmethod
    def get_call_stack():
        import inspect
        return inspect.stack()
