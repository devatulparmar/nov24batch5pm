import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hello This is My App'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(),
            Text('Clicked This Times'),
            Text('0'),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            print('clicked');
          },
          child: Icon(
            Icons.add,
          ),
        ),
      ),
    ),
  );
}
