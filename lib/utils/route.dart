import 'package:flutter/material.dart';
import 'package:nov24batch5pm/no_route_found_screen.dart';
import 'package:nov24batch5pm/screen1.dart';
import 'package:nov24batch5pm/screen2.dart';
import 'package:nov24batch5pm/screen5.dart';
import 'package:nov24batch5pm/utils/constants.dart';

class MyAppRoute {
  static Route<dynamic> onGenerateRoute(RouteSettings settingObject) {
    Widget screenObject;
    switch (settingObject.name) {
      case '/':
        screenObject = const Screen1();
        break;
      case routeScreen2:
        screenObject = Screen2(arguments: settingObject.arguments);
        break;
      case routeScreen5:
        screenObject = const Screen5();
      default:
        screenObject = NoRouteFoundScreen(name: settingObject.name.toString());
    }
    return MaterialPageRoute(builder: (BuildContext context) => screenObject);
  }
}
