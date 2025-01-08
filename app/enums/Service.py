from enum import Enum


class Service(Enum):
    REDIS = 'redis'
    ELASTIC = 'elastic'
    HA_PROXY = 'haproxy'
    POSTGRES = 'postgres'
    MONGO = 'mongo'
    RMQ = 'rmq'
    MYSQL = 'mysql'
    MSSQL = 'mssql'
