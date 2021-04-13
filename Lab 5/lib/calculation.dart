import 'package:flutter/material.dart';

class CalculationScreen extends StatefulWidget {
  int number1;
  int number2;

  CalculationScreen(this.number1, this.number2);
  @override
  _CalculationScreenState createState() => _CalculationScreenState();
}

class _CalculationScreenState extends State<CalculationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 200,
        leading: GestureDetector(
          onTap: (){Navigator.of(context).pop();},
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: 10,),
              Icon(Icons.arrow_back_ios),
              Text("Back", style: TextStyle(color: Colors.white, fontSize: 16),)
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: DefaultTextStyle(
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.grey,
                ),
                child: Text("Section total: ${3 + widget.number1 + widget.number2}", style: TextStyle(fontSize: 18),),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [Text("1"), Text("+"), Text(widget.number1.toString()), Text("="), Text((widget.number1 + 1).toString())],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [Text("2"), Text("+"), Text(widget.number2.toString()), Text("="), Text((widget.number2 + 2).toString())],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [Text("Total : "), Text("3"), Text("+"), Text((widget.number1 + widget.number2).toString()), Text("="), Text((widget.number1 + widget.number2 + 3).toString())],
                    )
                  ],
                ),
              ),
              Divider(thickness: 2,height: 3,),
              Container(
                padding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.grey,
                ),
                child: Text("Section total: ${7 + widget.number1 + widget.number2}", style: TextStyle(fontSize: 18),),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [Text("3"), Text("+"), Text(widget.number1.toString()), Text("="), Text((widget.number1 + 3).toString())],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [Text("4"), Text("+"), Text(widget.number2.toString()), Text("="), Text((widget.number2 + 4).toString())],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [Text("Total : "), Text("7"), Text("+"), Text((widget.number1 + widget.number2).toString()), Text("="), Text((widget.number1 + widget.number2 + 7).toString())],
                    )
                  ],
                ),
              ),
              Divider(thickness: 2,),
            ],
          ),
        ),
      ),
    );
  }
}
