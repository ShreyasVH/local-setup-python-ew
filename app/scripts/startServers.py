import sys
import os
from datetime import datetime

os.environ['TZ'] = 'Asia/Kolkata'
datetime.now()

# Importing service helper module
from app.helpers.ServerHelper import ServerHelper

# Instantiate the service helper
server_helper = ServerHelper()

# Services passed as command-line arguments (excluding script name)
servers = sys.argv[1:]

# Start the services
server_helper.start_servers(servers)
