import os
import subprocess
import time
from app.enums.Service import Service
from app.utils.Logger import Logger

class ServiceHelper:
    MAX_START_TIME = 3 * 60  # 3 minutes

    enabled_services = [
        Service.REDIS.value,
        Service.ELASTIC.value,
        Service.MONGO.value,
        Service.HA_PROXY.value,
        Service.MYSQL.value,
        Service.RMQ.value,
        Service.POSTGRES.value,
        # Service.MSSQL.value
    ]

    services_order = [
        Service.HA_PROXY.value,
        Service.POSTGRES.value,
        "RSYSLOG",
        Service.MYSQL.value,
        Service.ELASTIC.value,
        Service.REDIS.value,
        "MEMCACHED",
        Service.MONGO.value,
        Service.RMQ.value,
        "NEO4J",
        "SOLR",
        Service.MSSQL.value,
        "SSH",
    ]

    services_for_bulk = [
        Service.HA_PROXY.value,
        Service.POSTGRES.value,
        Service.MSSQL.value,
        "RSYSLOG",
        Service.MYSQL.value,
        Service.ELASTIC.value,
        Service.REDIS.value,
        "MEMCACHED",
        Service.MONGO.value,
        Service.RMQ.value,
        "NEO4J",
        "SOLR",
        "SSH",
    ]

    def _is_service_running(self, service, port_env):
        command = f"lsof -i:{os.getenv(port_env)} -t"
        response = subprocess.run(command, shell=True, capture_output=True, text=True)
        pid_list = response.stdout.strip().split('\n') if response.stdout.strip() else []
        return bool(pid_list)

    def _start_service(self, service, version_env, folder_path):
        command = f"cd {folder_path} && bash -c 'source {folder_path}/.envrc && bash start.sh'"
        subprocess.run(command, shell=True)

    def _stop_service(self, service, version_env, folder_path):
        command = f"cd {folder_path} && bash -c 'source .envrc && bash stop.sh'"
        subprocess.run(command, shell=True)

    def is_enabled(self, service):
        return service in self.enabled_services

    def is_running(self, service):
        method_name = f"_is_{service.lower()}_running"
        if hasattr(self, method_name):
            return getattr(self, method_name)()
        return False

    def start_service(self, service):
        if not self.is_enabled(service):
            raise Exception('Service Not Enabled')
        elif self.is_running(service):
            print('already running')
            return

        start_time = time.time()
        started = False

        method = f"_start_{service.lower()}"
        if hasattr(self, method):
            Logger.info('service', f"Trying to start service - {service}")
            getattr(self, method)()

            while not started and (time.time() - start_time) < self.MAX_START_TIME:
                started = self.is_running(service)

        return started

    def stop_service(self, service):
        if not self.is_enabled(service):
            raise Exception('Service Not Enabled')
        elif not self.is_running(service):
            raise Exception('Service Not Running')

        method = f"_stop_{service.lower()}"
        return hasattr(self, method) and getattr(self, method)() and not self.is_running(service)

    def restart_service(self, service):
        if not self.is_enabled(service):
            raise Exception('Service Not Enabled')
        elif self.is_running(service):
            self.stop_service(service)
        return self.start_service(service)

    def start_services(self, service_list=None):
        if not service_list:
            service_list = self.services_for_bulk
        for service in self.services_order:
            if service in service_list and self.is_enabled(service) and not self.is_running(service):
                Logger.info('service', f"Starting Service - {service}")
                self.start_service(service)

    def stop_services(self, service_list=None):
        if not service_list:
            service_list = self.services_for_bulk
        for service in self.services_order:
            if service in service_list and self.is_enabled(service) and self.is_running(service):
                Logger.info('service', f"Stopping Service - {service}")
                self.stop_service(service)


    def get_services_for_bulk(self):
        return self.services_for_bulk

    def _is_redis_running(self):
        redis_port = os.getenv('REDIS_PORT')
        command = f"lsof -i:{redis_port} -t"
        response = subprocess.run(command, shell=True, capture_output=True, text=True)
        pid_list = response.stdout.strip().split('\n') if response.stdout.strip() else []
        return bool(pid_list)

    def _is_elastic_running(self):
        port = os.getenv('ELASTIC_PORT')
        command = f"lsof -i:{port} -t"
        response = subprocess.run(command, shell=True, capture_output=True, text=True)
        pid_list = response.stdout.strip().split('\n') if response.stdout.strip() else []
        return bool(pid_list)

    def _is_haproxy_running(self):
        port = 80
        command = 'echo ' + os.getenv('USER_PASSWORD') + ' | sudo -S -p "" lsof -i:' + str(port) + ' -t'
        response = subprocess.run(command, shell=True, capture_output=True, text=True)
        pid_list = response.stdout.strip().split('\n') if response.stdout.strip() else []
        return bool(pid_list)

    def _is_postgres_running(self):
        port = os.getenv('POSTGRES_PORT')
        command = 'echo ' + os.getenv('USER_PASSWORD') + ' | sudo -S -p "" lsof -i:' + str(port) + ' -t'
        response = subprocess.run(command, shell=True, capture_output=True, text=True)
        pid_list = response.stdout.strip().split('\n') if response.stdout.strip() else []
        return bool(pid_list)

    def _is_mongo_running(self):
        port = os.getenv('MONGO_PORT')
        command = 'echo ' + os.getenv('USER_PASSWORD') + ' | sudo -S -p "" lsof -i:' + str(port) + ' -t'
        response = subprocess.run(command, shell=True, capture_output=True, text=True)
        pid_list = response.stdout.strip().split('\n') if response.stdout.strip() else []
        return bool(pid_list)

    def _is_rmq_running(self):
        port = os.getenv('RMQ_PORT')
        command = 'echo ' + os.getenv('USER_PASSWORD') + ' | sudo -S -p "" lsof -i:' + str(port) + ' -t'
        response = subprocess.run(command, shell=True, capture_output=True, text=True)
        pid_list = response.stdout.strip().split('\n') if response.stdout.strip() else []
        return bool(pid_list)

    def _is_mysql_running(self):
        port = os.getenv('MYSQL_PORT')
        command = 'echo ' + os.getenv('USER_PASSWORD') + ' | sudo -S -p "" lsof -i:' + str(port) + ' -t'
        response = subprocess.run(command, shell=True, capture_output=True, text=True)
        pid_list = response.stdout.strip().split('\n') if response.stdout.strip() else []
        return bool(pid_list)

    def _start_redis(self):
        redis_version = os.getenv('REDIS_VERSION')
        folder_path = '~/programs/redis/' + redis_version
        command = 'cd ' + folder_path + ' && bash -c "source ' + folder_path + '/.envrc && bash start.sh"'
        subprocess.run(command, shell=True)

    def _start_elastic(self):
        version = os.getenv('ELASTIC_VERSION')
        folder_path = '~/programs/elasticsearch/' + version
        command = 'cd ' + folder_path + ' && bash -c "source ' + folder_path + '/.envrc && bash start.sh"'
        subprocess.run(command, shell=True)

    def _start_haproxy(self):
        version = os.getenv('HAPROXY_VERSION')
        folder_path = '~/programs/haproxy/' + version
        command = 'cd ' + folder_path + ' && bash -c "source ' + folder_path + '/.envrc && bash start.sh"'
        subprocess.run(command, shell=True)

    def _start_postgres(self):
        version = os.getenv('POSTGRES_VERSION')
        folder_path = '~/programs/postgres/' + version
        command = 'cd ' + folder_path + ' && bash -c "source ' + folder_path + '/.envrc && bash start.sh"'
        subprocess.run(command, shell=True)

    def _start_mongo(self):
        version = os.getenv('MONGO_VERSION')
        folder_path = '~/programs/mongo/' + version
        command = 'cd ' + folder_path + ' && bash -c "source ' + folder_path + '/.envrc && bash start.sh"'
        subprocess.run(command, shell=True)

    def _start_rmq(self):
        version = os.getenv('RMQ_VERSION')
        folder_path = '~/programs/rmq/' + version
        command = 'cd ' + folder_path + ' && bash -c "source ' + folder_path + '/.envrc && bash start.sh"'
        subprocess.run(command, shell=True)

    def _start_mysql(self):
        version = os.getenv('MYSQL_VERSION')
        folder_path = '~/programs/mysql/' + version
        command = 'cd ' + folder_path + ' && bash -c "source ' + folder_path + '/.envrc && bash start.sh"'
        subprocess.run(command, shell=True)

    def _stop_redis(self):
        redis_version = os.getenv('REDIS_VERSION')
        folder_path = '~/programs/redis/' + redis_version
        command = 'cd ' + folder_path + ' && bash -c "source ' + folder_path + '/.envrc && bash stop.sh"'
        subprocess.run(command, shell=True)

    def _stop_elastic(self):
        version = os.getenv('ELASTIC_VERSION')
        folder_path = '~/programs/elasticsearch/' + version
        command = 'cd ' + folder_path + ' && bash -c "source ' + folder_path + '/.envrc && bash stop.sh"'
        subprocess.run(command, shell=True)

    def _stop_haproxy(self):
        version = os.getenv('HAPROXY_VERSION')
        folder_path = '~/programs/haproxy/' + version
        command = 'cd ' + folder_path + ' && bash -c "source ' + folder_path + '/.envrc && bash stop.sh"'
        subprocess.run(command, shell=True)

    def _stop_postgres(self):
        version = os.getenv('POSTGRES_VERSION')
        folder_path = '~/programs/postgres/' + version
        command = 'cd ' + folder_path + ' && bash -c "source ' + folder_path + '/.envrc && bash stop.sh"'
        subprocess.run(command, shell=True)

    def _stop_mongo(self):
        version = os.getenv('MONGO_VERSION')
        folder_path = '~/programs/mongo/' + version
        command = 'cd ' + folder_path + ' && bash -c "source ' + folder_path + '/.envrc && bash stop.sh"'
        subprocess.run(command, shell=True)

    def _stop_rmq(self):
        version = os.getenv('RMQ_VERSION')
        folder_path = '~/programs/rmq/' + version
        command = 'cd ' + folder_path + ' && bash -c "source ' + folder_path + '/.envrc && bash stop.sh"'
        subprocess.run(command, shell=True)

    def _stop_mysql(self):
        version = os.getenv('MYSQL_VERSION')
        folder_path = '~/programs/mysql/' + version
        command = 'cd ' + folder_path + ' && bash -c "source ' + folder_path + '/.envrc && bash stop.sh"'
        subprocess.run(command, shell=True)