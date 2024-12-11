import 'package:flutter/material.dart';
import 'package:nov24batch5pm/gridview_products_list.dart';
import 'package:nov24batch5pm/home_screen.dart';
import 'package:nov24batch5pm/login_screen.dart';
import 'package:nov24batch5pm/login_screen2.dart';
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
        screenObject = const HomeScreen();
        break;
      case routeScreen2:
        screenObject = Screen2(arguments: settingObject.arguments);
        break;
      case routeScreen5:
        screenObject = const Screen5();
      case routeLoginScreen:
        screenObject = const LoginScreen();
      case routeLoginScreen2:
        screenObject = const LoginScreen2();
      case routeGridviewProductsList:
        screenObject = const GridviewProductsList();
      default:
        screenObject = NoRouteFoundScreen(name: settingObject.name.toString());
    }
    return MaterialPageRoute(builder: (BuildContext context) => screenObject);
  }
}
