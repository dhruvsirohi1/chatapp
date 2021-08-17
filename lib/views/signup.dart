import 'package:newapptest/services/signup_service.dart';
import 'package:newapptest/views/startup.dart';
import 'package:flutter/material.dart';
import 'package:newapptest/widgets/widget.dart';
import 'package:newapptest/views/chatroom.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isLoading = false;
  final formKey = GlobalKey<FormState>();
  TextEditingController nameCon = new TextEditingController();
  TextEditingController emailCon = new TextEditingController();
  TextEditingController usernameCon = new TextEditingController();
  TextEditingController passwordCon = new TextEditingController();

  validateSignUp() {
    if (formKey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });
    } else {
      return;
    }

    SignUpService signupreq = new SignUpService(
        nameCon.text, emailCon.text, usernameCon.text, passwordCon.text);
    try {
      signupreq.sendSignUpRequest();
    } catch (e) {
      print(e.toString());
    }

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => StartUp()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: isLoading
          ? Container(child: Center(child: CircularProgressIndicator()))
          : SingleChildScrollView(
              child: Container(
                  height: MediaQuery.of(context).size.height - 50,
                  alignment: Alignment.bottomCenter,
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Form(
                        key: formKey,
                        child: Column(
                          children: [
                            TextFormField(
                                decoration: textInputDecoration("name"),
                                validator: (val) {
                                  return val.isEmpty
                                      ? "name is required"
                                      : null;
                                },
                                controller: nameCon),
                            TextFormField(
                                decoration: textInputDecoration("email"),
                                validator: (val) {
                                  return RegExp(
                                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                          .hasMatch(val)
                                      ? null
                                      : "please provide a valid email";
                                },
                                controller: emailCon),
                            TextFormField(
                                decoration: textInputDecoration("username"),
                                validator: (val) {
                                  return val.isEmpty || val.length < 4
                                      ? "username (length >4) is required"
                                      : null;
                                },
                                controller: usernameCon),
                            TextFormField(
                                obscureText: true,
                                decoration: textInputDecoration("password"),
                                validator: (val) {
                                  return val.isEmpty || val.length < 4
                                      ? "password (length > 6) is required"
                                      : null;
                                },
                                controller: passwordCon),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      GestureDetector(
                        onTap: () {
                          print('Validating sign up');
                          validateSignUp();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.symmetric(vertical: 16),
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(25)),
                          child: Text(
                            "Sign Up",
                            style:
                                TextStyle(color: Colors.black87, fontSize: 17),
                          ),
                        ),
                      )
                    ],
                  )),
            ),
    );
  }
}
