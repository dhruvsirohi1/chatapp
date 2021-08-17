import grpc
import psycopg2 
import hashlib
import sys
import cryptography as crypt
from concurrent import futures
from datetime import datetime
import time
import asyncio
import multiprocessing
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT

import apptest_pb2
import apptest_pb2_grpc 


class ChatServiceServicer(apptest_pb2_grpc.ChatServiceServicer):
    """Inherit class generated by grpc."""

    def Register(self, request, context):
        """
        Handle request to register on app.
        """
        print('[Sign Up request received...]')
        name = request.name
        emailid = request.email
        username = request.username
        pswrd = request.password
        response = apptest_pb2.SignUpResponse()
        response.success = DB.registerUser(name, emailid, username, pswrd)
        return response

    def Login(self, request, context):
        """
        Handle login request.
        """
        print('[Log in request received...]')
        username = request.username
        password = request.password
        response = apptest_pb2.LoginResponse()
        response.success, response.token = DB.authenticateLogin(username, password)
        # print(response.success)
        # print(response.token)
        return response

    def LogOut(self, request, context):
        """
        Handle logout request.
        """
        print('[Log our request received...]')
        #TODO
        return

    def Text(self, request, context):
        """
        Handle message sent from user A to B.
        """
        print('[Message received...]')
        # print(request.text)
        username = request.username
        print(f"{username} sent: {request.text}")
        msg = request.text
        # timestmp = request.timestamp
        response = apptest_pb2.TextResponse()
        response.accepted = DB.addLog(username, msg, ' ')
        return response
    
    def ChatStream(self, request, context):
        """
        Initiate the stream through which the client
        receives messages.
        """
        #  lowest timestamp (some time before app was made)
        print('[Chat room initiated...]')
        min_log_time = MIN_TIMESTAMP
        while True:
            msg_logs = DB.getLog(min_log_time)
            if msg_logs is not None:
                for row in msg_logs:
                    # print(row)
                    relayMsg = apptest_pb2.Message()
                    relayMsg.senderName = row[0]
                    relayMsg.content = row[1]
                    relayMsg.timestamp = row[2].strftime('%Y-%m-%d %H:%M:%S')
                    min_log_time = row[2].strftime('%Y-%m-%d %H:%M:%S')
                    yield relayMsg
                time.sleep(0.5)
                    
            #  get all rows ordered

            #  loop through and send until empty

            #  update timestamp
        

    def FetchUsers(self, request, context):
        """
        Fetch users that have registered on the app.
        """
        #TODO
        return

    def fetchLog(self, request, context):
        """
        Fetch log of messages between user A and B.
        """
        #TODO
        return




