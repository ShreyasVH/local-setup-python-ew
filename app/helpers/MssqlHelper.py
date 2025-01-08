import os
import pyodbc
import decimal


class MssqlHelper:
    def __init__(self):
        self._config = {
            'host': os.getenv('MSSQL_IP'),
            'port': int(os.getenv('MSSQL_PORT')),
            'user': os.getenv('MSSQL_USER'),
            'password': os.getenv('MSSQL_PASSWORD')
        }

    def connect(self, options):
        server_name = f"{options['host']},{options['port']}"
        connection_string = (
            f"DRIVER={{ODBC Driver 18 for SQL Server}};"
            f"SERVER={server_name};"
            f"UID={options['user']};"
            f"PWD={options['password']};"
            f"TrustServerCertificate=YES;"
            f"Timeout=60;"
            f"ReturnDatesAsStrings=1;"
        )

        if 'Database' in options:
            connection_string += f"Database={options['Database']};"

        # auto_commit = False
        # if 'autoCommit' in options:
        #     auto_commit = options['autoCommit']
        # print(auto_commit)

        connection = pyodbc.connect(connection_string, autocommit=True)
        return connection

    def execute(self, query, database_name=''):
        options = self._config
        options['Database'] = database_name
        connection = self.connect(options)
        cursor = connection.cursor()
        cursor.execute(query)

        errors = cursor.messages
        if errors:
            print(query)
            print(errors)

        # return []

    def get_all_databases(self):
        connection = self.connect(self._config)
        cursor = connection.cursor()
        cursor.execute("SELECT name FROM sys.databases")
        databases = [row[0] for row in cursor.fetchall()]
        return databases

    def create_database(self, database_name):
        if database_name not in self.get_all_databases():
            query = f"CREATE DATABASE {database_name}"
            options = self._config
            options['autoCommit'] = True
            connection = self.connect(options)
            cursor = connection.cursor()
            cursor.execute(query)

    def drop_database(self, database_name):
        if database_name in self.get_all_databases():
            query = f"DROP DATABASE {database_name}"
            options = self._config
            options['autoCommit'] = True
            connection = self.connect(options)
            cursor = connection.cursor()
            cursor.execute(query)

    def get_all_tables(self, database_name):
        query = f"SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_CATALOG = '{database_name}'"
        options = self._config
        options['Database'] = database_name
        connection = self.connect(options)
        cursor = connection.cursor()
        cursor.execute(query)
        columns = [column[0] for column in cursor.description]
        tables = []
        for row in cursor.fetchall():
            tables.append(dict(zip(columns, row)).get('TABLE_NAME'))
        return sorted(tables)

    def get_row_count(self, table_name, database_name):
        query = f"SELECT COUNT(*) as count from [{table_name}]"
        options = self._config
        options['Database'] = database_name
        connection = self.connect(options)
        cursor = connection.cursor()
        cursor.execute(query)
        result = cursor.fetchone()
        return result[0]

    def convert_dates_to_strings(self, row):
        return {
            key: (str(value) if isinstance(value, (pyodbc.Date, pyodbc.Time, pyodbc.Timestamp, decimal.Decimal)) else value)
            for key, value in row.items()
        }

    def get_row_values(self, table_name, database_name):
        query = f"SELECT * from [{table_name}]"
        options = self._config
        options['Database'] = database_name
        connection = self.connect(options)
        cursor = connection.cursor()
        cursor.execute(query)
        values = []
        for row in cursor.fetchall():
            row_dict = dict(zip([column[0].lower() for column in cursor.description], row))
            row_dict = self.convert_dates_to_strings(row_dict)
            values.append(row_dict)
        return values

    def get_column_names(self, database_name, table_name):
        query = f"SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = '{table_name}'"
        options = self._config
        options['Database'] = database_name
        connection = self.connect(options)
        cursor = connection.cursor()
        cursor.execute(query)
        columns = [column[0] for column in cursor.description]
        column_names = []
        for row in cursor.fetchall():
            column_names.append(dict(zip(columns, row)).get('COLUMN_NAME'))
        return column_names

    def get_column_definitions(self, database_name, table_name):
        query = f"SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = '{table_name}'"
        options = self._config
        options['Database'] = database_name
        connection = self.connect(options)
        cursor = connection.cursor()
        cursor.execute(query)
        columns = [column[0] for column in cursor.description]
        column_definitions = {}
        for row in cursor.fetchall():
            row_dict = dict(zip(columns, row))
            column_definitions[row_dict['COLUMN_NAME']] = row_dict
        return column_definitions

    def select(self, query, database_name):
        options = self._config
        options['Database'] = database_name
        connection = self.connect(options)
        cursor = connection.cursor()
        cursor.execute(query)
        values = [row for row in cursor.fetchall()]
        return values
