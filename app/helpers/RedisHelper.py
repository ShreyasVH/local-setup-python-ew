import os
import redis


class RedisHelper:
    def __init__(self):
        self._config = {
            'host': os.getenv('REDIS_IP', 'localhost'),
            'port': int(os.getenv('REDIS_PORT', 6379)),
        }

    def connect(self):
        local_redis = redis.Redis(
            host=self._config['host'],
            port=self._config['port'],
            decode_responses=True
        )
        return local_redis

    def get_keys(self, pattern='*'):
        redis_conn = self.connect()
        keys = redis_conn.keys(pattern)
        return sorted(keys)

    def get_value(self, key):
        redis_conn = self.connect()
        return redis_conn.get(key)

    def set_value(self, key, value):
        redis_conn = self.connect()
        return redis_conn.set(key, value)

    def delete_key(self, key):
        redis_conn = self.connect()
        return redis_conn.delete(key) > 0

    def delete_all_keys(self):
        redis_conn = self.connect()
        return redis_conn.flushall()
