import sys
import os
from datetime import datetime

os.environ['TZ'] = 'Asia/Kolkata'
datetime.now()

# Importing service helper module
from app.helpers.ServiceHelper import ServiceHelper

# Instantiate the service helper
service_helper = ServiceHelper()

# Services passed as command-line arguments (excluding script name)
services = sys.argv[1:]

# Start the services
service_helper.stop_services(services)
