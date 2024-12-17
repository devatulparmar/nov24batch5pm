import 'package:flutter/material.dart';
import 'package:nov24batch5pm/gridview_screen.dart';
import 'package:nov24batch5pm/home_screen.dart';
import 'package:nov24batch5pm/list_screen.dart';
import 'package:nov24batch5pm/login_screen.dart';
import 'package:nov24batch5pm/nested_nav_screen.dart';
import 'package:nov24batch5pm/register_screen.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int selectedIndex = 0;

  final List _widgetsList = [
    const HomeScreen(),
    const GridviewScreen(),
    const LoginScreen(),
    const RegisterScreen(),
    const NestedNavScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:_widgetsList[selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        height: 45,
        animationDuration:const Duration(seconds: 5),
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        onDestinationSelected: (index) {
          selectedIndex = index;
          setState(() {});
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            tooltip: 'HOME',
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          NavigationDestination(
            icon: Icon(Icons.add),
            label: 'Add',
          ),
          NavigationDestination(
            icon: Icon(Icons.video_camera_back),
            label: 'Reels',
            enabled: false,
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
