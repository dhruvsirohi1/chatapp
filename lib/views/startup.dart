import 'package:newapptest/client_data/shareddata.dart';
import 'package:newapptest/protos/apptest.pb.dart';
import 'package:newapptest/protos/apptest.pbgrpc.dart';
import 'package:newapptest/views/chatroom.dart';
import 'package:flutter/material.dart';
import 'package:newapptest/views/signup.dart';
import 'package:newapptest/widgets/widget.dart';
import 'package:newapptest/services/login_service.dart';
import 'package:newapptest/services/signup_service.dart';

class StartUp extends StatefulWidget {
  @override
  _StartUpState createState() => _StartUpState();
}

class _StartUpState extends State<StartUp> {
  bool isLoading = false;
  bool validated = true;
  final formKey = GlobalKey<FormState>();
  TextEditingController usernameCon = new TextEditingController();
  TextEditingController passwordCon = new TextEditingController();

  validateLogIn() async {
    // if (formKey.currentState.validate()) {
    //   setState(() {
    //     isLoading = true;
    //   });
    // } else {
    //   isLoading = false;
    // }

    String tempUserName = usernameCon.text;
    // Validate credentials
    //TODO
    LoginService loginreq = LoginService(usernameCon.text, passwordCon.text);
    try {
      await loginreq.sendLoginRequest();
    } catch (e) {
      print(e.toString());
    }
    print('Login Response received');
    if (loginreq.getAuth()) {
      SharedData.saveUserName(tempUserName);
      SharedData.saveToken(loginreq.getToken());
      SharedData.saveLogInState(true);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => chatRoom()));
    } else {
      // TODO: Throw error
      this.validated = false;
    }
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
                                validator: (val) {
                                  return val.isEmpty
                                      ? "Username is required"
                                      : null;
                                },
                                controller: usernameCon,
                                decoration: textInputDecoration("username")),
                            TextFormField(
                                obscureText: true,
                                validator: (val) {
                                  return val.isEmpty
                                      ? "Password is required"
                                      : null;
                                },
                                controller: passwordCon,
                                decoration: textInputDecoration("password")),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      GestureDetector(
                        onTap: () {
                          validateLogIn();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.symmetric(vertical: 16),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color:
                                      this.validated ? Colors.grey : Colors.red,
                                  width: this.validated ? 0 : 4),
                              gradient: LinearGradient(colors: [
                                const Color(0xff007EF4),
                                const Color(0xff2A75BC)
                              ]),
                              borderRadius: BorderRadius.circular(25)),
                          child: Text(
                            "Log In",
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUp()));
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
