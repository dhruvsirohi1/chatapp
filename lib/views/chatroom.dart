import 'dart:async';
import 'dart:math';

import 'package:newapptest/client_data/shareddata.dart';
import 'package:newapptest/client_data/userdata.dart';
import 'package:newapptest/services/chat_service.dart';
import 'package:newapptest/protos/apptest.pb.dart';
import 'package:newapptest/views/startup.dart';
import 'package:flutter/material.dart';
import 'package:newapptest/widgets/widget.dart';
import 'package:flutter/src/material/icons.dart';
import 'package:shared_preferences/shared_preferences.dart';

class chatRoom extends StatefulWidget {
  @override
  _chatRoomState createState() => _chatRoomState();
}

class _chatRoomState extends State<chatRoom> {
  TextEditingController msgCon = new TextEditingController();
  // List<Message> messages;
  // Stream<Message> chatMessageStream;
  ChatService chatter;
  Set<Message> messages;

  @override
  void initState() {
    super.initState();
    messages = Set();
    chatter = new ChatService();
    setUserName();
  }

  setUserName() async {
    UserData.onlineUserName = await SharedData.getSharedUserName();
  }

  logOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var f = await prefs.clear();
    while (f == null) {
      new Future.delayed(const Duration(seconds: 1), () => "5");
    }
    print('[Deleting shared preferences...');
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => StartUp()));
  }

  Widget chatList() {
    return StreamBuilder(
        stream: chatter.receiveMsg(),
        builder: (context, snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: chatter.getCount(),
                  itemBuilder: (context, index) {
                    return MessageTile(snapshot.data[index]);
                  })
              : Container();
        });
  }

  void handleMessage() async {
    if (msgCon.text.isEmpty) {
      print('Text field empty');
      return;
    }
    try {
      String msg = msgCon.text;
      await chatter.sendMessage(msg);
      msgCon.clear();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("assets/images/logo.png", height: 50),
        actions: [
          GestureDetector(
            onTap: () {
              logOut();
            },
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Icon(Icons.exit_to_app)),
          )
        ],
      ),
      body: Container(
          child: Stack(
        children: [
          chatList(),
          Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                alignment: AlignmentDirectional.bottomCenter,
                width: MediaQuery.of(context).size.width,
                height: 100,
                // padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Container(
                  // decoration: Border.fromBorderSide(side),
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                  color: Colors.blueGrey[600],
                  child: Row(
                    children: [
                      Expanded(
                          child: TextField(
                        controller: msgCon,
                        decoration: InputDecoration(
                            fillColor: Colors.black26,
                            hintText: "Message...",
                            hintStyle: TextStyle(color: Colors.black38),
                            border: InputBorder.none),
                      )),
                      SizedBox(
                        width: 15,
                      ),
                      GestureDetector(
                        onTap: () {
                          handleMessage();
                        },
                        child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                // color: Colors.grey[600],
                                gradient: LinearGradient(colors: [
                                  const Color(0x36FFFFFF),
                                  const Color(0x0FFFFFF)
                                ]),
                                borderRadius: BorderRadius.circular(30)),
                            padding: EdgeInsets.all(5),
                            child: Image.asset("assets/images/send.png")),
                      ),
                    ],
                  ),
                ),
              )),
          // chatList(),
        ],
      )),
    );
  }
}

bool myText(String sender) {
  return UserData.onlineUserName == sender;
}

class MessageTile extends StatelessWidget {
  final Message msg;
  // final bool mytext;
  MessageTile(this.msg);

  @override
  Widget build(BuildContext context) {
    bool mytext = myText(this.msg.senderName);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.only(left: mytext ? 0 : 17, right: mytext ? 17 : 0),
      width: MediaQuery.of(context).size.width,
      alignment: mytext ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 15),
            decoration: BoxDecoration(
                borderRadius: mytext
                    ? BorderRadius.only(
                        topLeft: Radius.circular(23),
                        topRight: Radius.circular(23),
                        bottomLeft: Radius.circular(23))
                    : BorderRadius.only(
                        topLeft: Radius.circular(23),
                        topRight: Radius.circular(23),
                        bottomRight: Radius.circular(23)),
                gradient: LinearGradient(
                  colors: mytext
                      ? [const Color(0xFF607D8B), const Color(0xFFB0BEC5)]
                      : [const Color(0xFF039BE5), const Color(0xFF01579B)],
                )),
            child: Text(
              msg.content,
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
          ),
          Container(
            child: Text(
              mytext ? 'you' : msg.senderName,
              style: TextStyle(
                color: Colors.black54,
                fontSize: 14,
              ),
            ),
          )
        ],
      ),
    );
  }
}

// child: Container(
// padding: EdgeInsets.only(
// top: 8,
// bottom: 8,
// left: mytext ? 24 : 0,
// right: mytext ? 0 : 24),
// child: Container(
// margin: mytext
// ? EdgeInsets.only(left: 30)
// : EdgeInsets.only(right: 30),
// padding: EdgeInsets.only(
// top: 17, bottom: 17, left: 20, right: 20),
// decoration: BoxDecoration(
// borderRadius: mytext ? BorderRadius.only(
// topLeft: Radius.circular(23),
// topRight: Radius.circular(23),
// bottomLeft: Radius.circular(23)
// ) :
// BorderRadius.only(
// topLeft: Radius.circular(23),
// topRight: Radius.circular(23),
// bottomRight: Radius.circular(23)),
// gradient: LinearGradient(
// colors: mytext ? [
// const Color(0xFF607D8B),
// const Color(0xFFB0BEC5)
// ]
// : [
// const Color(0xFF039BE5),
// const Color(0xFF01579B)
// ],
// )
// ),
//
// child: Text(msg.content,
// textAlign: TextAlign.start,
// style: TextStyle(
// color: Colors.white,
// fontSize: 16,
// fontFamily: 'OverpassRegular',
// fontWeight: FontWeight.w300)),
// ),
// ),
