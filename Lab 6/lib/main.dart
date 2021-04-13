import 'package:flutter/material.dart';
import 'package:madlab6/cover_letter.dart';
import 'package:madlab6/personal_info.dart';
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
      title: Text("CV Maker", style: TextStyle(fontSize: 18),),
      navigateAfterSeconds: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        centerTitle: true,
        title: Text("Resume Builder", style: TextStyle(fontSize: 18),),
      ),
      body: DefaultTextStyle(
        style: TextStyle(fontWeight: FontWeight.bold),
        child: Column(
          children: [
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 20),
              title: Text("Personal Information", style: TextStyle(color: Colors.blue, fontSize: 20),),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey,),
              onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => PersonalInfoPage()));},
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 20),
              title: Text("Cover Letter", style: TextStyle(color: Colors.blue, fontSize: 20),),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey,),
              onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => CoverLetterPage()));},
            )
          ],
        ),
      ),
    );
  }
}
