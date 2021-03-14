import 'package:flutter/material.dart';

Widget myAppBar(){
  return AppBar(
    centerTitle: true,
    title: Text("Lab 4 app", style: TextStyle(color: Colors.black),),
    elevation: 0,
    backgroundColor: Colors.transparent,
    iconTheme: IconThemeData(color: Colors.black),
  );
}
