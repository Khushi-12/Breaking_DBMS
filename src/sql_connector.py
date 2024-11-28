
import pymysql

class sqlConnector:

    host = ""
    user = ""
    password = ""
    database = ""

    connection = None

    def __init__(self):
        pass

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


    def query(self, quer):

        returnList = []

        with self.connection.cursor() as cursor:
            cursor.execute(quer)  
            results = cursor.fetchall()

            for row in results:
                returnList.append(row)

        return returnList    
    

    def disconnect(self):
        self.connection.close()

    def getConnectionStatus(self):
        return self.connection is not None and self.connection.open





