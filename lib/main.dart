import 'package:newapptest/views/startup.dart';
import 'package:flutter/material.dart';
import 'package:newapptest/services/login_service.dart';
import 'package:newapptest/services/signup_service.dart';
import 'package:newapptest/services/chat_service.dart';
import 'package:newapptest/protos/apptest.pb.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.grey[300],
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: StartUp(),
    );
  }
}
