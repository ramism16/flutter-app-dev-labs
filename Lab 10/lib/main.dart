import 'package:flutter/material.dart';
import 'package:madlab10/api_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage()
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: fetchData(),
          builder: (context, snapshot){
            if (snapshot.hasData){
              return ListView.separated(
                separatorBuilder: (context, index) => SizedBox(height: 10,),
                itemBuilder: (context, index){
                  return ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    dense: false,
                    isThreeLine: true,
                    title: Text("ID: " + snapshot.data[index].id.toString()),
                    subtitle: Text("Title: " + snapshot.data[index].title),
                  );
                },
                itemCount: snapshot.data.length,
              );
            }
            else{
              if (snapshot.hasError){
                return AlertDialog(
                  title: Text("Error"),
                  content: Text(snapshot.error.toString()),
                  actions: [
                    FlatButton(
                      child: Text("Retry"),
                      onPressed: (){
                        Navigator.of(context).pop();
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
                      },
                    )
                  ],
                );
              }
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
