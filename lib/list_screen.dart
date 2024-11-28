
import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Screen'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        children: [
          Container(
            height: 300,
            width: 300,
            color: Colors.red,
          ),
          Container(
            height: 300,
            width: 300,
            color: Colors.green,
          ),
          Container(
            height: 300,
            width: 300,
            color: Colors.orange,
          ),
        ],
      ),
    );
  }
}
