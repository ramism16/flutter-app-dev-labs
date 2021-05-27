import 'dart:async';

import 'package:assignment01/model/student.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  Future<dynamic> loadDataOnLaunch() async {
    await Student.readState();
    return "/SemestersList";
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      navigateAfterFuture: loadDataOnLaunch(),
      loaderColor: Colors.deepOrangeAccent,
      backgroundColor: Colors.deepPurple,
      image: Image.asset("assets/flutter-logo.png"),
    );
  }
}
