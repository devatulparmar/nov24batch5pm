
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nov24batch5pm/model/user_model.dart';
import 'package:nov24batch5pm/repository/api_repository.dart';

class StreamListScreen extends StatefulWidget {
  const StreamListScreen({super.key});

  @override
  State<StreamListScreen> createState() => _StreamListScreenState();
}

class _StreamListScreenState extends State<StreamListScreen> {
  final StreamController _streamController = StreamController();

  List tempList = [];
  List<UserData> originalUserList = [];

  Stream<List<UserData>> _getUserList() async* {
    var responseObject = await ApiRepository().getAPICall(
      url: "https://reqres.in/api/users?delay=3",
    );
    var dataObject = jsonDecode(responseObject.body);
    tempList = dataObject["data"] as List;
    originalUserList = tempList.map((item) => UserData.fromJson(item)).toList();
    _streamController.sink;
    yield originalUserList;
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream List Screen'),
      ),
      body: StreamBuilder(
        stream: _getUserList(),
        builder: (BuildContext context,AsyncSnapshot snapshot) {
          if(snapshot.hasData){
            return ListView.builder(
              itemCount: originalUserList.length,
              physics: const ScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  color: Colors.blueAccent,
                  elevation: 5,
                  margin: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(
                            originalUserList[index].avatar ?? "",
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("User Id : ${originalUserList[index].id ?? ''}"),
                            Text(
                                "User First Name : ${originalUserList[index].firstName ?? ''}"),
                            Text(
                                "User Last Name : ${originalUserList[index].lastName ?? ''}"),
                            Text(
                                "User Email : ${originalUserList[index].email ?? ''}"),
                            Text("User Age : ${originalUserList[index].age ?? ''}"),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            );
          }
          else if(snapshot.hasError){
            return Container();
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        }
      ),
    );
  }
}
