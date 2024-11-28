
import 'package:flutter/material.dart';
import 'package:nov24batch5pm/utils/constants.dart';

class NestedListScreen extends StatefulWidget {
  const NestedListScreen({super.key});

  @override
  State<NestedListScreen> createState() => _NestedListScreenState();
}

class _NestedListScreenState extends State<NestedListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nested List Screen'),
      ),
      body: ListView(
        physics: const ScrollPhysics(),
        children: [
          Container(
            height: 300,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(img1),
              ),
            ),
          ),
          ListView.separated(
            itemCount: 15,
            padding: const EdgeInsets.all(10),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (BuildContext context, int index){
              return Container(
                height: 1,
                color: Colors.grey,
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
          Container(
            height: 300,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(imgNetwork),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
