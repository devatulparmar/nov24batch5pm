
import 'dart:async';

import 'package:flutter/material.dart';

class MyStreamScreen extends StatefulWidget {
  const MyStreamScreen({super.key});

  @override
  State<MyStreamScreen> createState() => _MyStreamScreenState();
}

class _MyStreamScreenState extends State<MyStreamScreen> {
  final StreamController _streamController = StreamController();
  Stream get _streamObject => _streamController.stream;

  Future<int> sumStream(Stream<int> stream) async {
    var sum = 0;

    /// when multiple value added by controller
    await for (final value in stream) {
      sum += value;
      print("value $value ,sum $sum");
    }
    return sum;
  }

  Stream<int> countStream(int to) async* {
    for (int i = 1; i <= to; i++) {
      ///return value
      yield i;
    }
  }

  void _calculate() async {
    var streamObject = countStream(10);
    var sum = await sumStream(streamObject);
    print("Total sum is : $sum");
  }

  void _myFunction() async {
    _streamController.sink.add(1014);
    _streamController.sink.add(163641);

    ///print only when value is one
    /// receive output value
    // StreamSubscription singleStreamSubscription = _streamObject.listen((value){
    //   print('_streamObject value: $value');
    // });
    //
    // singleStreamSubscription.cancel();
    ///print only when value are more than one
    await for (final v in _streamObject) {
      print("value $v");
    }
  }

  @override
  void initState() {
    super.initState();
    // _streamController.add("hello");
  }

  void _getValue() {
    _streamObject.listen(
          (dynamic value) {
        print("value: $value");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream Example'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              _myFunction();
              // _calculate();
              // getValue();
            },
            child: const Text('Get the value'),
          ),
        ],
      ),
    );
  }
}