from app.utils.Logger import Logger
import os
from datetime import datetime

# Assuming you have the equivalent helper classes implemented in Python
# from helpers import DatabaseHelper, ElasticHelper, MQHelper, ServerHelper, ServiceHelper, RedisHelper
from app.helpers.ServiceHelper import ServiceHelper
from app.helpers.ServerHelper import ServerHelper
from app.helpers.DatabaseHelper import DatabaseHelper
from app.helpers.MQHelper import MQHelper
from app.helpers.ElasticHelper import ElasticHelper
from app.helpers.RedisHelper import RedisHelper


# Start services
Logger.info('destroy', 'Starting services')
service_helper = ServiceHelper()
service_helper.start_services()

# Stop servers
Logger.info('destroy', 'Stopping servers')
server_helper = ServerHelper()
server_helper.stop_servers()

# Destroy databases
Logger.info('destroy', 'Destroying databases')
database_helper = DatabaseHelper()
database_helper.destroy_databases()

# Delete queues
Logger.info('destroy', 'Deleting queues')
mq_helper = MQHelper()
mq_helper.delete_exchanges()
mq_helper.delete_queues()

# Delete indices
Logger.info('destroy', 'Deleting Indices')
elastic_helper = ElasticHelper()
elastic_helper.delete_indices()

# Clear cache
Logger.info('destroy', 'Clearing cache')
redis_helper = RedisHelper()
redis_helper.delete_all_keys()