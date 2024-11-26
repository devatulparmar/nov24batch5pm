import 'package:flutter/material.dart';

class CountScreen extends StatefulWidget {
  const CountScreen({super.key});

  @override
  State<StatefulWidget> createState() => _CountScreenState();
}

class _CountScreenState extends State<CountScreen> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello This is My App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Row(),
          const Text('Clicked This Times'),
          Text("Count Number is : ${count.toString()}"),
          Text(count.toString()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {});
          print('clicked');
          count++;
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
