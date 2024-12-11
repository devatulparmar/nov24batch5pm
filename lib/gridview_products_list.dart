import 'package:flutter/material.dart';
import 'package:nov24batch5pm/utils/constants.dart';

class GridviewProductsList extends StatefulWidget {
  const GridviewProductsList({super.key});

  @override
  State<GridviewProductsList> createState() => _GridviewProductsListState();
}

class _GridviewProductsListState extends State<GridviewProductsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: GridView.builder(
        padding:const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.65,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              const Image(
                image: NetworkImage(imgNetwork),
              ),
              const Padding(
                padding: EdgeInsets.all(5),
                child: Row(
                  children: [
                    Text('Title'),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(5),
                child: Row(
                  children: [
                    Text('SubTitle'),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('View Details'),
              ),
            ],
          );
        },
      ),
    );
  }
}
