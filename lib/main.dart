import 'package:flutter/material.dart';
import 'package:nov24batch5pm/home_screen.dart';
import 'package:nov24batch5pm/sales_screen.dart';
import 'package:nov24batch5pm/screen1.dart';
import 'package:nov24batch5pm/stateful_lifecycle_screen.dart';
import 'package:nov24batch5pm/utils/constants.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.red,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.green,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
        )
      ),
      home: const SalesScreen(),
      // routes: {
      //   "/": (BuildContext context) => const HomeScreen(),
      //   routeStatefulLifeCycleScreen: (BuildContext context) => const StatefulLifecycleScreen(),
      // },
    );
  }
}
