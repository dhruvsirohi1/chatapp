import 'package:flutter/cupertino.dart';
import 'package:newapptest/client_data/shareddata.dart';
import 'package:newapptest/client_data/userdata.dart';
import 'package:newapptest/protos/apptest.pb.dart';
import 'package:newapptest/protos/apptest.pbgrpc.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

import 'package:grpc/grpc.dart';

class ChatService {
  User user = new User();

  int msgCount;
  static ChatServiceClient client;
  static ChatServiceBase ff;

  ChatService() {
    msgCount = 0;

    client = ChatServiceClient(
      ClientChannel(
        "localhost",
        port: 8080,
        options: ChannelOptions(
          credentials: ChannelCredentials.insecure(),
        ),
      ),
    );
  }

  int getCount() {
    return this.msgCount;
  }

  Future<TextResponse> sendMessage(String message) async {
    UserData.onlineUserName = await SharedData.getSharedUserName();
    while (UserData.onlineUserName == null) {}
    this.user.id = UserData.onlineUserName;
    TextResponse resp = await client.text(TextRequest()
      ..text = message
      ..username = user.id
      ..timestamp = DateTime.now().toIso8601String());
    return resp;
  }

  Stream<List<Message>> receiveMsg() async* {
    Message resp = Message();
    this.msgCount = 0;
    List<Message> holder = [];
    await for (var msg in client.chatStream(Empty())) {
      if (msg != null) {
        this.msgCount++;
        holder.add(msg);
        yield holder;
      }
    }
  }
}
