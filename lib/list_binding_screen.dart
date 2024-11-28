import 'package:flutter/material.dart';

class ListBindingScreen extends StatefulWidget {
  const ListBindingScreen({super.key});

  @override
  State<ListBindingScreen> createState() => _ListBindingScreenState();
}

class _ListBindingScreenState extends State<ListBindingScreen> {
  List<int> listObject = [1, 2, 3, 4, 5, 6];

  List<String> cityNamesListObject = ["Vadodara", "Ahmedabad", "Surat", "Rajkot"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Binding Screen'),
      ),
      body: ListView.builder(
        itemCount: cityNamesListObject.length,
        physics: const ScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 300,
            width: 300,
            color: Colors.blueAccent,
            margin: const EdgeInsets.all(10),
            child: Center(
              child: Text(cityNamesListObject[index].toString()),
            ),
          );
        },
      ),
    );
  }
}
