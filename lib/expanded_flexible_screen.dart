
import 'package:flutter/material.dart';

class ExpandedFlexibleScreen extends StatefulWidget {
  const ExpandedFlexibleScreen({super.key});

  @override
  State<ExpandedFlexibleScreen> createState() => _ExpandedFlexibleScreenState();
}

class _ExpandedFlexibleScreenState extends State<ExpandedFlexibleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expanded Flexible Screen'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  height: 100,
                  // width: 100,
                  color: Colors.red,
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.blueAccent,
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.yellow,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.cyan,
                ),
              ),
              Expanded(
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.yellow,
                ),
              ),
              Expanded(
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.red,
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.orange,
                ),
              ),
              Flexible(
                flex: 5,
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.pink,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
