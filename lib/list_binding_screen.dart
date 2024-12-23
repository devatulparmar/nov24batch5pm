import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ListBindingScreen extends StatefulWidget {
  const ListBindingScreen({super.key});

  @override
  State<ListBindingScreen> createState() => _ListBindingScreenState();
}

class _ListBindingScreenState extends State<ListBindingScreen> {
  List<int> listObject = [1, 2, 3, 4, 5, 6];

  List<String> cityNamesListObject = ["Vadodara", "Ahmedabad", "Surat", "Rajkot"];
  List userList = [];
  List list = [];

  Future _getUserList() async {
    Uri urlLink = Uri.parse("https://reqres.in/api/users");
    http.Response responseObject = await http.get(urlLink);
    var dataObject = jsonDecode(responseObject.body);
    userList = dataObject["data"] as List;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _getUserList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Binding Screen'),
      ),
      body: ListView.builder(
        itemCount: userList.length,
        physics: const ScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 300,
            width: 300,
            color: Colors.blueAccent,
            margin: const EdgeInsets.all(10),
            child: Center(
              child: CircleAvatar(
                radius: 100,
                backgroundImage: NetworkImage(userList[index]["avatar"].toString(),),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          // cityNamesListObject.addAll(["Halol", "Kalol"]);
          // cityNamesListObject.add(["Halol", "Kalol"]);
          setState(() {});
        },
        child: const Icon(
          Icons.remove,
        ),
      ),
    );
  }
}
