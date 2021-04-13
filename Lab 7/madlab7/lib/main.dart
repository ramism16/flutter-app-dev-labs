import 'package:flutter/material.dart';
import 'package:madlab7/recipeDetail.dart';
import 'package:splashscreen/splashscreen.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MAD LAB 7',
      debugShowCheckedModeBanner: false,
      home: Splash(),
      theme: ThemeData(
        fontFamily: "SFPro"
      ),
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
      title: Text("Cook Book!", style: TextStyle(fontSize: 18),),
      navigateAfterSeconds: RecipeView(),
    );
  }
}

class RecipeView extends StatefulWidget {
  @override
  _RecipeViewState createState() => _RecipeViewState();
}

class _RecipeViewState extends State<RecipeView> {
  Random random = new Random();
  List<String> recipeImages = [];
  var prepTime = [
    "30 Min",
    "20 Min",
    "10 Min",
    "40 Min",
    "60 Min",
    "50 Min"
  ];
  var recipeNames = [
    "Egg Benedict",
    "Mushroom Risotto",
    "Full Breakfast",
    "Hamburger",
    "Ham and Egg Sandwich",
    "Creme Brulee",
    "White Chocolate Donut",
    "Starbucks Coffee",
    "Vegetable Curry",
    "Instant Noodle with Egg",
    "Noodle with BBQ Pork",
    "Japanese Noodle with Pork",
    "Green Tea",
    "Thai Shrimp Cake",
    "Angry Birds Cake",
    "Ham and Cheese Panini",
  ];

  @override
  void initState() {
    super.initState();
    for (int i = 1; i < 17; i++) {
      String filename;
      if (i == 8)
        filename = "image$i.jpeg";
      else
        filename = "image$i.jpg";
      recipeImages.add(filename);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        flexibleSpace: Container(decoration: BoxDecoration(color: Colors.blue),),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text("Recipes", style: TextStyle(fontSize: 26, color: Colors.white),),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.zero,
              itemCount: recipeImages.length,
              separatorBuilder: (ctx, index) => Divider(height: 0, thickness: 2,),
              itemBuilder: (ctx, index) {
                String time = prepTime[random.nextInt(prepTime.length)];
                return ListTile(
                  dense: false,
                  contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  leading: Image.asset("files/recipeImages/" + recipeImages[index], errorBuilder: (ctx,obj,trace) => Icon(Icons.error,), width: 80,),
                  title: Text(recipeNames[index], style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),),
                  subtitle: Text("Prep Time: $time", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800)),
                  isThreeLine: true,
                  onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => RecipeDetailsScreen(recipeNames[index], time, recipeImages[index])));},
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
