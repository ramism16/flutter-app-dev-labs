import 'package:flutter/material.dart';
import 'package:ramis_lab2/widgets/navbar.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:ramis_lab2/widgets/myAppBar.dart';
import 'package:ramis_lab2/widgets/myDrawer.dart';

String accountName;

void main() {runApp(MyApp());}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lab 4',
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
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool passwordHide = true;
  bool rememberMe = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
             padding: EdgeInsets.only(left: 40,right: 40, top: MediaQuery.of(context).size.height/6),
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Image.asset("files/flutter-logo.png"),
                 SizedBox(height: 10,),
                 TextFormField(
                   decoration: InputDecoration(
                     prefixIcon: Icon(Icons.email_outlined, color: Colors.grey,),
                     labelText: " Email ",
                     border: UnderlineInputBorder()
                   ),
                   controller: emailController,
                   onChanged: (newVal){accountName = newVal;},
                 ),
                 SizedBox(height: 10,),
                 TextFormField(
                   obscureText: passwordHide,
                   decoration: InputDecoration(
                     prefixIcon: Icon(Icons.lock),
                     labelText: ' Password ',
                     suffix: IconButton(icon: Icon(passwordHide ? Icons.remove_red_eye : Icons.remove_red_eye_outlined), onPressed: (){setState(() {passwordHide = !passwordHide;});},),
                     border: UnderlineInputBorder()
                   ),
                   controller: passwordController,
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Container(width: 200, child: CheckboxListTile(controlAffinity: ListTileControlAffinity.leading, value: rememberMe, onChanged: (value){setState(() {rememberMe = value;});}, title: Align(alignment: Alignment(-4,0),child: Text("Remember me")),)),
                     FlatButton(child: Text("Forgot Password", style: TextStyle(fontSize: 12),), textColor: Colors.blue, disabledTextColor: Colors.blue,)
                   ],
                 ),
                 SizedBox(height: 25,),
                 RaisedButton(
                   shape: StadiumBorder(),
                   elevation: 1,
                   color: Colors.blue,
                   padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                   textColor: Colors.white,
                   child: Text("Login"),
                   onPressed: (){
                     showDialog(
                       context: context,
                       barrierDismissible: false,
                       builder: (ctx){
                         return AlertDialog(
                           title: Text("Your username is ${emailController.text}"),
                           content: Text("Your password is ${passwordController.text}"),
                           actions: [FlatButton(
                             onPressed: (){
                               Navigator.of(context).pop();
                               Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen(Icons.home)));},
                             child: Text("Continue", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue,),),
                           )],
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
    );
  }
}

class HomeScreen extends StatelessWidget {
  IconData screenIcon;
  HomeScreen(this.screenIcon);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      drawer: myDrawer(accountName),
      bottomNavigationBar: myNavBar(0),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(screenIcon, size: 60,),
            Text("Home page #1 (tab 1)", style: TextStyle(color: Colors.blue, fontSize: 40),),
          ],
        ),
      ),
    );
  }
}

class AccountScreen extends StatelessWidget {
  IconData screenIcon;
  AccountScreen(this.screenIcon);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      drawer: myDrawer(accountName),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(screenIcon, size: 60,),
            Text("Account page #2", style: TextStyle(color: Colors.green, fontSize: 40),),
          ],
        ),
      ),
    );
  }
}

class FeedScreen extends StatelessWidget {
  IconData screenIcon;
  FeedScreen(this.screenIcon);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      drawer: myDrawer(accountName),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(screenIcon, size: 60,),
            Text("News Feed #3", style: TextStyle(color: Colors.orange, fontSize: 40),),
          ],
        ),
      ),
    );
  }
}

class HelpScreen extends StatelessWidget {
  IconData screenIcon;
  HelpScreen(this.screenIcon);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      drawer: myDrawer(accountName),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(screenIcon, size: 60,),
            Text("Help Screen #4", style: TextStyle(color: Colors.teal, fontSize: 40),),
          ],
        ),
      ),
    );
  }
}

class FeedbackScreen extends StatelessWidget {
  IconData screenIcon;
  FeedbackScreen(this.screenIcon);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      drawer: myDrawer(accountName),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(screenIcon, size: 60,),
            Text("Feedback screen #5", style: TextStyle(color: Colors.red, fontSize: 40),),
          ],
        ),
      ),
    );
  }
}

class TabsScreen extends StatefulWidget{

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen>  with TickerProviderStateMixin{
  TabController tabcontroller;

  Widget tabBar(BuildContext context) {
    this.tabcontroller = TabController(length: 3, initialIndex: 0, vsync: this);
    return TabBar(
      isScrollable: true,
      unselectedLabelColor: Colors.black,
      labelColor: Colors.white,
      labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
      unselectedLabelStyle: TextStyle(
          fontWeight: FontWeight.normal, fontSize: 13),
      indicatorSize: TabBarIndicatorSize.tab,
      controller: tabcontroller,
      indicator: BoxDecoration(
          gradient: LinearGradient(
              colors: [Theme
                  .of(context)
                  .primaryColor
                  .withOpacity(0.9), Theme
                  .of(context)
                  .primaryColor
                  .withOpacity(0.7)
              ]),
          borderRadius: BorderRadius.circular(22),
          color: Theme
              .of(context)
              .hintColor),
      tabs: [
        Tab(child: Text("First")),
        Tab(child: Text("Second")),
        Tab(child: Text("Third"))
      ],
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: myDrawer(accountName),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120),
        child: AppBar(
          centerTitle: true,
          title: Text("Lab 4 app", style: TextStyle(color: Colors.black),),
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
          backgroundColor: Colors.transparent,
          bottom: tabBar(context)
        ),
      ),
      body: TabBarView(
        controller: tabcontroller,
        children: [
          Center(child: Text("My First Screen", style: TextStyle(fontSize: 40),)),
          Center(child: Text("My Second Screen", style: TextStyle(fontSize: 40),)),
          Center(child: Text("My Third Screen", style: TextStyle(fontSize: 40),)),
        ],
      ),
    );
  }
}

