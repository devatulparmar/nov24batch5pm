import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nov24batch5pm/utils/constants.dart';

class DialogScreen extends StatefulWidget {
  const DialogScreen({super.key});

  @override
  State<DialogScreen> createState() => _DialogScreenState();
}

class _DialogScreenState extends State<DialogScreen> {
  void _displayDialog() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const Dialog(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Text('Hello'),
          ),
        );
      },
    );
  }

  void _displayAlertDialog() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          scrollable: true,
          title: const Text('This is title'),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image(
                image: AssetImage(img1),
              ),
              Text('This is Content of Alert Dialog'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                //
              },
              child: const Text("Ok"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancel"),
            ),
          ],
        );
      },
    );
  }

  void _displayAboutDialog() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const AboutDialog(
          applicationIcon: CircleAvatar(
            backgroundImage: AssetImage(img1),
          ),
          applicationName: "November 2024, Batch 5 PM",
          applicationVersion: "1.0.0",
          applicationLegalese: "This is application Legalese",
          children: [
            Image(
              image: AssetImage(img1),
            ),
            Text('This is Content of About Dialog'),
          ],
        );
      },
    );
  }

  void _displayCupertinoDialog() async {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoDialogAction(
          child: const Text('Hello'),
          onPressed: () {},
        );
      },
    );
  }

  void _displayCupertinoAlertDialog() async {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: const Text('this is title'),
          content: const Text('This is content.'),
          actions: [
            TextButton(
              onPressed: () {},
              child: const Text('Ok'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void _displayBottomSheet() async {
    showModalBottomSheet(
      context: context,
      isDismissible: false,
      showDragHandle: true,
      enableDrag: true,
      builder: (BuildContext context) {
        return const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Text('Hello'),
                ],
              ),
              Row(
                children: [
                  Text('Hello'),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  void _displayCupertinoBottomSheet() async {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          title: const Text('Hello'),
          message: const Column(
            children: [
              Image(
                image: AssetImage(img1),
              ),
              Text('This is Content of Alert Dialog'),
            ],
          ),
          cancelButton: TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Cancel"),
          ),
          // actions: [
          //   TextButton(
          //     onPressed: () {
          //       //
          //     },
          //     child: const Text("Ok"),
          //   ),
          //   TextButton(
          //     onPressed: () {
          //       //
          //     },
          //     child: const Text("View"),
          //   ),
          // ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dialog Screen'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: _displayDialog,
            child: const Text('Open Dialog'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _displayAlertDialog,
            child: const Text('Open Alert Dialog'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _displayAboutDialog,
            child: const Text('Open About Dialog'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _displayCupertinoDialog,
            child: const Text('Open Cupertino Dialog'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _displayCupertinoAlertDialog,
            child: const Text('Open Cupertino Dialog'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _displayBottomSheet,
            child: const Text('Open Bottom sheet'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _displayCupertinoBottomSheet,
            child: const Text('Open Cupertino Bottom sheet'),
          ),
        ],
      ),
    );
  }
}
