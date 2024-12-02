import 'package:flutter/material.dart';
import 'package:nov24batch5pm/screen2.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  String myString = "Hello from Screen 1";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Screen1'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(myString),
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => Screen2(
                      myStringValue: myString,
                      age: 5,
                    ),
                  ),
                );

                // Navigator.pushReplacement(
                //   context,
                //   MaterialPageRoute(
                //     builder: (BuildContext context) =>const Screen2(),
                //   ),
                // );
              },
              child: const Text('Go to Screen 2'),
            ),
          ),
        ],
      ),
    );
  }
}
