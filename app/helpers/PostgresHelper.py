import os
import psycopg2
from psycopg2 import sql
from datetime import date, time, datetime
from psycopg2.extras import DictCursor

class PostgresHelper:

    def __init__(self):
        self._config = {
            'host': os.getenv('POSTGRES_IP'),
            'port': int(os.getenv('POSTGRES_PORT')),
            'user': os.getenv('POSTGRES_USER'),
            'password': os.getenv('POSTGRES_PASSWORD'),
            'dbname': 'postgres',  # Default database to connect initially
        }

    def connect(self, database=None):
        conn_params = self._config.copy()
        if database:
            conn_params['dbname'] = database
        connection = psycopg2.connect(**conn_params)
        connection.autocommit = True
        return connection

    def execute(self, query, database_name=''):
        conn = self.connect(database_name)
        cursor = conn.cursor()
        result = cursor.execute(query)
        conn.commit()
        cursor.close()
        conn.close()
        return result

    def create_database(self, database_name):
        if not self.is_database_present(database_name):
            query = sql.SQL('CREATE DATABASE {}').format(sql.Identifier(database_name))
            self.execute(query)

    def drop_database(self, database_name):
        if self.is_database_present(database_name):
            query = sql.SQL('REVOKE CONNECT ON DATABASE {} FROM public').format(sql.Identifier(database_name))
            self.execute(query)

            query = sql.SQL("SELECT pg_terminate_backend(pg_stat_activity.pid) FROM pg_stat_activity WHERE pg_stat_activity.datname = '" + database_name + "'")
            self.execute(query)

            query = sql.SQL('DROP DATABASE {}').format(sql.Identifier(database_name))
            self.execute(query)

    def is_database_present(self, database_name):
        query = "SELECT 1 FROM pg_database WHERE datname = %s"
        conn = self.connect()
        cursor = conn.cursor()
        cursor.execute(query, [database_name])
        exists = cursor.fetchone() is not None
        cursor.close()
        conn.close()
        return exists

    def get_all_databases(self):
        query = 'SELECT datname FROM pg_database'
        conn = self.connect()
        cursor = conn.cursor()
        cursor.execute(query)
        rows = cursor.fetchall()
        cursor.close()
        conn.close()
        return [row[0] for row in rows]

    def get_all_tables(self, database_name):
        query = sql.SQL("SELECT table_name FROM information_schema.tables "
                        "WHERE table_type = 'BASE TABLE' AND table_schema = 'public' AND table_catalog = %s")
        conn = self.connect(database_name)
        cursor = conn.cursor()
        cursor.execute(query, [database_name])
        rows = cursor.fetchall()
        cursor.close()
        conn.close()
        return sorted([row[0] for row in rows])

    def get_row_count(self, table_name, database_name):
        query = sql.SQL('SELECT COUNT(*) FROM {}').format(sql.Identifier(table_name))
        conn = self.connect(database_name)
        cursor = conn.cursor()
        cursor.execute(query)
        count = cursor.fetchone()[0]
        cursor.close()
        conn.close()
        return count

    def convert_dates_to_strings(self, row):
        # return {
        #     key: (str(value) if isinstance(value, (date, time, datetime)) else value)
        #     for key, value in row.items()
        # }

        for key, value in row.items():
            if isinstance(value, datetime):
                row[key] = value.strftime('%Y-%m-%d %H:%M:%S')
            elif isinstance(value, date):
                row[key] = str(value)

        return row

    def get_row_values(self, table_name, database_name):
        query = sql.SQL('SELECT * FROM {}').format(sql.Identifier(table_name))
        conn = self.connect(database_name)
        cursor = conn.cursor()
        cursor.execute(query)
        values = []
        for row in cursor.fetchall():
            row_dict = dict(zip([column[0].lower() for column in cursor.description], row))
            row_dict = self.convert_dates_to_strings(row_dict)
            values.append(row_dict)

        cursor.close()
        conn.close()
        return values

    def get_column_names(self, database_name, table_name):
        query = sql.SQL("SELECT column_name FROM information_schema.columns WHERE table_name = %s")
        conn = self.connect(database_name)
        cursor = conn.cursor()
        cursor.execute(query, [table_name])
        columns = cursor.fetchall()
        cursor.close()
        conn.close()
        return [column[0] for column in columns]

    def get_column_definitions(self, database_name, table_name):
        query = sql.SQL("SELECT * FROM information_schema.columns WHERE table_name = %s")
        conn = self.connect(database_name)
        cursor = conn.cursor()
        cursor.execute(query, [table_name])
        definitions = cursor.fetchall()
        columns = [column[0] for column in cursor.description]
        column_definitions = {}
        for row in definitions:
            row_dict = dict(zip(columns, row))
            column_definitions[row_dict['column_name']] = row_dict
        cursor.close()
        conn.close()
        return column_definitions

    def select(self, query, database_name):
        conn = self.connect(database_name)
        cursor = conn.cursor(cursor_factory=DictCursor)
        cursor.execute(query)
        rows = cursor.fetchall()
        cursor.close()
        conn.close()
        return rows

