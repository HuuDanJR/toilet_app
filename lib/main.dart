import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:toilet_app/api/firebase_api_service.dart';
import 'package:toilet_app/example.dart';
import 'package:toilet_app/home.dart';
import 'package:toilet_app/page_error.dart';
import 'package:toilet_app/utils/mystring.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeFirebase();
  runApp(const MyApp());
}

Future<void> initializeFirebase() async {
  await Firebase.initializeApp(
    name: MyString.FIREBASE_APP_NAME,
    options: const FirebaseOptions(
      apiKey: MyString.FIREBASE_apiKey,
      appId: MyString.FIREBASE_appId,
      messagingSenderId: MyString.FIREBASE_messagingSenderId,
      projectId: MyString.FIREBASE_projectId,
    ),
  );

  final DatabaseReference _databaseRef = FirebaseDatabase(
    app: Firebase.app(MyString.FIREBASE_APP_NAME),
    databaseURL: MyString.FIREBASE_url,
  ).reference().child('roomMen');

  _databaseRef.once().then((DatabaseEvent db) {
    // print('printing data ....');
    final model = db.snapshot.value as Map<dynamic, dynamic>;
    model.forEach((key, value) {
      // print('$key: $value');
    });
  });
  _databaseRef.onValue.listen((DatabaseEvent event) {
    // print('printing data [LISTEN] ....');
    final model = event.snapshot.value as Map<dynamic, dynamic>;
    model.forEach((key, value) {
      // print('$key: $value');
    });
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire
      future: initializeFirebase(),
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return const PageError();
        }
        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'WC SOFTWARE',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              home: const HomePage());
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
