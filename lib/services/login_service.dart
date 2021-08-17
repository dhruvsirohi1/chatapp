import 'package:newapptest/protos/apptest.pb.dart';
import 'package:newapptest/protos/apptest.pbgrpc.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

import 'package:grpc/grpc.dart';

class LoginService {
  LoginRequest loginreq = LoginRequest();
  bool authenticated = false;
  String token;

  static ChatServiceClient client;

  LoginService(String username, String password) {
    loginreq
      ..clearUsername()
      ..username = username
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

  bool getAuth() {
    return this.authenticated;
  }

  String getToken() {
    return this.token;
  }

  Future<Empty> sendLoginRequest() async {
    LoginResponse auth = await client.login(LoginRequest()
      ..username = this.loginreq.username
      ..password = this.loginreq.password);
    if (auth != null) {
      if (auth.success) {
        authenticated = true;
        token = auth.token;
      }
    }
  }
}
