import 'package:flutter/material.dart';

class RecipeDetailsScreen extends StatefulWidget {
  String recipeName;
  String recipeTime;
  String recipeImage;
  RecipeDetailsScreen(this.recipeName, this.recipeTime, this.recipeImage);
  @override
  _RecipeDetailsScreenState createState() => _RecipeDetailsScreenState();
}

class _RecipeDetailsScreenState extends State<RecipeDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Text("Recipe Detail View", style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800),),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
          child: Column(
            children: [
              SizedBox(height: 80,),
              Image.asset("files/recipeImages/" + widget.recipeImage, errorBuilder: (ctx,obj,trace) => Icon(Icons.error,), ),
              SizedBox(height: 20,),
              Text(widget.recipeName, style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),),
              SizedBox(height: 20,),
              Text("Prep time: ${widget.recipeTime}",style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
              SizedBox(height: 20,),
              Text("Amazing recipe for your ultimate cravings! Guaranteed to get you licking your fingers.")
            ],
          ),
        ),
      )
    );
  }
}
