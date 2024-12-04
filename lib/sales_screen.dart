import 'package:flutter/material.dart';
import 'package:nov24batch5pm/utils/constants.dart';

class SalesScreen extends StatefulWidget {
  const SalesScreen({super.key});

  @override
  State<SalesScreen> createState() => _SalesScreenState();
}

class _SalesScreenState extends State<SalesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade700,
        title: const Text('Sales'),
        leading: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        centerTitle: true,
        actions: const [
          Icon(
            Icons.calendar_month,
            color: Colors.white,
          ),
          SizedBox(width: 10),
        ],
      ),
      body: ListView(
        physics: const ScrollPhysics(),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            decoration: BoxDecoration(
              color: Colors.blue.shade900,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(15),
                topLeft: Radius.circular(15),
              ),
            ),
            child: const Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(''),
                    Text(
                      'Today',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      'Previous',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(''),
                    Text(
                      '05/12/2023',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      '28/11/2023',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Lang',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      'Orders',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      'Sales',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      'Orders',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      'Sales',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            decoration:
                BoxDecoration(border: Border.all(color: Colors.black45)),
            child: ListView.separated(
              itemCount: 5,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (BuildContext context, int index) {
                return Container(
                  color: Colors.black45,
                  height: 1,
                );
              },
              itemBuilder: (BuildContext context, int index) {
                return const Padding(
                  padding: EdgeInsets.all(5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 15,
                            backgroundImage: AssetImage(img1),
                          ),
                          SizedBox(width: 5),
                          Text('IN'),
                        ],
                      ),
                      SizedBox(width: 1),
                      Text('21'),
                      SizedBox(width: 10),
                      Text('2.84k'),
                      SizedBox(width: 15),
                      Text('21'),
                      SizedBox(width: 20),
                      Text('2.84k'),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            decoration:
                BoxDecoration(border: Border.all(color: Colors.black45)),
            padding: const EdgeInsets.all(5),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total'),
                Text('21'),
                Text('2.84k'),
                Text('21'),
                Text('2.84k'),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.blue.shade100,
                  padding: const EdgeInsets.all(5),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Monthly Target'),
                      Text('2.53M'),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.yellow.shade100,
                  padding: const EdgeInsets.all(5),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Yearly Target'),
                      Text('31.16M'),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.blue.shade100,
                  padding: const EdgeInsets.all(5),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Monthly Projection'),
                      Text('2.3M'),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.yellow.shade100,
                  padding: const EdgeInsets.all(5),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Yearly Projection'),
                      Text('20.76M'),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.blue.shade100,
                  padding: const EdgeInsets.all(5),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('MTD Sales'),
                      Text('370.79k'),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.yellow.shade100,
                  padding: const EdgeInsets.all(5),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('YTD Sales'),
                      Text('8.99M'),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.blue.shade100,
                  padding: const EdgeInsets.all(5),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('MTD Orders'),
                      Text('3827'),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.yellow.shade100,
                  padding: const EdgeInsets.all(5),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('YTD Orders'),
                      Text('117396'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
