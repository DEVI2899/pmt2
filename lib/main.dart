
import 'package:employee_details/Screens/profile_upload.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'Screens/Homepage.dart';
import 'csvfileupload.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
        home :const Homepage(),
        // home : const Logout(),
      // home: const image_upload(),
      // home : const csvfile(),
       // home: const profile_upload(),
        debugShowCheckedModeBanner: false,
    );
  }
}




