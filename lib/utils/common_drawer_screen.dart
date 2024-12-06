
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
      // width: ,
      shadowColor: Colors.black,
      elevation: 50,
      // shape:const RoundedRectangleBorder(
      //   borderRadius: BorderRadius.only(
      //     topRight: Radius.circular(100),
      //     bottomRight: Radius.circular(100),
      //   ),
      // ),
      // semanticLabel: "Label",
      // surfaceTintColor: Colors.red,
      // clipBehavior: Clip.hardEdge,
      child: Column(
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
          Flexible(
            flex: 1,
            child: ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 20),
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, routeStatefulLifeCycleScreen);

                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (BuildContext context) => const StatefulLifecycleScreen(),
                    //   ),
                    // );
                  },
                  child: const Text('Stateful Lifecycle Screen'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => const HomeScreen(),
                      ),
                    );
                  },
                  child: const Text('Home Screen'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                        const GridviewExtentScreen(),
                      ),
                    );
                  },
                  child: const Text('Gridview Extent Screen'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                        const GridviewBuilderScreen(),
                      ),
                    );
                  },
                  child: const Text('Gridview Builder Screen'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                        const GridviewCountScreen(),
                      ),
                    );
                  },
                  child: const Text('Gridview Count Screen'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => const GridviewScreen(),
                      ),
                    );
                  },
                  child: const Text('Gridview Screen'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => const ListGenerateScreen(),
                      ),
                    );
                  },
                  child: const Text('List Generate Screen'),
                ),
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
                        builder: (BuildContext context) =>
                        const ListSeparatedScreen(),
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
                        builder: (BuildContext context) =>
                        const ExpandedFlexibleScreen(),
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
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, routeStatefulLifeCycleScreen);

                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (BuildContext context) => const StatefulLifecycleScreen(),
                    //   ),
                    // );
                  },
                  child: const Text('Stateful Lifecycle Screen'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                        const GridviewExtentScreen(),
                      ),
                    );
                  },
                  child: const Text('Gridview Extent Screen'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                        const GridviewBuilderScreen(),
                      ),
                    );
                  },
                  child: const Text('Gridview Builder Screen'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                        const GridviewCountScreen(),
                      ),
                    );
                  },
                  child: const Text('Gridview Count Screen'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => const GridviewScreen(),
                      ),
                    );
                  },
                  child: const Text('Gridview Screen'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => const ListGenerateScreen(),
                      ),
                    );
                  },
                  child: const Text('List Generate Screen'),
                ),
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
                        builder: (BuildContext context) =>
                        const ListSeparatedScreen(),
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
                        builder: (BuildContext context) =>
                        const ExpandedFlexibleScreen(),
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
          ),
        ],
      ),
    );
  }
}
