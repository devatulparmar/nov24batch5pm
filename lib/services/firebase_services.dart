import 'package:firebase_core/firebase_core.dart';

class MyFirebaseServices {
  Future<void> initializeDefault() async {
    FirebaseApp app = await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyBDrxFpkDrwvEgYcKBHAqD1Itxt8H1DN8M",
        appId: "1:346307667712:android:6ec57437ce921267cef5e5",
        messagingSenderId: "",
        projectId: "nov24batch5pm",
      ),
    );
    print('Initialized default app $app');
  }
}
