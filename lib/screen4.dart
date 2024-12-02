import 'package:flutter/material.dart';
import 'package:nov24batch5pm/screen1.dart';

class Screen4 extends StatefulWidget {
  const Screen4({super.key});

  @override
  State<Screen4> createState() => _Screen4State();
}

class _Screen4State extends State<Screen4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text('Screen 4'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigator.pop(context); ///Remove Screen4
            // Navigator.pop(context); ///Remove Screen3
            // Navigator.pop(context); ///Remove Screen2
            // Navigator.pushReplacement(
            //   context,
            //   MaterialPageRoute(
            //     builder: (BuildContext context) => const Screen1(),
            //   ),
            // ); ///Remove old Screen1 and Add New Screen1
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => const Screen1(),
              ),
              (Route routeObject) => false,
            );
          },
          child: const Text('Go to Screen 1'),
        ),
      ),
    );
  }
}
