
import 'package:flutter/material.dart';

class ListBuildScreen extends StatefulWidget {
  const ListBuildScreen({super.key});

  @override
  State<ListBuildScreen> createState() => _ListBuildScreenState();
}

class _ListBuildScreenState extends State<ListBuildScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Build Screen'),
      ),
      body: ListView.builder(
        itemCount: 10,
        reverse: false,
        physics: const ScrollPhysics(),
        scrollDirection: Axis.horizontal,
        // physics: const FixedExtentScrollPhysics(),
        // physics: const ClampingScrollPhysics(),
        // physics: const BouncingScrollPhysics(),
        // physics: const AlwaysScrollableScrollPhysics(),
        // physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index){
          return Container(
            height: 300,
            width: 300,
            color: Colors.blueAccent,
            margin: const EdgeInsets.all(10),
            child: Center(
              child: Text(index.toString()),
            ),
          );
        },
      ),
    );
  }
}
