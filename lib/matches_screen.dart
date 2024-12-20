import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nov24batch5pm/utils/common_drawer_screen.dart';
import 'package:nov24batch5pm/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MatchesScreen extends StatefulWidget {
  const MatchesScreen({super.key});

  @override
  State<MatchesScreen> createState() => _MatchesScreenState();
}

class _MatchesScreenState extends State<MatchesScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String userName = '';
  int userAge = 0;
  double userHeight = 0.0;
  List<String> userEducation = [];

  late SharedPreferences _preferences;

  void _initSharedPreferences() async {
    _preferences = await SharedPreferences.getInstance();
    userName = _preferences.getString(prefName) ?? "";
    userAge = _preferences.getInt(prefAge) ?? 0;
    userHeight = _preferences.getDouble(prefHeight) ?? 0.0;
    List<String> tempList = _preferences.getStringList(prefEducation) ?? [];
    if (tempList.isNotEmpty) {
      userEducation.addAll(tempList);
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _initSharedPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(5),
          child: Stack(
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage(img1),
              ),
              Positioned(
                bottom: 2,
                right: 0,
                child: SizedBox(
                  height: 25,
                  width: 25,
                  child: FloatingActionButton(
                    elevation: 0,
                    backgroundColor: Colors.white,
                    onPressed: () {
                      _scaffoldKey.currentState!.openDrawer();
                    },
                    child: const Icon(
                      Icons.menu,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        title: const Text('Matches'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.person,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
            ),
          ),
        ],
      ),
      drawer: const CommonDrawerScreen(),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(35),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: const Icon(Icons.filter_list),
              ),
              const SizedBox(width: 10),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(35),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: const Text('Verified'),
              ),
              const SizedBox(width: 10),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(35),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: const Text('Just Joined'),
              ),
              const SizedBox(width: 10),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(35),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: const Text('NearBy'),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            child: Stack(
              children: [
                Image(
                  image: const AssetImage(img1),
                  height: MediaQuery.of(context).size.height - 300,
                  fit: BoxFit.fitHeight,
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    padding: const EdgeInsets.only(top: 10),
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black54,
                            blurRadius: 10,
                            offset: Offset(0, 5))
                      ],
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                userName,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              const SizedBox(width: 5),
                              const Icon(
                                IconData(
                                  0xe699,
                                  fontFamily: 'MaterialIcons',
                                ),
                                color: Colors.blue,
                                size: 25,
                              ),
                            ],
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Last Seen on 25 Nov 24',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '$userAge years $userHeight',
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  const Text(
                                    'Caste',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  const Text(
                                    'Gujarati',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  const Text(
                                    'Ahmedabad',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Software Developer',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  const Text(
                                    'Rs. 7.5 - 10 Lakh',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Row(
                                    children: List.generate(
                                      userEducation.length,
                                      (int index) => Padding(
                                        padding: const EdgeInsets.only(right: 3),
                                        child: Text(
                                          userEducation[index].toString(),
                                          style: const TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    'Never Married',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
