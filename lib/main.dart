import 'package:flutter/material.dart';
import 'package:nov24batch5pm/utils/constants.dart';
import 'package:nov24batch5pm/utils/route.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'main',
      debugShowCheckedModeBanner: false,
      navigatorKey: mainKey,
      theme: ThemeData(
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Colors.red,
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.green,
            iconTheme: IconThemeData(color: Colors.white),
            titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
          ),
      ),
      onGenerateRoute: MyAppRoute.onGenerateRoute,
      // routes: {
      //   "/": (BuildContext context) => const Screen1(),
      //   "screen2": (BuildContext context) => Screen2(age: ,myStringValue: ,),
      //   "screen3": (BuildContext context) => const Screen3(),
      // },
    );
  }
}
