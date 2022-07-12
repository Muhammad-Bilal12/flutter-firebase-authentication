import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_signin_form/screens/home.dart';
import 'package:flutter_signin_form/screens/login_sc.dart';
import 'package:flutter_signin_form/screens/register.dart';

import 'firebase/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text(
                "something Went Wrong",
                textDirection: TextDirection.ltr,
              ),
            );
          }

          if (snapshot.connectionState == ConnectionState.done) {
            return MaterialApp(
              title: 'Flutter Demo',
              home: Home(),
              routes: {
                "/login": (context) => LoginScreen(),
                "/register": (context) => Register(),
                "/home": (context) => Home(),
              },
            );
          }

          return const Center(
            child: SizedBox(
              width: 200,
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}
