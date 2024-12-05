
import 'package:flutter/material.dart';
import 'package:nov24batch5pm/screen3.dart';

class Screen2 extends StatefulWidget {
  const Screen2({
    super.key,
    required this.arguments,
  });

  final arguments;

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Screen 2'),
        // leading: IconButton(
        //   onPressed: (){
        //     Navigator.pop(context);
        //   },
        //   icon: const Icon(
        //     Icons.arrow_back,
        //   ),
        // ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(widget.arguments['age'].toString()),
          Text(widget.arguments['name'].toString()),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const Screen3(),
                  ),
                );
              },
              child: const Text('Go to Screen 3'),
            ),
          ),
        ],
      ),
    );
  }
}
