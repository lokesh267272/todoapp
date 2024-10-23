import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDQ278SaJiCS6hf_-uC4rFCUaQztNKvMIM",
            authDomain: "todo-hkdw1k.firebaseapp.com",
            projectId: "todo-hkdw1k",
            storageBucket: "todo-hkdw1k.appspot.com",
            messagingSenderId: "134677985050",
            appId: "1:134677985050:web:9d4b210398becb0de15ea3"));
  } else {
    await Firebase.initializeApp();
  }
}
