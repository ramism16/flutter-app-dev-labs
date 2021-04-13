import 'package:flutter/material.dart';
import 'package:madlab5/home.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {runApp(MyApp());}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Lab 3',
        home: Splash()
    );
  }
}

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 5,
      backgroundColor: Colors.white,
      image: Image.asset('files/flutter-logo.png'),
      loaderColor: Colors.blue,
      photoSize: 150,
      navigateAfterSeconds: Login(),
    );
  }
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool passwordHide = true;
  bool rememberMe = true;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40).add(EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset("files/flutter-logo.png"),
                  SizedBox(height: 40,),
                  TextFormField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person, color: Colors.grey,),
                        labelText: " Username ",
                        border: UnderlineInputBorder()
                    ),
                    controller: usernameController,
                    validator: (inputVal){
                      if (inputVal.length > 0)
                        return null;
                      else
                        return "Please enter username";
                    },
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    obscureText: passwordHide,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        labelText: ' Password ',
                        suffix: GestureDetector(child: Icon(passwordHide ? Icons.remove_red_eye : Icons.remove_red_eye_outlined), onTap: (){setState(() {passwordHide = !passwordHide;});},),
                        border: UnderlineInputBorder()
                    ),
                    controller: passwordController,
                    validator: (inputVal){
                      if (inputVal.length > 0)
                        return null;
                      else
                        return "Please enter username";
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(width: 200, child: CheckboxListTile(controlAffinity: ListTileControlAffinity.leading, value: rememberMe, onChanged: (value){setState(() {rememberMe = value;});}, title: Text("Remember me"),)),
                      FlatButton(child: Text("Forgot Password", style: TextStyle(fontSize: 12),), textColor: Colors.blue, disabledTextColor: Colors.blue, onPressed: () {  },)
                    ],
                  ),
                  SizedBox(height: 30,),
                  RaisedButton(
                    shape: StadiumBorder(),
                    elevation: 1,
                    color: Colors.blue,
                    padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                    textColor: Colors.white,
                    child: Text("Login"),
                    onPressed: ()async{
                      if (formKey.currentState.validate())
                      await showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (ctx){
                            return AlertDialog(
                              title: Text("Your username is ${usernameController.text}"),
                              content: Text("Your password is ${passwordController.text}"),
                              actions: [
                                RaisedButton(
                                  shape: StadiumBorder(),
                                  elevation: 2,
                                  color: Colors.blue,
                                  textColor: Colors.white,
                                  child: Text("Continue"),
                                  onPressed: (){
                                    Navigator.of(context).pop();
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage(usernameController.text)));
                                  },
                                )
                              ],
                            );
                          }
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}