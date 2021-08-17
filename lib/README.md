# Basic Chat App


<img src="./assets/images/homescreen.png" width="210"/>          
<img src="./assets/images/chatscreen.png" width="210"/>



## Current Implementation:

<li> <u>Front-end</u>: Flutter </li> 
<li> <u>Back-end</u>: Python </li>
<li> <u>Database</u>: postgreSQL</li>
<li> <u>Protocol</u>: gRPC</li>


<br/><br/>
This is a very naive implementation of what is a chat room, much like Discord *LITE*.


### Database:
<li>
Main User Database (main_user_base): Stores all the users necessary info. The username is used as the primary key, although encryption using pythons hashlib library is implemented (originally also wanted to do this for tokens).
<li\>

<li>
Message Log Database (msg_log_base): Stores messages with sender and timestamps.
<li\>

These are not implemented, but would be nice to have and not too hard to implement:
<li>
A dynamic online user database that stores users identified through their tokens.
<li\>
<li>
Chatroom databases which use the usernames of everyone in the group and stores the conversations separately.
<li\>


<br/>


## Usage

I have been debugging through VS code on an iOS simulator.

The server is run using terminal / cmd:

```
python server.py
```

The client is on flutter.