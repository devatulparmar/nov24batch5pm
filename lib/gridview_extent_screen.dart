import 'package:flutter/material.dart';
import 'package:nov24batch5pm/utils/common_drawer_screen.dart';

class GridviewExtentScreen extends StatefulWidget {
  const GridviewExtentScreen({super.key});

  @override
  State<GridviewExtentScreen> createState() => _GridviewExtentScreenState();
}

class _GridviewExtentScreenState extends State<GridviewExtentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gridview Extent Screen'),
      ),
      drawer: const CommonDrawerScreen(),
      body: GridView.extent(
        maxCrossAxisExtent: 300,
        mainAxisSpacing: 10,
        crossAxisSpacing: 5,
        childAspectRatio: 0.5,
        children: List.generate(
          15,
          (int index) => Container(
            color: Colors.red,
          ),
        ),
        // children: [
        //   Container(
        //     color: Colors.red,
        //   ),
        //   Container(
        //     color: Colors.blue,
        //   ),
        //   Container(
        //     color: Colors.grey,
        //   ),
        //   Container(
        //     color: Colors.yellow,
        //   ),
        //   Container(
        //     color: Colors.purple,
        //   ),
        //   Container(
        //     color: Colors.brown,
        //   ),
        //   Container(
        //     color: Colors.lightBlue,
        //   ),
        //   Container(
        //     color: Colors.pink,
        //   ),
        // ],
      ),
    );
  }
}
