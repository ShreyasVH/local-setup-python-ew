import os
from datetime import datetime
import pytz

timezone = pytz.timezone('Asia/Kolkata')

APP_PATH = os.path.realpath(os.path.join(os.path.dirname(os.path.dirname(os.path.dirname(__file__))), ''))
AUTO_INCREMENT_VERSION = 999
ACTUAL_VERSION_START = 502
MASTER_VALUES_VERSION = 401
UPDATE_QUERIES_VERSION_LIMIT = MASTER_VALUES_VERSION - 1
CURRENT_TIME = datetime.now(timezone)
