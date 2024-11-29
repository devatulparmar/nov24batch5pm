
import 'package:flutter/material.dart';

class GridviewCountScreen extends StatefulWidget {
  const GridviewCountScreen({super.key});

  @override
  State<GridviewCountScreen> createState() => _GridviewCountScreenState();
}

class _GridviewCountScreenState extends State<GridviewCountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gridview Count Screen'),
      ),
      body: GridView.count(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 5,
        childAspectRatio: 0.5,
        children: [
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.grey,
          ),
          Container(
            color: Colors.yellow,
          ),
          Container(
            color: Colors.purple,
          ),
          Container(
            color: Colors.brown,
          ),
          Container(
            color: Colors.lightBlue,
          ),
          Container(
            color: Colors.pink,
          ),
        ],
      ),
    );
  }
}
