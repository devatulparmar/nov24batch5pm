import 'package:flutter/material.dart';
import 'package:nov24batch5pm/count_screen.dart';
import 'package:nov24batch5pm/expanded_flexible_screen.dart';
import 'package:nov24batch5pm/gridview_builder_screen.dart';
import 'package:nov24batch5pm/gridview_count_screen.dart';
import 'package:nov24batch5pm/gridview_extent_screen.dart';
import 'package:nov24batch5pm/gridview_screen.dart';
import 'package:nov24batch5pm/home_screen.dart';
import 'package:nov24batch5pm/image_screen.dart';
import 'package:nov24batch5pm/list_binding_screen.dart';
import 'package:nov24batch5pm/list_build_screen.dart';
import 'package:nov24batch5pm/list_generate_screen.dart';
import 'package:nov24batch5pm/list_screen.dart';
import 'package:nov24batch5pm/list_separated_screen.dart';
import 'package:nov24batch5pm/list_separated_screen.dart';
import 'package:nov24batch5pm/nested_list_screen.dart';
import 'package:nov24batch5pm/utils/constants.dart';

class CommonDrawerScreen extends StatefulWidget {
  const CommonDrawerScreen({super.key});

  @override
  State<CommonDrawerScreen> createState() => _CommonDrawerScreenState();
}

class _CommonDrawerScreenState extends State<CommonDrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.blue,
      shadowColor: Colors.black,
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          const DrawerHeader(
            margin: EdgeInsets.zero,
            curve: Curves.fastOutSlowIn,
            duration: Duration(seconds: 5),
            decoration: BoxDecoration(color: Colors.blue),
            // padding: EdgeInsets.zero,
            child: CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage(img1),
            ),
          ),
          ListView(
            shrinkWrap: true,
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.all(5),
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, routeLoginScreen);
                },
                child: const Text('Partner Preference'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, routeLoginScreen);
                },
                child: const Text('Account Settings'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, routeLoginScreen);
                },
                child: const Text('Help & Support'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, routeLoginScreen);
                },
                child: const Text('Login'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
