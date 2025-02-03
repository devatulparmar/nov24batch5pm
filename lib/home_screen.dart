import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:nov24batch5pm/count_screen.dart';
import 'package:nov24batch5pm/expanded_flexible_screen.dart';
import 'package:nov24batch5pm/gridview_builder_screen.dart';
import 'package:nov24batch5pm/gridview_count_screen.dart';
import 'package:nov24batch5pm/gridview_extent_screen.dart';
import 'package:nov24batch5pm/gridview_screen.dart';
import 'package:nov24batch5pm/image_screen.dart';
import 'package:nov24batch5pm/list_binding_screen.dart';
import 'package:nov24batch5pm/list_build_screen.dart';
import 'package:nov24batch5pm/list_generate_screen.dart';
import 'package:nov24batch5pm/list_screen.dart';
import 'package:nov24batch5pm/list_separated_screen.dart';
import 'package:nov24batch5pm/nested_list_screen.dart';
import 'package:nov24batch5pm/stateful_lifecycle_screen.dart';
import 'package:nov24batch5pm/utils/common_drawer_screen.dart';
import 'package:nov24batch5pm/utils/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> imageList = [
    "https://images.unsplash.com/photo-1579353977828-2a4eab540b9a?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://images.all-free-download.com/images/graphicwebp/red_rose_close_up_566165.webp",
    "https://images.unsplash.com/photo-1579353977828-2a4eab540b9a?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/photo-1579353977828-2a4eab540b9a?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/photo-1579353977828-2a4eab540b9a?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      drawer: const CommonDrawerScreen(),
      endDrawer: const CommonDrawerScreen(),
      body: ListView(
        children: [
          CarouselSlider(
            items: imageList.map((itemUrl) {
              return GestureDetector(
                onTap: (){
                  print(itemUrl);
                },
                child: Image(
                  image: NetworkImage(itemUrl),
                  fit: BoxFit.cover,
                ),
              );
            }).toList(),
            options: CarouselOptions(
              // height: 300,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 2),
              autoPlayAnimationDuration: const Duration(milliseconds: 2500),
              aspectRatio: 1.5,
              viewportFraction: 0.90,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlayCurve: Curves.slowMiddle,
              enlargeCenterPage: true,
              enlargeFactor: 1,
              scrollDirection: Axis.vertical,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, routeGoogleMapsScreen);
            },
            child: const Text('Google Maps Screen'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, routeStreamListScreen);
            },
            child: const Text('Stream List Screen'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, routeStreamScreen);
            },
            child: const Text('Stream Screen'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, routeTabScreen);
            },
            child: const Text('Tab Screen'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, routeDialogScreen);
            },
            child: const Text('Dialog Screen'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, routeRegisterScreen);
            },
            child: const Text('Register Screen'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, routeLoginScreen2);
            },
            child: const Text('Login Screen 2'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, routeLoginScreen);
            },
            child: const Text('Login Screen'),
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
    );
  }
}
