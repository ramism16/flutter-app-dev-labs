import 'package:flutter/material.dart';
import 'package:madlab5/calculation.dart';

class HomePage extends StatefulWidget {
  String username;
  HomePage(this.username);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final num1Controller = TextEditingController();
  final num2Controller = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(widget.username),
          automaticallyImplyLeading: false,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40).add(EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom)),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.looks_one_outlined),
                        labelText: " Number ",
                        border: OutlineInputBorder()
                    ),
                    controller: num1Controller,
                    validator: (inputVal){
                      if (inputVal.length > 0 && (int.tryParse(inputVal) != null))
                        return null;
                      else
                        return "Please enter a whole number";
                    },
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.looks_two_outlined),
                        labelText: ' Number ',
                        border: OutlineInputBorder()
                    ),
                    controller: num2Controller,
                    validator: (inputVal){
                      if (inputVal.length > 0 && (int.tryParse(inputVal) != null))
                        return null;
                      else
                        return "Please enter a whole number";
                    },
                  ),
                  SizedBox(height: 20,),
                  FlatButton(
                    height: 40,
                    minWidth: MediaQuery.of(context).size.width - 250,
                    color: Colors.blue,
                    textColor: Colors.white,
                    child: Text("Proceed", style: TextStyle(fontSize: 18),),
                    onPressed: (){
                      if (formKey.currentState.validate())
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => CalculationScreen(int.parse(num1Controller.text), int.parse(num2Controller.text))));
                    }
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
