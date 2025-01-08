import os
import json
from datetime import datetime
from tabulate import tabulate
from app.helpers.ServiceHelper import ServiceHelper

# Set timezone to Asia/Kolkata
os.environ['TZ'] = 'Asia/Kolkata'
datetime.now()  # This ensures the timezone is set correctly

# Define APP_PATH
APP_PATH = os.path.realpath(os.path.join(os.path.dirname(__file__), '../../'))

# Assuming necessary config or loader is already in place

# Create an instance of ServiceHelper
service_helper = ServiceHelper()

# Fetch services for bulk processing
services = service_helper.get_services_for_bulk()

# Create headers for the table
headers = ['Sl No', 'Service', 'Running']

# Prepare rows for the table
table_rows = []

for index, service in enumerate(services):
    if service_helper.is_enabled(service):
        is_running = service_helper.is_running(service)
        table_rows.append([index + 1, service, json.dumps(is_running)])

# Print the table using tabulate
print(tabulate(table_rows, headers=headers, tablefmt="grid"))
