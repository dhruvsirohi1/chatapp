# Basic Chat App


<img src="./assets/images/homescreen.png" width="210"/>          
<img src="./assets/images/chatscreen.png" width="210"/>

This version of the app has all the basic requirements of the assessment implemented and working (screen capture(s) attached). Here I go through the following:

<li> Project Structure / Implementation <li\>
<li> Current Issues<li\>
<li> Usage<li\>
<li> Future improvements<li\>
<br/><br/>

## Current Implementation:

<li> <u>Front-end</u>: Flutter</li>
<li> <u>Back-end</u>: Python</li>
<li> <u>Database</u>: postgreSQL</li>
<li> <u>Protocol</u>: gRPC</li>
<br/>
Thank you for providing these options, specifically gRPC and Flutter. I learnt a lot and was left even more in awe of what google continues to do. 
<br/><br/>
This is a very naive implementation of what is a chat room and not in any sense a traditional "chat app." But I did get all the infrastructure working and I think it's just a matter of time constraints but with the options available, a fully deployable app is certainly doable.

### Structure:

<li> 
User logs in and is provided a token (not implemented) by the server so it can continue to authenticate future requests.
 <li\>
<li> 
If the user signs up, they are reverted back to the login page, my motivation was to always hand them a token only after sign in. 
<li\>
<li>
After the user sends a message, it is first sent to the user which then streams all the prior messages (including the new one) back to the user so they can be displayed. Definitely not efficient, but due to my unfamiliarity with Dart, I could not think of a way to achieve an optimal solution without using some sort of database on the Client's side.
<li\>
<br/><br/>

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

## Requirements

Following requirements for backend + database + protocol:

<li>
postgres
<li\>
<li>
psycopg2
<li>
grpc (as grpcio)
<li\>
<li>
grpcio-tools
<li\>
<li>
protobuf 
<li\>

Following requirements for frontend:
<li>
flutter (DART included)
<li\>
<li>
some simulator (I used iOS 14.5 on iPhone 11)
<li\>

Most are taken care of by the proto file.

## Usage

I have been debugging through VS code on an iOS simulator.

All the client side dart and grpc files along with the proto file are in:

```
~/newtestapp/lib
```

The server is run using terminal / cmd:

```
python server.py
```
 in the appropriate location:
```
~/newapptest/Server
```

## Further Improvements
Obviously many. There is no real security and no 1-to-1 chat options. 

Thank you so much for considering me throughout this process, and for the assessments as well. They have been quite enjoyable and I have learnt a decent bit out of them. Finally, I would like to say that this is not the best work I can produce, I am in the midst of finals and final projects (school ends this friday) and was not able to devote as much time as I wanted to.