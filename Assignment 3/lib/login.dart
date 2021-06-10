import 'package:assignment01/task_list.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool passwordHide = true;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/flutter-logo.png"),
              SizedBox(height: 10,),
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email_outlined, color: Colors.grey,),
                  labelText: " Email ",
                  border: UnderlineInputBorder(),
                ),
                validator: (inputVal) {
                  if (!EmailValidator.validate(inputVal))
                    return "Please enter a valid email address";
                  else
                    return null;
                },
                controller: emailController,
              ),
              SizedBox(height: 10,),
              TextFormField(
                obscureText: passwordHide,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    labelText: ' Password ',
                    suffix: GestureDetector(child: Icon(
                        passwordHide ? Icons.remove_red_eye : Icons
                            .remove_red_eye_outlined), onTap: () {
                      setState(() {
                        passwordHide = !passwordHide;
                      });
                    },),
                    border: UnderlineInputBorder()
                ),
                controller: passwordController,
              ),
              SizedBox(height: 15,),
              RaisedButton(
                shape: StadiumBorder(),
                elevation: 1,
                color: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                textColor: Colors.white,
                child: Text("Login"),
                onPressed: () async {
                  String errorMessage = "";
                  final GlobalKey<State> _keyLoader = new GlobalKey<State>();

                  showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (ctx) {
                        return WillPopScope(
                          onWillPop: () async => false,
                          child: SimpleDialog(
                            key: _keyLoader,
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                            children: [
                              Center(
                                child: Column(
                                  children: [
                                    SpinKitRing(color: Theme.of(context).primaryColor),
                                    SizedBox(height: 25,),
                                    Text("Logging in", style: Theme.of(context).textTheme.headline3.copyWith(color: Theme.of(context).accentColor),)
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      }
                  );

                  try {
                    await FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                        email: emailController.text.trim(),
                        password: passwordController.text
                    );
                    Navigator.of(context).pop(); //hide dialog
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => TasksListPage()));
                  }
                  on FirebaseAuthException catch (e) {
                    Navigator.of(context).pop(); //hide dialog
                    ///ERROR CODES DOCUMENTATION UNAVAILABLE
                    switch (e.code) {
                      case "ERROR_WRONG_PASSWORD":
                      case "wrong-password":
                        errorMessage = "Wrong email/password combination.";
                        break;
                      case "ERROR_USER_NOT_FOUND":
                      case "user-not-found":
                        errorMessage = "No user found with this email.";
                        break;
                      case "ERROR_USER_DISABLED":
                      case "user-disabled":
                        errorMessage = "User disabled.";
                        break;
                      case "ERROR_TOO_MANY_REQUESTS":
                      case "operation-not-allowed":
                        errorMessage =
                        "Too many requests to log into this account.";
                        break;
                      case "ERROR_OPERATION_NOT_ALLOWED":
                      case "operation-not-allowed":
                        errorMessage = "Server error, please try again later.";
                        break;
                      case "ERROR_INVALID_EMAIL":
                      case "invalid-email":
                        errorMessage = "Email address is invalid.";
                        break;
                      default:
                        errorMessage = "Login failed. Please try again.";
                        break;
                    }
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(errorMessage),
                      duration: Duration(seconds: 3),
                    ));
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}