
import 'package:flutter/material.dart';

class NoRouteFoundScreen extends StatefulWidget {
  final String name;

  const NoRouteFoundScreen({super.key, required this.name});

  @override
  State<NoRouteFoundScreen> createState() => _NoRouteFoundScreenState();
}

class _NoRouteFoundScreenState extends State<NoRouteFoundScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text('${widget.name} not found'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Go back'),
          ),
        ],
      ),
    );
  }
}
