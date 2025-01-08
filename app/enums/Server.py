from enum import Enum


class Server(Enum):
    INTERCEPTOR = 'interceptor'
    SSO = 'sso'
    DATA_GATEWAY = 'dataGateway'
    IAM = 'iam'
    PERSON = 'person'
    INS = 'ins'
    DISPENSATION = 'dispensation'
    DIAGNOSTICS = 'diagnostics'
    REGISTRY = 'registry'
    EPISODE = 'episode'
    DBT = 'dbt'
    NIKSHAY = 'nikshay'
    NIKSHAY_WEBAPP = 'nikshay_webapp'
