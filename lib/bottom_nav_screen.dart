import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nov24batch5pm/gridview_screen.dart';
import 'package:nov24batch5pm/login_screen.dart';
import 'package:nov24batch5pm/matches_screen.dart';
import 'package:nov24batch5pm/nested_nav_screen.dart';
import 'package:nov24batch5pm/register_screen.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int selectedIndex = 0;

  Future<bool?> _showBackDialog() {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Are you sure?'),
          content: const Text(
            'Are you sure you want to leave this app?',
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Never mind'),
              onPressed: () {
                Navigator.pop(context, false);
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Leave'),
              onPressed: () {
                Navigator.pop(context, true);
              },
            ),
          ],
        );
      },
    );
  }

  final List _widgetsList = [
    const NestedNavScreen(),
    const MatchesScreen(),
    const GridviewScreen(),
    const LoginScreen(),
    const RegisterScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, Object? result) async {
        if (didPop) {
          return;
        }
        final bool shouldPop = await _showBackDialog() ?? false;
        if (shouldPop) {
          exit(0);
        }
      },
      child: Scaffold(
        body: _widgetsList[selectedIndex],
        bottomNavigationBar: NavigationBar(
          selectedIndex: selectedIndex,
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          indicatorColor: Colors.transparent,
          onDestinationSelected: (index) {
            selectedIndex = index;
            setState(() {});
          },
          destinations: const [
            NavigationDestination(
              icon: FaIcon(FontAwesomeIcons.heart),
              selectedIcon: FaIcon(
                FontAwesomeIcons.solidHeart,
                color: Colors.red,
              ),
              tooltip: 'Matches',
              label: 'Matches',
            ),
            NavigationDestination(
              icon: FaIcon(FontAwesomeIcons.clock),
              selectedIcon: FaIcon(
                FontAwesomeIcons.clock,
                color: Colors.red,
              ),
              label: 'Activity',
            ),
            NavigationDestination(
              icon: Icon(
                Icons.search,
                size: 30,
              ),
              selectedIcon: Icon(
                Icons.search,
                size: 30,
                color: Colors.red,
              ),
              label: 'Search',
            ),
            NavigationDestination(
              icon: Icon(Icons.message),
              selectedIcon: Icon(
                Icons.message,
                color: Colors.red,
              ),
              label: 'Messages',
            ),
            NavigationDestination(
              icon: FaIcon(FontAwesomeIcons.crown),
              selectedIcon: FaIcon(
                FontAwesomeIcons.crown,
                color: Colors.red,
              ),
              label: 'Upgrades',
            ),
          ],
        ),
      ),
    );
  }
}
