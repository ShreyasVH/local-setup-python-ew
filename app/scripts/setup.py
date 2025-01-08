import sys
import subprocess
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


eligible_modes = ['FULL', 'MINIMAL']
mode = 'FULL'

if len(sys.argv) > 1:
    mode_value = sys.argv[1]
    if mode_value in eligible_modes:
        mode = mode_value
    else:
        print("Invalid mode")
        sys.exit(1)

# Clear previous logs
Logger.info('setup', 'Clearing logs')
Logger.clear_logs('')

# Start services
service_helper = ServiceHelper()
Logger.info('setup', 'Starting services')
service_helper.start_services()

server_helper = ServerHelper()

if mode == 'FULL':
    server_helper.start_server(Server.INTERCEPTOR.value)
    api_helper = ApiHelper()
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
    subprocess.run(['python3', 'app/scripts/clearDataState.py'])
    subprocess.run(['python3', 'app/scripts/getCurrentDataState.py'])

    dbt_helper = DbtHelper()
    # Clear old dbt files and add new ones
    dbt_helper.clear_files()
    dbt_helper.add_files(False)

    # Start servers
    Logger.info('setup', 'Starting Servers')
    server_helper.start_servers()

subprocess.run(['python3', 'app/scripts/getCurrentDataState.py'])
subprocess.run(['python3', 'app/scripts/getDataDiff.py'])
