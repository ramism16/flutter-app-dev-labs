import 'package:assignment01/model/student.dart';
import 'package:flutter/material.dart';

Widget myAppBar(){
  return AppBar(
    automaticallyImplyLeading: false,
    actions: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Image.asset("assets/Ramis1.jpg"),
      ),
    ],
    title: Text(Student.instance.name, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
    centerTitle: true,
    backgroundColor: Colors.red,
    elevation: 0,
  );
}