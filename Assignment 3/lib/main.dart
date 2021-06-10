import 'package:assignment01/task_detail.dart';
import 'package:assignment01/task_list.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';

import 'login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: RouteGenerator.navigatorKey,
      initialRoute: '/Splash',
      onGenerateRoute: RouteGenerator.generateRouteWithTransition,
      theme: ThemeData(fontFamily: "CenturyGothic"),
    );
  }
}

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 5,
      backgroundColor: Colors.white,
      image: Image.asset('assets/flutter-logo.png'),
      loaderColor: Colors.blue,
      photoSize: 150,
      navigateAfterSeconds: Login(),
    );
  }
}

class RouteGenerator{
  static final navigatorKey = GlobalKey<NavigatorState>();
  static Route<dynamic> generateRouteWithTransition(RouteSettings settings){
    final args = settings.arguments;
    switch (settings.name){
      case '/Splash':
        return PageTransition(type: PageTransitionType.fade, child: Splash());
      case '/TaskList':
        return PageTransition(type: PageTransitionType.fade, child: TasksListPage());
      case '/TaskDetail':
        return PageTransition(type: PageTransitionType.fade, child: TaskDetail(args));
    }
  }
}