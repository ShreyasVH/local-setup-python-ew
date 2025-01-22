import os
import json
import pika

from app.scripts.commonDefinitions import APP_PATH

class MQHelper:
    def __init__(self):
        self._config = {
            'host': os.getenv('RMQ_IP'),
            'port': os.getenv('RMQ_PORT'),
            'user': os.getenv('RMQ_USER'),
            'password': os.getenv('RMQ_PASSWORD'),
            'vhost': os.getenv('RMQ_VHOST')
        }

        self.connection = pika.BlockingConnection(
            pika.ConnectionParameters(
                host=self._config['host'],
                port=int(self._config['port']),
                virtual_host=self._config['vhost'],
                credentials=pika.PlainCredentials(self._config['user'], self._config['password'])
            )
        )

    def _get_channel(self):
        return self.connection.channel()

    def delete_exchange(self, exchange):
        channel = self._get_channel()
        channel.exchange_delete(exchange)

    def delete_queue(self, queue):
        channel = self._get_channel()
        channel.queue_delete(queue)

    def add_queue(self, queue):
        channel = self._get_channel()
        channel.queue_declare(queue, durable=True)

    def add_queues(self):
        config_path = os.path.join(APP_PATH, 'data', 'config.json')
        with open(config_path, 'r') as f:
            config = json.load(f)

        for project, configs in config.items():
            if 'queues' in configs:
                queues = configs['queues']
                for queue in queues:
                    self.add_queue(queue)

    def delete_queues(self):
        config_path = os.path.join(APP_PATH, 'data', 'config.json')
        with open(config_path, 'r') as f:
            config = json.load(f)

        for project, configs in config.items():
            if 'queues' in configs:
                queues = configs['queues']
                for queue in queues:
                    self.delete_queue(queue)

    def add_exchanges(self):
        config_path = os.path.join(APP_PATH, 'data', 'config.json')
        with open(config_path, 'r') as f:
            config = json.load(f)

        for project, configs in config.items():
            if 'exchanges' in configs:
                exchanges = configs['exchanges']
                for exchange in exchanges:
                    exchange_name = exchange['name']
                    exchange_type = exchange['type']
                    self.add_exchange(exchange_name, exchange_type)

                    if 'queues' in exchange:
                        for queue in exchange['queues']:
                            self.bind_exchange_to_queue(exchange_name, queue['name'], queue['routingKey'])

    def add_exchange(self, exchange_name, exchange_type):
        channel = self._get_channel()
        channel.exchange_declare(exchange_name, exchange_type, durable=True)

    def bind_exchange_to_queue(self, exchange_name, queue_name, routing_key):
        channel = self._get_channel()
        channel.queue_bind(queue_name, exchange_name, routing_key)

    def delete_exchanges(self):
        config_path = os.path.join(APP_PATH, 'data', 'config.json')
        with open(config_path, 'r') as f:
            config = json.load(f)

        for project, configs in config.items():
            if 'exchanges' in configs:
                exchanges = configs['exchanges']
                for exchange in exchanges:
                    self.delete_exchange(exchange['name'])

    def publish_message(self, queue_name, message, headers=None):
        if headers is None:
            headers = {}

        channel = self._get_channel()
        channel.basic_publish(
            exchange='',
            routing_key=queue_name,
            body=message,
            properties=pika.BasicProperties(
                headers=headers
            )
        )
