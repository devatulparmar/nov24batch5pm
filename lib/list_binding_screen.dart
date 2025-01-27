import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:nov24batch5pm/model/user_model.dart';
import 'package:nov24batch5pm/repository/api_repository.dart';

class ListBindingScreen extends StatefulWidget {
  const ListBindingScreen({super.key});

  @override
  State<ListBindingScreen> createState() => _ListBindingScreenState();
}

class _ListBindingScreenState extends State<ListBindingScreen> {
  List<int> listObject = [1, 2, 3, 4, 5, 6];

  List<String> cityNamesListObject = [
    "Vadodara",
    "Ahmedabad",
    "Surat",
    "Rajkot"
  ];
  List tempList = [];
  List<UserData> originalUserList = [];

  Future<List<UserData>> _getUserList() async {
    Uri urlLink = Uri.parse("https://reqres.in/api/users");
    // http.Response responseObject = await http.get(urlLink);
    var responseObject = await ApiRepository().getAPICall(
      url: "https://reqres.in/api/users",
    );
    var dataObject = jsonDecode(responseObject.body);
    tempList = dataObject["data"] as List;
    originalUserList = tempList.map((item) => UserData.fromJson(item)).toList();
    setState(() {});
    return originalUserList;
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
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: (){
      //     // cityNamesListObject.addAll(["Halol", "Kalol"]);
      //     // cityNamesListObject.add(["Halol", "Kalol"]);
      //     setState(() {});
      //   },
      //   child: const Icon(
      //     Icons.remove,
      //   ),
      // ),
    );
  }
}
