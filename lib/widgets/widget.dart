import 'package:flutter/material.dart';

Widget appBarMain(BuildContext context) {
  return AppBar(title: Image.asset("assets/images/logo.png", height: 50));
}

InputDecoration textInputDecoration(String hintText) {
  return InputDecoration(
    hintText: hintText,
    hintStyle: TextStyle(
      color: Colors.black26,
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.black54),
    ),
    enabledBorder:
        UnderlineInputBorder(borderSide: BorderSide(color: Colors.black12)),
  );
}

TextStyle simpleTextStyle() {
  return TextStyle(color: Colors.white, fontSize: 18);
}
