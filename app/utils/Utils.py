import subprocess
import sys
from app.scripts.commonDefinitions import CURRENT_TIME
import xml.etree.ElementTree as ET
from xml.dom import minidom
import re
from datetime import datetime, timedelta
import os


def shell_exec_with_immediate_output(command):
    try:
        process = subprocess.Popen(command, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)

        while True:
            output = process.stdout.readline()
            if output == b'' and process.poll() is not None:
                break
            if output:
                sys.stdout.write(output.decode())
                sys.stdout.flush()

        stderr = process.stderr.read()
        if stderr:
            sys.stderr.write(stderr.decode())
            sys.stderr.flush()

        process.stdout.close()
        process.stderr.close()
        process.wait()
    except Exception as e:
        print(f"Unable to execute command: {e}")


def replace_time_strings(original_string):
    formatted_string = original_string

    current_time = CURRENT_TIME
    date_time_plus_day_strings = [
        "DATE_TIME_PLUS_0_DAY"
    ]

    date_time_minus_day_strings = []
    date_time_minus_day_date_first_strings = []

    utc_date_time_plus_minute_date_first_strings = []

    date_time_plus_minute_date_first_strings = []

    date_time_plus_minute_strings = []
    date_time_plus_day_date_first_strings = [
        'DATE_TIME_PLUS_0_DAY_DATE_FIRST'
    ]

    date_time_plus_minute_with_timezone_separation_strings = []

    utc_date_time_minus_day_with_timezone_separation_strings = []

    date_time_plus_minute_no_padding_strings = []

    utc_date_time_plus_minute_strings = []

    utc_date_time_plus_minute_with_micro_seconds_strings = []

    date_plus_day_strings = [
        "DATE_PLUS_0_DAY",
        "DATE_PLUS_79_DAY",
        "DATE_PLUS_109_DAY",
        "DATE_PLUS_167_DAY"
    ]

    date_minus_day_strings = [
        "DATE_MINUS_59_DAY",
        "DATE_MINUS_60_DAY",
        "DATE_MINUS_61_DAY",
        "DATE_MINUS_89_DAY",
        "DATE_MINUS_90_DAY",
        "DATE_MINUS_91_DAY",
        "DATE_MINUS_121_DAY"
    ]

    date_plus_day_date_first_strings = [
        'DATE_PLUS_0_DAY_DATE_FIRST'
    ]

    date_minus_day_date_first_strings = [
        'DATE_MINUS_60_DAY_DATE_FIRST',
        'DATE_MINUS_61_DAY_DATE_FIRST',
        'DATE_MINUS_90_DAY_DATE_FIRST',
        'DATE_MINUS_91_DAY_DATE_FIRST'
    ]

    utc_date_minus_day_date_first_strings = [
        'UTC_DATE_MINUS_50_DAY_DATE_FIRST',
        'UTC_DATE_MINUS_75_DAY_DATE_FIRST'
    ]

    date_only_plus_day_strings = [
        'DATE_ONLY_PLUS_0_DAY',
        'DATE_ONLY_PLUS_167_DAY'
    ]

    date_only_year_first_plus_day_strings = [
        'DATE_ONLY_YEAR_FIRST_PLUS_0_DAY'
    ]

    date_only_year_first_minus_day_strings = [
        'DATE_ONLY_YEAR_FIRST_MINUS_59_DAY',
        'DATE_ONLY_YEAR_FIRST_MINUS_60_DAY',
        'DATE_ONLY_YEAR_FIRST_MINUS_89_DAY',
        'DATE_ONLY_YEAR_FIRST_MINUS_90_DAY'
    ]

    date_only_minus_day_strings = [
        'DATE_ONLY_MINUS_60_DAY',
        'DATE_ONLY_MINUS_61_DAY',
        'DATE_ONLY_MINUS_90_DAY',
        'DATE_ONLY_MINUS_91_DAY',
        'DATE_ONLY_MINUS_180_DAY',
        'DATE_ONLY_MINUS_260_DAY',
        'DATE_ONLY_MINUS_340_DAY',
        'DATE_ONLY_MINUS_440_DAY',
        'DATE_ONLY_MINUS_510_DAY',
        'DATE_ONLY_MINUS_600_DAY',
        'DATE_ONLY_MINUS_700_DAY',
        'DATE_ONLY_MINUS_800_DAY',
        'DATE_ONLY_MINUS_900_DAY',
        'DATE_ONLY_MINUS_1000_DAY',
        'DATE_ONLY_MINUS_1008_DAY'
    ]

    timestamp_date_time_plus_day_strings = [
        'TIMESTAMP_DATE_TIME_PLUS_0_DAY'
    ]

    timestamp_date_time_plus_minute_strings = []

    utc_date_plus_day_strings = [
        'UTC_DATE_PLUS_0_DAY',
        'UTC_DATE_PLUS_79_DAY',
        'UTC_DATE_PLUS_109_DAY',
        'UTC_DATE_PLUS_165_DAY',
        'UTC_DATE_PLUS_166_DAY'
    ]

    utc_date_time_plus_day_strings = [
        'UTC_DATE_TIME_PLUS_0_DAY'
    ]

    utc_date_minus_day_strings = [
        'UTC_DATE_MINUS_50_DAY',
        'UTC_DATE_MINUS_59_DAY',
        'UTC_DATE_MINUS_60_DAY',
        'UTC_DATE_MINUS_61_DAY',
        'UTC_DATE_MINUS_75_DAY',
        'UTC_DATE_MINUS_89_DAY',
        'UTC_DATE_MINUS_90_DAY',
        'UTC_DATE_MINUS_91_DAY',
        'UTC_DATE_MINUS_180_DAY',
        'UTC_DATE_MINUS_260_DAY',
        'UTC_DATE_MINUS_340_DAY',
        'UTC_DATE_MINUS_440_DAY',
        'UTC_DATE_MINUS_510_DAY',
        'UTC_DATE_MINUS_600_DAY',
        'UTC_DATE_MINUS_700_DAY',
        'UTC_DATE_MINUS_800_DAY',
        'UTC_DATE_MINUS_900_DAY',
        'UTC_DATE_MINUS_1000_DAY',
        'UTC_DATE_MINUS_1008_DAY'

    ]

    date_plus_day_ddmmyy_strings = [
        'DATE_PLUS_0_DAY_DDMMYY'
    ]

    date_plus_day_ddmmyyyy_strings = [
        'DATE_PLUS_0_DAY_DDMMYYYY'
    ]

    date_plus_day_ddmmyy_hyphenated_strings = [
        'DATE_PLUS_0_DAY_DDMMYY_HYPHENATED'
    ]

    date_minus_day_ddmmyy_hyphenated_strings = [
        'DATE_MINUS_59_DAY_DDMMYY_HYPHENATED',
        'DATE_MINUS_60_DAY_DDMMYY_HYPHENATED',
        'DATE_MINUS_89_DAY_DDMMYY_HYPHENATED',
        'DATE_MINUS_90_DAY_DDMMYY_HYPHENATED'
    ]

    date_minus_day_ddmmyyyy_hyphenated_strings = [
        'DATE_MINUS_59_DAY_DDMMYYYY_HYPHENATED',
        'DATE_MINUS_60_DAY_DDMMYYYY_HYPHENATED',
        'DATE_MINUS_61_DAY_DDMMYYYY_HYPHENATED',
        'DATE_MINUS_89_DAY_DDMMYYYY_HYPHENATED',
        'DATE_MINUS_90_DAY_DDMMYYYY_HYPHENATED'
    ]

    for i in range(1, 36):
        timestamp_date_time_plus_minute_strings.append(f"TIMESTAMP_DATE_TIME_PLUS_{i}_MINUTE")
        utc_date_time_plus_minute_date_first_strings.append(f"UTC_DATE_TIME_PLUS_{i}_MINUTE_DATE_FIRST")
        date_time_plus_minute_date_first_strings.append(f"DATE_TIME_PLUS_{i}_MINUTE_DATE_FIRST")
        date_time_plus_minute_strings.append(f"DATE_TIME_PLUS_{i}_MINUTE")
        date_time_plus_minute_no_padding_strings.append(f"DATE_TIME_PLUS_{i}_MINUTE_NO_PADDING")
        utc_date_time_plus_minute_strings.append(f"UTC_DATE_TIME_PLUS_{i}_MINUTE")
        utc_date_time_plus_minute_with_micro_seconds_strings.append(f"UTC_DATE_TIME_PLUS_{i}_MINUTE_WITH_MICRO_SECONDS")
        date_time_plus_minute_with_timezone_separation_strings.append(f"DATE_TIME_PLUS_{i}_MINUTE_WITH_TIMEZONE_SEPARATION")
        utc_date_time_plus_day_strings.append(f"UTC_DATE_TIME_PLUS_{i}_DAY")

        date_time_plus_day_strings.append(f"DATE_TIME_PLUS_{i}_DAY")
        date_time_plus_day_date_first_strings.append(f"DATE_TIME_PLUS_{i}_DAY_DATE_FIRST")
        date_time_minus_day_strings.append(f"DATE_TIME_MINUS_{i}_DAY")
        date_time_minus_day_date_first_strings.append(f"DATE_TIME_MINUS_{i}_DAY_DATE_FIRST")
        date_plus_day_strings.append(f"DATE_PLUS_{i}_DAY")
        date_minus_day_strings.append(f"DATE_MINUS_{i}_DAY")
        date_only_plus_day_strings.append(f"DATE_ONLY_PLUS_{i}_DAY")
        date_only_year_first_plus_day_strings.append(f"DATE_ONLY_YEAR_FIRST_PLUS_{i}_DAY")
        date_only_year_first_minus_day_strings.append(f"DATE_ONLY_YEAR_FIRST_MINUS_{i}_DAY")
        date_only_minus_day_strings.append(f"DATE_ONLY_MINUS_{i}_DAY")
        utc_date_plus_day_strings.append(f"UTC_DATE_PLUS_{i}_DAY")
        utc_date_minus_day_strings.append(f"UTC_DATE_MINUS_{i}_DAY")
        date_minus_day_date_first_strings.append(f"DATE_MINUS_{i}_DAY_DATE_FIRST")
        utc_date_minus_day_date_first_strings.append(f"UTC_DATE_MINUS_{i}_DAY_DATE_FIRST")
        date_minus_day_ddmmyyyy_hyphenated_strings.append(f"DATE_MINUS_{i}_DAY_DDMMYYYY_HYPHENATED")
        date_minus_day_ddmmyy_hyphenated_strings.append(f"DATE_MINUS_{i}_DAY_DDMMYY_HYPHENATED")
        utc_date_time_minus_day_with_timezone_separation_strings.append(f"UTC_DATE_TIME_MINUS_{i}_DAY_WITH_TIMEZONE_SEPARATION")

    # Replace timestamp_date_time_plus_day_strings
    for string in timestamp_date_time_plus_day_strings:
        match = re.search(r"TIMESTAMP_DATE_TIME_PLUS_(\d+)_DAY", string)
        if match:
            days = int(match.group(1))
            timestamp = int((current_time + timedelta(days=days)).timestamp() * 1000)
            formatted_string = formatted_string.replace(f'"{string}"', str(timestamp))

    # Replace timestamp_date_time_plus_minute_strings
    for string in timestamp_date_time_plus_minute_strings:
        match = re.search(r"TIMESTAMP_DATE_TIME_PLUS_(\d+)_MINUTE", string)
        if match:
            minutes = int(match.group(1))
            timestamp = int((current_time + timedelta(minutes=minutes)).timestamp() * 1000)
            formatted_string = formatted_string.replace(f'"{string}"', str(timestamp))

    for string in utc_date_time_plus_day_strings:
        match = re.search(r"UTC_DATE_TIME_PLUS_(\d+)_DAY", string)
        if match:
            days = int(match.group(1))
            formatted_string = formatted_string.replace(string, (current_time + timedelta(days=days) - timedelta(hours=5) - timedelta(minutes=30)).strftime('%Y-%m-%d %H:%M:%S'))

    for string in utc_date_minus_day_date_first_strings:
        match = re.search(r"UTC_DATE_MINUS_(\d+)_DAY_DATE_FIRST", string)
        if match:
            days = int(match.group(1))
            formatted_string = formatted_string.replace(string, (datetime.strptime((current_time - timedelta(days=days)).strftime('%Y-%m-%d 00:00:00'), '%Y-%m-%d %H:%M:%S') - timedelta(hours=5) - timedelta(minutes=30)).strftime('%d-%m-%Y %H:%M:%S'))

    for string in utc_date_plus_day_strings:
        match = re.search(r"UTC_DATE_PLUS_(\d+)_DAY", string)
        if match:
            days = int(match.group(1))
            formatted_string = formatted_string.replace(string, (datetime.strptime((current_time + timedelta(days=days)).strftime('%Y-%m-%d 00:00:00'), '%Y-%m-%d %H:%M:%S') - timedelta(hours=5) - timedelta(minutes=30)).strftime('%Y-%m-%d %H:%M:%S'))

    for string in utc_date_minus_day_strings:
        match = re.search(r"UTC_DATE_MINUS_(\d+)_DAY", string)
        if match:
            days = int(match.group(1))
            formatted_string = formatted_string.replace(string, (datetime.strptime((current_time - timedelta(days=days)).strftime('%Y-%m-%d 00:00:00'), '%Y-%m-%d %H:%M:%S') - timedelta(hours=5) - timedelta(minutes=30)).strftime('%Y-%m-%d %H:%M:%S'))

    for string in utc_date_time_plus_minute_with_micro_seconds_strings:
        match = re.search(r"UTC_DATE_TIME_PLUS_(\d+)_MINUTE_WITH_MICRO_SECONDS", string)
        if match:
            minutes = int(match.group(1))
            formatted_string = formatted_string.replace(string, (current_time + timedelta(minutes=minutes) - timedelta(hours=5) - timedelta(minutes=30)).strftime('%Y-%m-%d %H:%M:%S.%f'))

    for string in utc_date_time_plus_minute_date_first_strings:
        match = re.search(r"UTC_DATE_TIME_PLUS_(\d+)_MINUTE_DATE_FIRST", string)
        if match:
            minutes = int(match.group(1))
            formatted_string = formatted_string.replace(string, (current_time + timedelta(minutes=minutes) - timedelta(hours=5) - timedelta(minutes=30)).strftime('%d-%m-%Y %H:%M:%S'))


    for string in utc_date_time_plus_minute_strings:
        match = re.search(r"UTC_DATE_TIME_PLUS_(\d+)_MINUTE", string)
        if match:
            minutes = int(match.group(1))
            formatted_string = formatted_string.replace(string, (current_time + timedelta(minutes=minutes) - timedelta(hours=5) - timedelta(minutes=30)).strftime('%Y-%m-%d %H:%M:%S'))

    for string in date_time_plus_day_date_first_strings:
        match = re.search(r"DATE_TIME_PLUS_(\d+)_DAY_DATE_FIRST", string)
        if match:
            days = int(match.group(1))
            new_date = (current_time + timedelta(days=days)).strftime("%d-%m-%Y %H:%M:%S")
            formatted_string = formatted_string.replace(string, new_date)

    for string in date_time_plus_day_strings:
        match = re.search(r"DATE_TIME_PLUS_(\d+)_DAY", string)
        if match:
            days = int(match.group(1))
            new_date = (current_time + timedelta(days=days)).strftime("%Y-%m-%d %H:%M:%S")
            formatted_string = formatted_string.replace(string, new_date)

    for string in date_time_minus_day_date_first_strings:
        match = re.search(r"DATE_TIME_MINUS_(\d+)_DAY_DATE_FIRST", string)
        if match:
            days = int(match.group(1))
            new_date = (current_time - timedelta(days=days)).strftime("%d-%m-%Y %H:%M:%S")
            formatted_string = formatted_string.replace(string, new_date)

    for string in utc_date_time_minus_day_with_timezone_separation_strings:
        match = re.search(r"UTC_DATE_TIME_MINUS_(\d+)_DAY_WITH_TIMEZONE_SEPARATION", string)
        if match:
            days = int(match.group(1))
            new_date = (datetime.strptime((current_time - timedelta(days=days)).strftime("%Y-%m-%d %00:%00:%00"), '%Y-%m-%d %H:%M:%S') - timedelta(hours=5) - timedelta(minutes=30)).strftime('%Y-%m-%dT%H:%M:%S')
            formatted_string = formatted_string.replace(string, new_date)

    for string in date_time_minus_day_strings:
        match = re.search(r"DATE_TIME_MINUS_(\d+)_DAY", string)
        if match:
            days = int(match.group(1))
            new_date = (current_time - timedelta(days=days)).strftime("%Y-%m-%d %H:%M:%S")
            formatted_string = formatted_string.replace(string, new_date)

    for string in date_time_plus_minute_date_first_strings:
        match = re.search(r"DATE_TIME_PLUS_(\d+)_MINUTE_DATE_FIRST", string)
        if match:
            minutes = int(match.group(1))
            new_date = (current_time + timedelta(minutes=minutes)).strftime("%d-%m-%Y %H:%M:%S")
            formatted_string = formatted_string.replace(string, new_date)

    for string in date_time_plus_minute_no_padding_strings:
        match = re.search(r"DATE_TIME_PLUS_(\d+)_MINUTE_NO_PADDING", string)
        if match:
            minutes = int(match.group(1))
            new_date = (current_time + timedelta(minutes=minutes)).strftime("%Y-%-m-%-d %-H:%-M:%-S")
            formatted_string = formatted_string.replace(string, new_date)

    for string in date_time_plus_minute_with_timezone_separation_strings:
        match = re.search(r"DATE_TIME_PLUS_(\d+)_MINUTE_WITH_TIMEZONE_SEPARATION", string)
        if match:
            minutes = int(match.group(1))
            new_date = (current_time + timedelta(minutes=minutes)).strftime("%Y-%m-%dT%H:%M:%S")
            formatted_string = formatted_string.replace(string, new_date)

    for string in date_time_plus_minute_strings:
        match = re.search(r"DATE_TIME_PLUS_(\d+)_MINUTE", string)
        if match:
            minutes = int(match.group(1))
            new_date = (current_time + timedelta(minutes=minutes)).strftime("%Y-%m-%d %H:%M:%S")
            formatted_string = formatted_string.replace(string, new_date)

    for string in date_plus_day_ddmmyy_hyphenated_strings:
        match = re.search(r"DATE_PLUS_(\d+)_DAY_DDMMYY_HYPHENATED", string)
        if match:
            days = int(match.group(1))
            new_date = (current_time + timedelta(days=days)).strftime("%d-%m-%y")
            formatted_string = formatted_string.replace(string, new_date)

    for string in date_plus_day_ddmmyyyy_strings:
        match = re.search(r"DATE_PLUS_(\d+)_DAY_DDMMYYYY", string)
        if match:
            days = int(match.group(1))
            new_date = (current_time + timedelta(days=days)).strftime("%d%m%Y")
            formatted_string = formatted_string.replace(string, new_date)

    for string in date_plus_day_ddmmyy_strings:
        match = re.search(r"DATE_PLUS_(\d+)_DAY_DDMMYY", string)
        if match:
            days = int(match.group(1))
            new_date = (current_time + timedelta(days=days)).strftime("%d%m%y")
            formatted_string = formatted_string.replace(string, new_date)

    for string in date_plus_day_date_first_strings:
        match = re.search(r"DATE_PLUS_(\d+)_DAY_DATE_FIRST", string)
        if match:
            days = int(match.group(1))
            new_date = (current_time + timedelta(days=days)).strftime("%d-%m-%Y 00:00:00")
            formatted_string = formatted_string.replace(string, new_date)

    for string in date_plus_day_strings:
        match = re.search(r"DATE_PLUS_(\d+)_DAY", string)
        if match:
            days = int(match.group(1))
            new_date = (current_time + timedelta(days=days)).strftime("%Y-%m-%d 00:00:00")
            formatted_string = formatted_string.replace(string, new_date)

    for string in date_minus_day_date_first_strings:
        match = re.search(r"DATE_MINUS_(\d+)_DAY_DATE_FIRST", string)
        if match:
            days = int(match.group(1))
            new_date = (current_time - timedelta(days=days)).strftime("%d-%m-%Y 00:00:00")
            formatted_string = formatted_string.replace(string, new_date)

    for string in date_minus_day_ddmmyy_hyphenated_strings:
        match = re.search(r"DATE_MINUS_(\d+)_DAY_DDMMYY_HYPHENATED", string)
        if match:
            days = int(match.group(1))
            new_date = (current_time - timedelta(days=days)).strftime("%d-%m-%y")
            formatted_string = formatted_string.replace(string, new_date)

    for string in date_minus_day_ddmmyyyy_hyphenated_strings:
        match = re.search(r"DATE_MINUS_(\d+)_DAY_DDMMYYYY_HYPHENATED", string)
        if match:
            days = int(match.group(1))
            new_date = (current_time - timedelta(days=days)).strftime("%d-%m-%Y")
            formatted_string = formatted_string.replace(string, new_date)

    for string in date_minus_day_strings:
        match = re.search(r"DATE_MINUS_(\d+)_DAY", string)
        if match:
            days = int(match.group(1))
            new_date = (current_time - timedelta(days=days)).strftime("%Y-%m-%d 00:00:00")
            formatted_string = formatted_string.replace(string, new_date)

    for string in date_only_year_first_plus_day_strings:
        match = re.search(r"DATE_ONLY_YEAR_FIRST_PLUS_(\d+)_DAY", string)
        if match:
            days = int(match.group(1))
            new_date = (current_time + timedelta(days=days)).strftime("%Y-%m-%d")
            formatted_string = formatted_string.replace(string, new_date)

    for string in date_only_year_first_minus_day_strings:
        match = re.search(r"DATE_ONLY_YEAR_FIRST_MINUS_(\d+)_DAY", string)
        if match:
            days = int(match.group(1))
            new_date = (current_time - timedelta(days=days)).strftime("%Y-%m-%d")
            formatted_string = formatted_string.replace(string, new_date)

    for string in date_only_plus_day_strings:
        match = re.search(r"DATE_ONLY_PLUS_(\d+)_DAY", string)
        if match:
            days = int(match.group(1))
            new_date = (current_time + timedelta(days=days)).strftime("%d-%m-%Y")
            formatted_string = formatted_string.replace(string, new_date)

    for string in date_only_minus_day_strings:
        match = re.search(r"DATE_ONLY_MINUS_(\d+)_DAY", string)
        if match:
            days = int(match.group(1))
            new_date = (current_time - timedelta(days=days)).strftime("%d-%m-%Y")
            formatted_string = formatted_string.replace(string, new_date)

    return formatted_string


def build_xml(element, array_data):
    for key, value in array_data.items():
        if isinstance(value, dict):
            child = ET.SubElement(element, key)
            build_xml(child, value)
        else:
            ET.SubElement(element, key).text = str(value)


def array2xml(file_name, array, root_element_tag, name_space_url):
    folder_name = os.path.abspath(os.path.dirname(file_name))
    if os.path.exists(folder_name):
        root = ET.Element(root_element_tag, xmlns=name_space_url)

        build_xml(root, array)

        xml_str = ET.tostring(root, encoding='utf-8').decode()

        dom = minidom.parseString(xml_str)
        pretty_xml_str = dom.toprettyxml(indent="  ")

        pretty_xml_str = "\n".join(pretty_xml_str.splitlines()[1:])

        with open(file_name, 'w') as f:
            f.write(pretty_xml_str)
