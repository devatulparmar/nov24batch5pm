import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:nov24batch5pm/services/notification_service.dart';
import 'package:nov24batch5pm/services/push_notification_service.dart';
import 'package:nov24batch5pm/utils/constants.dart';
import 'package:nov24batch5pm/utils/route.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyCNL1m7LXmi06sKKMQAfER1KRIfauw3mtE",
      appId: "1:346307667712:android:3b0b630b3616e042cef5e5",
      messagingSenderId: "346307667712",
      projectId: "nov24batch5pm",
    ),
  );
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await NotificationService().init();
  await NotificationService().isAndroidPermissionGranted();
  await NotificationService().requestPermissions();
  await NotificationService().configureDidReceiveLocalNotificationSubject();
  await NotificationService().configureSelectNotificationSubject();
  await PushNotificationService().setupInteractedMessage();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'main',
      debugShowCheckedModeBanner: false,
      navigatorKey: mainKey,
      theme: ThemeData(
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.red,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.green,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      onGenerateRoute: MyAppRoute.onGenerateRoute,
      // routes: {
      //   "/": (BuildContext context) => const Screen1(),
      //   "screen2": (BuildContext context) => Screen2(age: ,myStringValue: ,),
      //   "screen3": (BuildContext context) => const Screen3(),
      // },
    );
  }
}
