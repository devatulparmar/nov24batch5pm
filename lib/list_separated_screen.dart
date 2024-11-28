import 'package:flutter/material.dart';

class ListSeparatedScreen extends StatefulWidget {
  const ListSeparatedScreen({super.key});

  @override
  State<ListSeparatedScreen> createState() => _ListSeparatedScreenState();
}

class _ListSeparatedScreenState extends State<ListSeparatedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Separated Screen'),
      ),
      body: ListView.separated(
        itemCount: 15,
        padding: const EdgeInsets.all(10),
        separatorBuilder: (BuildContext context, int index){
          return Container(
            height: 1,
            color: Colors.black,
          );
        },
        itemBuilder: (BuildContext context, int index){
          return Container(
            height: 200,
            width: 200,
            color: Colors.red,
            child: Center(
              child: Text(index.toString()),
            ),
          );
        },
      ),
    );
  }
}
