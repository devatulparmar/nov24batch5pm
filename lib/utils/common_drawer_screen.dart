import 'package:flutter/material.dart';
import 'package:nov24batch5pm/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CommonDrawerScreen extends StatefulWidget {
  const CommonDrawerScreen({super.key});

  @override
  State<CommonDrawerScreen> createState() => _CommonDrawerScreenState();
}

class _CommonDrawerScreenState extends State<CommonDrawerScreen> {
  bool isLogin = false;
  late SharedPreferences _preferences;

  void _initSharedPreferences() async {
    _preferences = await SharedPreferences.getInstance();
    isLogin = _preferences.getBool(prefIsLogin) ?? false;
    setState(() {});
  }

  void _logOut() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Are you sure want to logout?"),
          actions: [
            TextButton(
              onPressed: () {
                _preferences.setBool(prefIsLogin, false);
                Navigator.pushNamedAndRemoveUntil(
                    context, "/", (Route r) => false);
              },
              child: const Text('Yes'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _initSharedPreferences();
  }

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
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage(img1),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("User"),
                    Text("Edit Profile"),
                  ],
                ),
              ],
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
              if (isLogin)
                ElevatedButton(
                  onPressed: _logOut,
                  child: const Text('Logout'),
                )
              else
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, routeLoginScreen);
                  },
                  child: const Text('Login'),
                ),
              ElevatedButton(
                onPressed: () {
                  _preferences.clear();

                  Navigator.pushNamedAndRemoveUntil(
                      context, "/", (Route r) => false);
                },
                child: const Text('Clear All Preferences'),
              ),
              ElevatedButton(
                onPressed: () {
                  _preferences.remove(prefEducation);
                  if(_preferences.containsKey(prefEducation)){
                    print(_preferences.get(prefEducation));
                  } else {
                    print('Not Found');
                  }

                  Navigator.pushNamedAndRemoveUntil(
                      context, "/", (Route r) => false);
                },
                child: const Text('Clear User Education'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
