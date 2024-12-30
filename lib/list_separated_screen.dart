import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:nov24batch5pm/model/InfiniteUsersModel.dart';
import 'package:nov24batch5pm/repository/api_repository.dart';
import 'package:nov24batch5pm/utils/common_snackbar.dart';

class ListSeparatedScreen extends StatefulWidget {
  const ListSeparatedScreen({super.key});

  @override
  State<ListSeparatedScreen> createState() => _ListSeparatedScreenState();
}

class _ListSeparatedScreenState extends State<ListSeparatedScreen> {
  List<Users> employeeList = [];
  List tempList = [];
  static const _pageLimit = 5;

  final PagingController<int, Users> _pagingController =
      PagingController(firstPageKey: 0);

  Future _getUsers(int offset) async {
    try {
      var responseObj = await ApiRepository().getAPICall(
          url:
              'https://api.slingacademy.com/v1/sample-data/users?offset=$offset&limit=$_pageLimit');

      if (responseObj.statusCode == 200) {
        var jsonDataObj = jsonDecode(responseObj.body);
        tempList = jsonDataObj['users'] as List;
        employeeList = tempList.map((dynamic element) => Users.fromJson(element)).toList();

        final isLastPage = employeeList.length < _pageLimit;
        if (isLastPage == true) {
          _pagingController.appendLastPage(employeeList);
        } else {
          _pagingController.appendPage(employeeList, _pageLimit);
        }
        setState(() {});
      } else {
        MySnackBar.showMySnackBar(content: 'Something went wrong! ');
      }
    } catch (error) {
      MySnackBar.showMySnackBar(
          content: 'Something Went Wrong! ${_pagingController.error}');
    }
  }

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener(
      (int pageNumber) => _getUsers(pageNumber),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Separated Screen'),
      ),
      body: PagedListView<int, Users>(
        pagingController: _pagingController,
        physics: const BouncingScrollPhysics(),
        builderDelegate: PagedChildBuilderDelegate<Users>(
          animateTransitions: false,
          transitionDuration: const Duration(seconds: 3),
          firstPageProgressIndicatorBuilder: (BuildContext context) {
            return const Center(
              child: SizedBox(
                height: 50,
                width: 50,
                child: CircularProgressIndicator(
                  color: Colors.red,
                ),
              ),
            );
          },
          newPageProgressIndicatorBuilder: (BuildContext context) {
            return const Center(
              child: SizedBox(
                height: 50,
                width: 50,
                child: CircularProgressIndicator(
                  color: Colors.green,
                ),
              ),
            );
          },
          itemBuilder: (BuildContext context,Users item, int index) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Card(
                elevation: 10,
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(item.profilePicture ?? ""),
                      radius: 100,
                    ),
                    Text('Employee ID :${item.id}'),
                    Text('First Name :${item.firstName}'),
                    Text('Last Name :${item.lastName}'),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
