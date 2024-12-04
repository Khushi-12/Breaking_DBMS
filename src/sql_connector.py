# src/sql_connector.py

import pymysql

class sqlConnector:
    def __init__(self):
        self.connection = None

    def connect(self, username : str, password : str, host : str, database : str):

        self.host = host
        self.user = username
        self.password = password
        self.database = database

        try:
            self.connection = pymysql.connect(
                host=self.host,
                user=self.user,
                password=self.password,
                database=self.database,
                cursorclass=pymysql.cursors.DictCursor  # Ensures results are dictionaries
            )
        except Exception as e:

            errorCode = e.args[0]
        
            if (errorCode == 1045):
                raise TypeError("Incorrect username")
            elif(errorCode == 2003):
                raise TypeError("Host could not be found, does it exist?")
            elif(errorCode == 1049):
                raise TypeError("Could not find database")
            else:
                raise TypeError("Incorrect username or password")


    def query(self, sql, params=None):
        with self.connection.cursor() as cursor:
            cursor.execute(sql, params)
            result = cursor.fetchall()
        return result

    def execute(self, sql, params=None):
        with self.connection.cursor() as cursor:
            cursor.execute(sql, params)

    def commit(self):
        self.connection.commit()

    def rollback(self):
        self.connection.rollback()

    def close(self):
        if self.connection:
            try:
                self.connection.close()
            except Exception as e:
                print(f"Error closing connection: {e}")
            finally:
                self.connection = None





