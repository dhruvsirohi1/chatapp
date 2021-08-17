import 'package:newapptest/protos/apptest.pb.dart';
import 'package:newapptest/protos/apptest.pbgrpc.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

import 'package:grpc/grpc.dart';

class SignUpService {
  SignUpRequest signupreq = SignUpRequest();

  static ChatServiceClient client;
  bool registered = false;
  SignUpService(String name, String emailid, String username, String password) {
    signupreq
      ..clearName()
      ..name = name
      ..clearEmail()
      ..email = emailid
      ..clearUsername()
      ..username = username
      ..clearPassword()
      ..password = password;

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

  bool getRegistrationStatus() {
    return this.registered;
  }

  Future<Empty> sendSignUpRequest() async {
    SignUpResponse auth = await client.register(SignUpRequest()
      ..name = signupreq.name
      ..email = signupreq.email
      ..username = signupreq.username
      ..password = signupreq.password);
    // while (auth == null) {}
    //   this.registered = auth.success;
  }
}
