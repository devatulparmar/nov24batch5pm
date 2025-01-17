import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nov24batch5pm/services/notification_service.dart';
import 'package:nov24batch5pm/services/push_notification_service.dart';
import 'package:nov24batch5pm/utils/constants.dart';
import 'package:nov24batch5pm/utils/route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyBDrxFpkDrwvEgYcKBHAqD1Itxt8H1DN8M",
      appId: "1:346307667712:android:6ec57437ce921267cef5e5",
      messagingSenderId: "",
      projectId: "nov24batch5pm",
      storageBucket: "nov24batch5pm.firebasestorage.app",
    ),
  );
  await NotificationService().init();
  if (Platform.isAndroid) {
    await NotificationService().isAndroidPermissionGranted();
  }
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
