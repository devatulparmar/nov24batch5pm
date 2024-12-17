import 'package:flutter/material.dart';
import 'package:nov24batch5pm/dialog_screen.dart';
import 'package:nov24batch5pm/gridview_screen.dart';
import 'package:nov24batch5pm/list_screen.dart';
import 'package:nov24batch5pm/login_screen.dart';
import 'package:nov24batch5pm/register_screen.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final List<Widget> _tabViewWidgetsList = [
    const DialogScreen(),
    const GridviewScreen(),
    const LoginScreen(),
    const RegisterScreen(),
    const ListScreen(),
  ];

  final List<Widget> _tabsList = [
    const Tab(icon: Icon(Icons.home)),
    const Tab(icon: Icon(Icons.search)),
    const Tab(icon: Icon(Icons.person)),
    const Tab(icon: Icon(Icons.notifications)),
    const Tab(icon: Icon(Icons.add)),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabViewWidgetsList.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Tab Screen'),
          bottom: TabBar(
            isScrollable: false,
            tabs: _tabsList,
          ),
        ),
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          children: _tabViewWidgetsList,
        ),
      ),
    );
  }
}
