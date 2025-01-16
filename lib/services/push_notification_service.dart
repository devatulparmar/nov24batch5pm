
import 'dart:async';
import 'dart:convert';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:nov24batch5pm/services/notification_service.dart';

class PushNotificationService {
  @pragma('vm:entry-point')
  Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyBDrxFpkDrwvEgYcKBHAqD1Itxt8H1DN8M",
        appId: "1:346307667712:android:6ec57437ce921267cef5e5",
        messagingSenderId: "",
        projectId: "nov24batch5pm",
      ),
    );
  }

  Future<void> onFMBackgroundMessage() async {
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  Future<void> setupInteractedMessage() async {

    final messagingInstance = FirebaseMessaging.instance;

    NotificationSettings settings = await messagingInstance.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      final token = await messagingInstance.getToken();
      debugPrint('FCM token :: $token');

      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        if (message.notification != null) {
          NotificationService().showNotifications(
            title: message.notification?.title,
            description: message.notification?.body,
            messageData: message.data,
          );
        }
      });

      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        selectNotificationStream.add(jsonEncode(message.data));
      });
    }
  }
}