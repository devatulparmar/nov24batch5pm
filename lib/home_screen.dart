import 'package:flutter/material.dart';
import 'package:nov24batch5pm/count_screen.dart';
import 'package:nov24batch5pm/expanded_flexible_screen.dart';
import 'package:nov24batch5pm/image_screen.dart';
import 'package:nov24batch5pm/list_binding_screen.dart';
import 'package:nov24batch5pm/list_build_screen.dart';
import 'package:nov24batch5pm/list_screen.dart';
import 'package:nov24batch5pm/list_separated_screen.dart';
import 'package:nov24batch5pm/nested_list_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: ListView(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const ListBindingScreen(),
                ),
              );
            },
            child: const Text('List Binding Screen'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const NestedListScreen(),
                ),
              );
            },
            child: const Text('Nested List Screen'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const ListSeparatedScreen(),
                ),
              );
            },
            child: const Text('List Separated Screen'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const ListBuildScreen(),
                ),
              );
            },
            child: const Text('List Build Screen'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const ListScreen(),
                ),
              );
            },
            child: const Text('List Screen'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const ImageScreen(),
                ),
              );
            },
            child: const Text('Image Screen'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const ExpandedFlexibleScreen(),
                ),
              );
            },
            child: const Text('Expanded Screen'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const CountScreen(),
                ),
              );
            },
            child: const Text('Count Screen'),
          ),
        ],
      ),
    );
  }
}
