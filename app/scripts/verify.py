import sys
from app.utils.Logger import Logger
from app.utils.Utils import shell_exec_with_immediate_output
from app.helpers.FileHelper import FileHelper
from app.scripts.commonDefinitions import APP_PATH
import os
import subprocess
from app.helpers.NikshayHelper import NikshayHelper

if len(sys.argv) > 1:
    starting_version = int(sys.argv[1])
    ending_version = starting_version
else:
    print("Usage: python app/scripts/verify.py <version>")
    sys.exit(1)

if len(sys.argv) > 2:
    ending_version = int(sys.argv[2])

episode_map = {
    574: [1],
    575: [2],
    576: [3],
    577: [4],
    578: [5],
    579: [6],
    580: [7],
    581: [8],
    582: [9],
    583: [10],
    585: [12],
    586: [13],
    587: [14],
    588: [15],
    589: [16],
    590: [17],
    591: [18],
    592: [19],
    593: [20],
    594: [21],
    595: [22],
    596: [23],
    597: [24],
    598: [25],
    599: [26],
    600: [27],
    601: [28],
    602: [29],
    603: [30],
    604: [31]
}

shell_exec_with_immediate_output(f"echo {os.getenv('USER_PASSWORD')} | sudo -S -p '' /usr/sbin/systemsetup -settimezone GMT")

print("\n")
print("Hit any key once nikshay is stopped")
print("\n")
input().strip()

Logger.info('verify', 'Destroying')
shell_exec_with_immediate_output('source .envrc && python3 app/scripts/destroy.py')

print("\n")
print("Hit any key once nikshay is started")
print("\n")
input().strip()

Logger.info('verify', 'Deleting unnecessary migrations')
shell_exec_with_immediate_output('python3 app/scripts/deleteMigrations.py ' + str(ending_version))

document_ids = []
for version in range(starting_version, ending_version + 1):
    Logger.info('verify', 'Toggling off current migration ' + str(version))
    shell_exec_with_immediate_output('python3 app/scripts/toggleMigrations.py ' + str(version) + ' 0')

    if version in episode_map:
        document_ids.extend(episode_map[version])

Logger.info('verify', 'Deleting unnecessary episode documents')
min_document_id = min(document_ids) if len(document_ids) > 0 else 9999999
file_helper = FileHelper()
documents_folder_path = os.path.join(APP_PATH, 'data', 'elasticDocuments', 'episode')
documents = file_helper.get_files(documents_folder_path)
for file_name in documents:
    document_id = int(file_name.replace('.json', ''))
    if document_id >= min_document_id:
        file_path = os.path.join(documents_folder_path, file_name)
        subprocess.run(['rm', file_path])

Logger.info('verify', 'Setting up')
shell_exec_with_immediate_output('source .envrc && python3 app/scripts/setup.py')

nikshay_helper = NikshayHelper()
Logger.info('verify', 'Warming Nikshay')
nikshay_helper.warmup()
Logger.info('verify', 'Warming Nikshay webapp')
nikshay_helper.warmup_webapp()


Logger.info('verify', 'Simulating')
shell_exec_with_immediate_output('source .envrc && python3 app/scripts/simulate.py ' + str(starting_version) + ' ' + str(ending_version))
Logger.info('verify', 'Getting current data state')
shell_exec_with_immediate_output('source .envrc && python3 app/scripts/getCurrentDataState.py')

print("\n")
print("Hit any key once nikshay is stopped")
print("\n")
input().strip()

Logger.info('verify', 'Destroying')
shell_exec_with_immediate_output('source .envrc && python3 app/scripts/destroy.py')

for version in range(starting_version, ending_version + 1):
    Logger.info('verify', 'Toggling on current migration ' + str(version))
    shell_exec_with_immediate_output('python3 app/scripts/toggleMigrations.py ' + str(version) + ' 1')

Logger.info('verify', 'Restoring documents')
for document_id in document_ids:
    file_path = f"{documents_folder_path}/{document_id}.json"
    shell_exec_with_immediate_output('git checkout ' + file_path)

Logger.info('verify', 'Setting up db queries')
shell_exec_with_immediate_output('source .envrc && python3 app/scripts/setup.py MINIMAL')

shell_exec_with_immediate_output(f"echo {os.getenv('USER_PASSWORD')} | sudo -S -p '' /usr/sbin/systemsetup -settimezone Asia/Calcutta")


