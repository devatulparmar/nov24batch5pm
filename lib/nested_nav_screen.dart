
import 'package:flutter/material.dart';
import 'package:nov24batch5pm/utils/route.dart';

class NestedNavScreen extends StatefulWidget {
  const NestedNavScreen({super.key});

  @override
  State<NestedNavScreen> createState() => _NestedNavScreenState();
}

class _NestedNavScreenState extends State<NestedNavScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'nested',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Colors.red,
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.green,
            iconTheme: IconThemeData(color: Colors.white),
            titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
          )),
      onGenerateRoute: MyAppRoute.onGenerateNestedRoute,
    );
  }
}
