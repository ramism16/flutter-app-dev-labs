import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

Future<int> getSharedPrefsInt() async{
  final prefs = await SharedPreferences.getInstance();
  return prefs.getInt("integerValue");
}

Future removeSharedPrefsInt() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove("integerValue");
}

Future saveSharedPrefsInt(int newInt) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setInt("integerValue", newInt);
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  int randomNumber;

  @override
  void initState() {
    super.initState();
    randomNumber = Random().nextInt(1000);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Generated random number", style: TextStyle(fontSize: 28),),
              Text(randomNumber.toString(), style: TextStyle(fontSize: 28),),
              SizedBox(height: 30,),
              Text("Shared preferences number", style: TextStyle(fontSize: 28),),
              FutureBuilder(
                future: getSharedPrefsInt(),
                builder: (context, snapshot){
                  if (snapshot.hasData){
                    return Text(snapshot.data.toString(), style: TextStyle(fontSize: 28),);
                  }
                  else {
                    if (snapshot.hasError) print(snapshot.error);
                    return SizedBox.shrink();
                  }
                },
              ),
              SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton(
                    color: Colors.orange,
                    textColor: Colors.white,
                    child: Text("Load"),
                    onPressed: (){setState(() {});},
                  ),
                  RaisedButton(
                    color: Colors.green,
                    textColor: Colors.white,
                    child: Text("Random"),
                    onPressed: (){setState(() {randomNumber = Random().nextInt(1000);});},
                  ),
                  RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    child: Text("Save"),
                    onPressed: () async {
                      await saveSharedPrefsInt(randomNumber);},
                  ),
                  RaisedButton(
                      color: Colors.red,
                      textColor: Colors.white,
                      child: Text("Delete"),
                      onPressed: () async {
                        await removeSharedPrefsInt();}
                  )
                ],
              ),
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
