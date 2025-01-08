import sys
import os
from datetime import datetime
from app.helpers.ServerHelper import ServerHelper

os.environ['TZ'] = 'Asia/Kolkata'
datetime.now()

server_helper = ServerHelper()
servers = sys.argv[1:]

server_helper.stop_servers(servers)
