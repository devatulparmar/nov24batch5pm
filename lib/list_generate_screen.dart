import 'package:flutter/material.dart';

class ListGenerateScreen extends StatefulWidget {
  const ListGenerateScreen({super.key});

  @override
  State<ListGenerateScreen> createState() => _ListGenerateScreenState();
}

class _ListGenerateScreenState extends State<ListGenerateScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Generate Screen'),
      ),
      body: ListView(
        children: List.generate(
          15,
              (int index) {
            return Container(
              color: Colors.blue,
              height: 300,
              width: 200,
              margin: const EdgeInsets.all(5),
            );
          },
        ),
      ),
    );
  }
}