class Database():
    
    def __init__(self):
        try:
            self._conn = psycopg2.connect(
                host=DB_HOST,
                database=DB_NAME_DEFAULT,
                user=DB_USER,
                password=DB_PASS)
            print('[Connected to Database]')
        except:
            print('[Failed to connect to Database]')
            sys.exit(1)

        # Check if chatdemo database exists

        cur = self._conn.cursor()
        cur.execute("""
        SELECT datname FROM pg_database
        """)

        base_list = cur.fetchall()

        if ("chatdemo",) not in base_list:
            self._conn.set_isolation_level(ISOLATION_LEVEL_AUTOCOMMIT)
            cur.execute("""
            CREATE DATABASE chatdemo
            """)
        self._conn.close()
        cur.close()
        self.connectToBase()
        cur = self._conn.cursor()
        
        if not self.checkExistence('main_user_base'):
            self.createMainUserBase()
            return
        
        if not self.checkExistence('msg_log_base'):
            self.createMsgLogBase()

        if not self.checkExistence('online_user_base'):
            self.createOnlineUserBase()
        
    
    def connectToBase(self):
        self._conn = psycopg2.connect(
                host=DB_HOST,
                database=DB_NAME,
                user=DB_USER,
                password=DB_PASS)


    def checkExistence(self, tablename):
        cur = self._conn.cursor()
        cur.execute("select * from information_schema.tables where table_name=%s", (tablename,))
        exists = cur.rowcount > 0
        cur.close()
        return exists

    def createMainUserBase(self):
        self.connectToBase()
        cur = self._conn.cursor()
        cur.execute("""
        CREATE TABLE main_user_base(
            id VARCHAR(10) NOT NULL PRIMARY KEY,
            name VARCHAR(50) NOT NULL,
            username VARCHAR(20) NOT NULL,
            email VARCHAR(20),
            password VARCHAR(50) NOT NULL)
        """)
        self._conn.commit()
        self._conn.close()
        cur.close()


    def createOnlineUserBase(self):
        self.connectToBase()
        cur = self._conn.cursor()
        cur.execute("""
        CREATE TABLE online_user_base(
            token VARCHAR(50) NOT NULL PRIMARY KEY,
            username VARCHAR(20) NOT NULL)
        """)
        self._conn.commit()
        self._conn.close()
        cur.close()

    def addOnlineUser(self, token, username):
        #TODO
        return

    def createMsgLogBase(self):
        self.connectToBase()
        cur = self._conn.cursor()
        cur.execute("""
        CREATE TABLE msg_log_base(
            sender VARCHAR(20) NOT NULL,
            content VARCHAR(255) NOT NULL,
            log_time TIMESTAMP NOT NULL)
        """)
        self._conn.commit()
        self._conn.close()
        cur.close()
    
    def addLog(self, username, text, discared):
        # print('Im here lol')
        self.connectToBase()
        cur = self._conn.cursor()
        # print('And here')
        """
        Originally planned to authenticate user using token.
        """
        # cur.execute("""
        # SELECT username FROM online_user_base WHERE token = %s
        # """, (token,))

        timestamp = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        # print(timestamp)
        # print('Converted timestamp?')
        cur.execute("""
        INSERT INTO msg_log_base(
            sender,
            content,
            log_time
        )
        VALUES (
            %s,
            %s,
            %s
        )
        """, (username, text, timestamp))
        # print('Added?')
        self._conn.commit()
        self._conn.close()
        cur.close()
        return True

    def getLog(self, minTimeStamp):
        self.connectToBase()
        cur = self._conn.cursor()

        cur.execute("""
        SELECT * FROM msg_log_base 
        WHERE log_time > %s 
        """, (minTimeStamp,))

        logs = cur.fetchall()
        self._conn.close()
        cur.close()
        return logs
    

    def getHash(self, username, password):
        id_str = username + password
        id_hasher = hashlib.md5()
        id_hasher.update(id_str.encode('utf8'))
        id_bytes = id_hasher.digest()
        id_full = str(id_bytes)
        return id_full[:8]


    def registerUser(self, name, email, username, password):
        self.connectToBase()
        cur = self._conn.cursor()
        hash_id = self.getHash(username, password)
        cur.execute("SELECT * FROM main_user_base WHERE id =%s", (hash_id,))
        if cur.fetchone() is not None:
            print('[User already exists!]')
            self._conn.close()
            cur.close()
            return False
        
        cur.execute("""
        INSERT INTO main_user_base(
            id,
            name,
            username, 
            email,
            password)
        VALUES (
            %s,
            %s,
            %s,
            %s,
            %s)
        """, (hash_id, name, username, email, password))
        print(f'[User {username} added to database.')

        self._conn.commit()
        self._conn.close()
        cur.close()
        return True



    def authenticateLogin(self, username, password):
        self.connectToBase()
        if not self.checkExistence("main_user_base"):
            self.createMainUserBase()
        cur = self._conn.cursor()
        auth_id = self.getHash(username, password)
        print(f'Login request from: {username}')
        cur.execute("SELECT * FROM main_user_base WHERE id=%s", (auth_id,))
        exists = bool(cur.rowcount)
        self._conn.close()
        cur.close()
        if exists:
            now = datetime.now()
            token = self.getHash(username, now.strftime("%m/%d/%Y, %H:%M:%S"))
            self.addOnlineUser(token, username)
            print('[Welcome!]')
            return [True, token]
        else:
            print('ANAUTHORIZED')
            return [False, 'Unauthorized']



if __name__ == '__main__':
    port = 8080  
    DB_HOST = 'localhost'
    DB_NAME_DEFAULT = 'postgres'
    DB_NAME = 'chatdemo'
    DB_USER = 'postgres'
    DB_PASS = 'password'
    MIN_TIMESTAMP = '2000-01-01 01:01:01'
    DB = Database()
    server = grpc.server(futures.ThreadPoolExecutor(max_workers=10))  # create a gRPC server
    apptest_pb2_grpc.add_ChatServiceServicer_to_server(ChatServiceServicer(), server)  # register the server to gRPC
    server.add_insecure_port('[::]:' + str(port))
    server.start()
    print(f'Starting server. Listening on port {str(port)}...')

    server.wait_for_termination()
   




