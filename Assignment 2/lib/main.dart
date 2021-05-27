import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:assignment01/pages/splash_screen.dart';
import 'package:assignment01/pages/semesters_list.dart';
import 'package:assignment01/pages/semester_detail.dart';

void main() {
  runApp(App());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
class RouteGenerator {
  static ValueNotifier currentRoute = ValueNotifier("");
  static Route<dynamic> onGenerateRoute(RouteSettings settings){
    final args = settings.arguments;
    switch (settings.name){
      case "/Splash":
        currentRoute.value = "/Splash";
        return PageTransition(child: Splash(), type: PageTransitionType.fade);
      case "/SemestersList":
        currentRoute.value = "/SemestersList";
        return PageTransition(child: SemestersListPage(), type: PageTransitionType.scale);
      case "/SemesterDetails":
        currentRoute.value = "/SemesterDetails";
        return PageTransition(child: SemesterDetailPage(args), type: PageTransitionType.rightToLeft);
      default:
        return PageTransition(child: ErrorWidget.withDetails(message: "Route name ${settings.name} does not exist",), type: PageTransitionType.fade);
    }
  }
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      initialRoute: "/Splash",
      onGenerateRoute: RouteGenerator.onGenerateRoute,
      theme: ThemeData(fontFamily: "CenturyGothic")
      );
  }
}