
import 'package:flutter/material.dart';
import 'package:nov24batch5pm/screen4.dart';

class Screen3 extends StatefulWidget {
  const Screen3({super.key});

  @override
  State<Screen3> createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: const Text('Screen 3'),
      ),
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const Screen4(),
                  ),
                );
              },
              child: const Text('Go to Screen 4'),
            ),
          ),
         const SizedBox(height: 40,),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, 'screen4');
              },
              child: const Text('Goto Next Screen 4'),
            ),
          ),
        ],
      ),
    );
  }
}
