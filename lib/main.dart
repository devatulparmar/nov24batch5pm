import 'package:flutter/material.dart';
import 'package:nov24batch5pm/services/firebase_services.dart';
import 'package:nov24batch5pm/services/notification_service.dart';
import 'package:nov24batch5pm/services/push_notification_service.dart';
import 'package:nov24batch5pm/utils/constants.dart';
import 'package:nov24batch5pm/utils/route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PushNotificationService().onFMBackgroundMessage();
  await MyFirebaseServices().initializeDefault();
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
