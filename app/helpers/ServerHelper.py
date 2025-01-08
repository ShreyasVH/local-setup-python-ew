import subprocess
import json
import time
import os
from app.scripts.commonDefinitions import APP_PATH
from app.helpers.ApiHelper import ApiHelper
from app.enums.Server import Server
from app.utils.Logger import Logger

class ServerHelper:
    MAX_START_TIME = 5 * 60

    _enabled_servers = [
        Server.IAM.value,
        Server.SSO.value,
        Server.PERSON.value,
        Server.DATA_GATEWAY.value,
        Server.INS.value,
        Server.REGISTRY.value,
        Server.EPISODE.value,
        Server.DISPENSATION.value,
        Server.DIAGNOSTICS.value,
        Server.INTERCEPTOR.value,
        Server.DBT.value
    ]

    _servers_order = [
        Server.INTERCEPTOR.value,
        Server.SSO.value,
        Server.DATA_GATEWAY.value,
        Server.IAM.value,
        Server.PERSON.value,
        Server.INS.value,
        Server.DISPENSATION.value,
        Server.DIAGNOSTICS.value,
        Server.REGISTRY.value,
        Server.DBT.value,
        Server.EPISODE.value
    ]

    _servers_for_bulk = [
        Server.IAM.value,
        Server.SSO.value,
        Server.PERSON.value,
        Server.DATA_GATEWAY.value,
        Server.INS.value,
        Server.REGISTRY.value,
        Server.EPISODE.value,
        Server.DISPENSATION.value,
        Server.DIAGNOSTICS.value,
        Server.INTERCEPTOR.value,
        Server.DBT.value
    ]

    _server_types = {
        Server.IAM.value: 'java',
        Server.SSO.value: 'java',
        Server.PERSON.value: 'java',
        Server.DATA_GATEWAY.value: 'java',
        Server.INS.value: 'java',
        Server.REGISTRY.value: 'java',
        Server.EPISODE.value: 'java',
        Server.DISPENSATION.value: 'java',
        Server.DIAGNOSTICS.value: 'java',
        Server.INTERCEPTOR.value: 'java',
        Server.DBT.value: 'java'
    }

    def __init__(self):
        with open(os.path.join(APP_PATH, 'data', 'config.json'), 'r') as file:
            self._configs = json.load(file)

    def _start_server(self, server):
        config = self._configs[server]
        command = f"cd {config['deployPath']} && bash -c 'source {config['deployPath']}.envrc && bash deploy.sh'"
        subprocess.run(command, shell=True)

    def _stop_server(self, server):
        config = self._configs[server]
        command = f"kill -9 $(lsof -i:{config['internalPort']} -t)"
        subprocess.run(command, shell=True)

    def _fire_check_url(self, server):
        config = self._configs[server]
        api_helper = ApiHelper()
        return api_helper.get(api_helper.get_endpoint(server) + config['checkUrl'])

    def get_enabled_servers(self):
        return self._enabled_servers

    def get_servers_order(self):
        return self._servers_order

    def get_servers_for_bulk(self):
        return self._servers_for_bulk

    def is_enabled(self, server):
        return server in self.get_enabled_servers()

    def get_server_types(self):
        return self._server_types

    def get_server_type(self, server):
        return self._server_types.get(server, '')

    def is_java_server(self, server):
        return self.get_server_type(server) == 'java'

    def is_running(self, server):
        method_name = f"_is{server.lower().capitalize()}Running"
        if hasattr(self, method_name) and callable(getattr(self, method_name)):
            return getattr(self, method_name)()
        return self._is_running(server)

    def start_server(self, server):
        if not self.is_enabled(server):
            raise Exception('Server Not Enabled')
        elif self.is_running(server):
            raise Exception('Server Already Running')

        method = f"_start{server.lower().capitalize()}"
        if hasattr(self, method):
            getattr(self, method)()
        else:
            self._start_server(server)

        started = False
        start_time = time.time()

        while not started and (time.time() - start_time < self.MAX_START_TIME):
            started = self.is_running(server)

        if started and self.is_java_server(server):
            # status = 0

            # while status == 0:
            #     response = self._fire_check_url(server)
            #     status = response['status']
            pass

        return started

    def stop_server(self, server):
        if not self.is_enabled(server):
            raise Exception('Server Not Enabled')
        elif not self.is_running(server):
            raise Exception('Server Not Running')

        method = '_stop' + server.lower().capitalize()
        if hasattr(self, method) and callable(getattr(self, method)):
            getattr(self, method)()
            return not self.is_running(server)
        return self._stop_server(server)

    def restart_server(self, server):
        if not self.is_enabled(server):
            raise Exception('Server Not Enabled')
        elif self.is_running(server):
            self.stop_server(server)
        return self.start_server(server)

    def start_servers(self, server_list=[]):
        if not server_list:
            server_list = self.get_servers_for_bulk()

        for server in self.get_servers_order():
            if self.is_enabled(server) and server in server_list and not self.is_running(server):
                Logger.info('server', f"Starting Server - {server}")
                self.start_server(server)

    def stop_servers(self, server_list=[]):
        if not server_list:
            server_list = self.get_servers_for_bulk()

        for server in self.get_servers_order():
            if server in server_list and self.is_running(server):
                Logger.info('server', f"Stopping Server - {server}")
                self.stop_server(server)

    def restart_servers(self, server_list=[]):
        for server in server_list:
            self.restart_server(server)

    def start_hot_reload_server(self, server):
        log_file_name = 'serverHelperLog'
        if not self.is_enabled(server):
            raise Exception('Server Not Enabled')
        elif self.is_running(server):
            raise Exception('Server Already Running')

        start_time = time.time()
        started = False

        self._start_server(server)
        while not started:
            started = self.is_running(server)

        if started and self.is_java_server(server):
            status = 0
            while status == 0:
                response = self._fire_check_url(server)
                status = response.get('status', 0)

        return started

    def stop_hot_reload_server(self, server):
        log_file_name = 'serverHelperLog'
        if not self.is_enabled(server):
            raise Exception('Server Not Enabled')
        elif not self.is_running(server):
            raise Exception('Server Not Running')

        self._stop_server(server)
        return not self.is_running(server)

    def _is_running(self, server):
        config = self._configs.get(server)
        internal_port = config.get('internalPort')

        try:
            response = subprocess.check_output(f"lsof -i:{internal_port} -t", shell=True, text=True)
            pid_list = response.strip().split("\n") if response.strip() else []
            return bool(pid_list)
        except subprocess.CalledProcessError:
            return False

    def _stopInterceptor(self):
        config = self._configs.get(Server.INTERCEPTOR.value)
        command = f"cd {config['deployPath']} && bash -c 'source {config['deployPath']}.envrc && bash stop.sh'"
        subprocess.run(command, shell=True, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
