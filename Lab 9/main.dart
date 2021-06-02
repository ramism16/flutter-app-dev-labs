import 'dart:math';
import 'package:expression_language/expression_language.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String calculation;
  String result;

  @override
  void initState() {
    super.initState();
    calculation = "";
    result = "0";
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        accentColor: Colors.orange
      ),
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 15, right: 3),
                child: Text(calculation, style: TextStyle(color: Colors.white, fontSize: 16),),
              ),
              Text(result, style: TextStyle(color: Colors.white, fontSize: 26),),
              GridView.count(
                primary: false,
                crossAxisCount: 4,
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                crossAxisSpacing: 0,
                mainAxisSpacing: 0,
                children: [
                  GestureDetector(
                    onTap: (){setState(() {
                        try{
                          calculation = "√($result) = ";
                          result = sqrt(double.parse(result)).toString();
                        }
                        catch(e){
                          result = "err";
                        }
                      });
                    },
                    child: Card(
                      elevation: 0.3,
                      child: Container(
                        color: Theme.of(context).accentColor,
                        child: Center(
                          child: Text("√", style: TextStyle(fontSize: 24, color: Colors.white)),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){setState(() {
                      try{
                        if (result != "0") {
                          if (result[0] != '-')
                            result = "-" + result;
                          else
                            result = result.substring(1);
                        }
                      }
                      catch(e){
                        print(e.toString());
                        result = "err";
                      }
                      });
                    },
                    child: Card(
                      elevation: 0.3,
                      child: Container(
                        color: Theme.of(context).accentColor,
                        child: Center(
                          child: Text("±", style: TextStyle(fontSize: 24, color: Colors.white)),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){setState(() {
                      try{
                        result = (double.parse(result) / 100).toString();
                      }
                      catch(e){
                        result = "err";
                      }
                      });
                    },
                    child: Card(
                      elevation: 0.3,
                      child: Container(
                        color: Theme.of(context).accentColor,
                        child: Center(
                          child: Text("%", style: TextStyle(fontSize: 24, color: Colors.white)),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){setState(() {
                      try{
                        calculation = "";
                        result = "0";
                      }
                      catch(e){
                        result = "err";
                      }
                    });},
                    child: Card(
                      elevation: 0.3,
                      child: Container(
                        child: Center(
                          child: Text("AC", style: TextStyle(fontSize: 24)),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){setState(() {
                      try{
                        if (result == "0")
                          result = "";
                        result = result + "7";
                      }
                      catch(e){
                        result = "err";
                      }
                    });},
                    child: Card(
                      elevation: 0.3,
                      child: Container(
                        child: Center(
                          child: Text("7", style: TextStyle(fontSize: 24)),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){setState(() {
                      try{
                        if (result == "0")
                          result = "";
                        result = result + "8";
                      }
                      catch(e){
                        result = "err";
                      }
                    });},
                    child: Card(
                      elevation: 0.3,
                      child: Container(
                        child: Center(
                          child: Text("8", style: TextStyle(fontSize: 24)),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){setState(() {
                      try{
                        if (result == "0")
                          result = "";
                        result = result + "9";
                      }
                      catch(e){
                        result = "err";
                      }
                    });},
                    child: Card(
                      elevation: 0.3,
                      child: Container(
                        child: Center(
                          child: Text("9", style: TextStyle(fontSize: 24)),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){setState(() {
                      try{
                        if (result != "0"){
                          if (calculation == "") {
                            calculation = result + " / ";
                            result = "0";
                          }
                        }
                      }
                      catch(e){
                        print(e);
                        result = "err";
                      }
                    });},
                    child: Card(
                      elevation: 0.3,
                      child: Container(
                        color: Theme.of(context).accentColor,
                        child: Center(
                          child: Text("÷", style: TextStyle(fontSize: 24, color: Colors.white)),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){setState(() {
                      try{
                        if (result == "0")
                          result = "";
                        result = result + "4";
                      }
                      catch(e){
                        result = "err";
                      }
                    });},
                    child: Card(
                      elevation: 0.3,
                      child: Container(
                        child: Center(
                          child: Text("4", style: TextStyle(fontSize: 24)),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){setState(() {
                      try{
                        if (result == "0")
                          result = "";
                        result = result + "5";
                      }
                      catch(e){
                        result = "err";
                      }
                    });},
                    child: Card(
                      elevation: 0.3,
                      child: Container(
                        child: Center(
                          child: Text("5", style: TextStyle(fontSize: 24)),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){setState(() {
                      try{
                        if (result == "0")
                          result = "";
                        result = result + "6";
                      }
                      catch(e){
                        result = "err";
                      }
                    });},
                    child: Card(
                      elevation: 0.3,
                      child: Container(
                        child: Center(
                          child: Text("6", style: TextStyle(fontSize: 24)),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){setState(() {
                      try{
                        if (result != "0"){
                          if (calculation == "") {
                            calculation = result + " * ";
                            result = "0";
                          }
                        }
                      }
                      catch(e){
                        result = "err";
                      }
                    });},
                    child: Card(
                      elevation: 0.3,
                      child: Container(
                        color: Theme.of(context).accentColor,
                        child: Center(
                          child: Text("x", style: TextStyle(fontSize: 24, color: Colors.white)),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){setState(() {
                      try{
                        if (result == "0")
                          result = "";
                        result = result + "1";
                      }
                      catch(e){
                        result = "err";
                      }
                    });},
                    child: Card(
                      elevation: 0.3,
                      child: Container(
                        child: Center(
                          child: Text("1", style: TextStyle(fontSize: 24)),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){setState(() {
                      try{
                        if (result == "0")
                          result = "";
                        result = result + "2";
                      }
                      catch(e){
                        result = "err";
                      }
                    });},
                    child: Card(
                      elevation: 0.3,
                      child: Container(
                        child: Center(
                          child: Text("2", style: TextStyle(fontSize: 24)),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){setState(() {
                      try{
                        if (result == "0")
                          result = "";
                        result = result + "3";
                      }
                      catch(e){
                        result = "err";
                      }
                    });},
                    child: Card(
                      elevation: 0.3,
                      child: Container(
                        child: Center(
                          child: Text("3", style: TextStyle(fontSize: 24)),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){setState(() {
                      try{
                        if (result != "0"){
                          if (calculation == "") {
                            calculation = result + " - ";
                            result = "0";
                          }
                        }
                      }
                      catch(e){
                        result = "err";
                      }
                    });},
                    child: Card(
                      elevation: 0.3,
                      child: Container(
                        color: Theme.of(context).accentColor,
                        child: Center(
                          child: Text("-", style: TextStyle(fontSize: 24, color: Colors.white)),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){setState(() {
                      try{
                        result = result + ".";
                      }
                      catch(e){
                        result = "err";
                      }
                    });},
                    child: Card(
                      elevation: 0.3,
                      child: Container(
                        child: Center(
                          child: Text(".", style: TextStyle(fontSize: 24)),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){setState(() {
                      try{
                        if (result != "0")
                          result = result + "0";
                      }
                      catch(e){
                        result = "err";
                      }
                    });},
                    child: Card(
                      elevation: 0.3,
                      child: Container(
                        child: Center(
                          child: Text("0", style: TextStyle(fontSize: 24)),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){setState(() {
                      try{
                        if (calculation.contains("+") || calculation.contains("-") || calculation.contains("/") || calculation.contains(" * ")){
                          calculation = calculation + result;

                          var expressionGrammarDefinition = ExpressionGrammarParser({});
                          var parser = expressionGrammarDefinition.build();
                          var expression = parser.parse(calculation).value as Expression;

                          calculation += " =";

                          result = expression.evaluate().toString();
                        }
                      }
                      catch(e){
                        print(e);
                        result = "err";
                      }
                    });},
                    child: Card(
                      elevation: 0.3,
                      child: Container(
                        child: Center(
                          child: Text("=", style: TextStyle(fontSize: 24)),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){setState(() {
                      try{
                        if (result != "0"){
                          if (calculation == "") {
                            calculation = result + " + ";
                            result = "0";
                          }
                        }
                      }
                      catch(e){
                        result = "err";
                      }
                    });},
                    child: Card(
                      elevation: 0.3,
                      child: Container(
                        color: Theme.of(context).accentColor,
                        child: Center(
                          child: Text("+", style: TextStyle(fontSize: 24, color: Colors.white)),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      )
    );
  }
}

