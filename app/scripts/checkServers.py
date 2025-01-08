import os
import json
from datetime import datetime
from tabulate import tabulate
from app.helpers.ServerHelper import ServerHelper

# Set timezone to Asia/Kolkata
os.environ['TZ'] = 'Asia/Kolkata'
datetime.now()  # This ensures the timezone is set correctly

# Define APP_PATH
APP_PATH = os.path.realpath(os.path.join(os.path.dirname(__file__), '../../'))

# Assuming necessary config or loader is already in place

# Create an instance of ServiceHelper
server_helper = ServerHelper()

# Fetch services for bulk processing
servers = server_helper.get_servers_for_bulk()

# Create headers for the table
headers = ['Sl No', 'Service', 'Running']

# Prepare rows for the table
table_rows = []

for index, server in enumerate(servers):
    if server_helper.is_enabled(server):
        is_running = server_helper.is_running(server)
        table_rows.append([index + 1, server, json.dumps(is_running)])

# Print the table using tabulate
print(tabulate(table_rows, headers=headers, tablefmt="grid"))
