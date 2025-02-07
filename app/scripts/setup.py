import sys
# import subprocess
from app.utils.Logger import Logger
from datetime import datetime
# from app.helpers.ServiceHelper import ApiHelper, DatabaseHelper, DbtHelper, ElasticHelper, MQHelper, ServerHelper, ServiceHelper
from app.helpers.ServiceHelper import ServiceHelper
from app.helpers.ServerHelper import ServerHelper
from app.helpers.DatabaseHelper import DatabaseHelper
from app.helpers.MQHelper import MQHelper
from app.helpers.ElasticHelper import ElasticHelper
from app.enums.Server import Server
from app.helpers.ApiHelper import ApiHelper
from app.helpers.DbtHelper import DbtHelper
from app.utils.Utils import shell_exec_with_immediate_output


eligible_modes = ['FULL', 'MINIMAL']
mode = 'FULL'

if len(sys.argv) > 1:
    mode_value = sys.argv[1]
    if mode_value in eligible_modes:
        mode = mode_value
    else:
        print("Invalid mode")
        sys.exit(1)

if mode == 'FULL':
    # Clear previous logs
    Logger.info('setup', 'Clearing logs')
    Logger.clear_logs('')

# Start services
service_helper = ServiceHelper()
Logger.info('setup', 'Starting services')
service_helper.start_services()

server_helper = ServerHelper()

if mode == 'FULL':
    Logger.info('setup', 'Starting interceptor')
    server_helper.start_server(Server.INTERCEPTOR.value)
    api_helper = ApiHelper()
    Logger.info('setup', 'Clearing interceptor logs')
    api_helper.get(api_helper.get_endpoint(Server.INTERCEPTOR.value) + '/clear')

# Stop servers
Logger.info('setup', 'Stopping servers')
server_helper.stop_servers()

# Create databases and tables
database_helper = DatabaseHelper()
Logger.info('setup', 'Creating databases')
database_helper.create_databases()
Logger.info('setup', 'Creating tables')
database_helper.create_tables()

# Create queues and exchanges
mq_helper = MQHelper()
Logger.info('setup', 'Creating Queues')
mq_helper.add_queues()
Logger.info('setup', 'Creating Exchanges')
mq_helper.add_exchanges()

# Create elastic indices and populate documents
elastic_helper = ElasticHelper()
Logger.info('setup', 'Creating Indices')
elastic_helper.create_indices()
Logger.info('setup', 'Inserting documents')
elastic_helper.create_documents()

# Create cache values
if mode == 'FULL':
    Logger.info('setup', 'Clearing data state')
    shell_exec_with_immediate_output('python3 app/scripts/clearDataState.py')
    Logger.info('setup', 'Getting current data state')
    shell_exec_with_immediate_output('python3 app/scripts/getCurrentDataState.py')

    dbt_helper = DbtHelper()
    # Clear old dbt files and add new ones
    Logger.info('setup', 'Clearing dbt files')
    dbt_helper.clear_files()
    Logger.info('setup', 'Adding dbt files')
    dbt_helper.add_files(False)

    # Start servers
    Logger.info('setup', 'Starting Servers')
    server_helper.start_servers()

Logger.info('setup', 'Getting current data state')
shell_exec_with_immediate_output('python3 app/scripts/getCurrentDataState.py')
Logger.info('setup', 'Getting data diff')
shell_exec_with_immediate_output('python3 app/scripts/getDataDiff.py')
