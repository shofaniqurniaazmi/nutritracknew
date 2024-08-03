import 'package:flutter/material.dart';
import 'package:nutritrack/attribute/blank.dart'; // Assuming Blank is a splash screen
import 'package:nutritrack/fitur/calendar.dart';
import 'package:nutritrack/fitur/home.dart';
import 'package:nutritrack/fitur/kamera.dart';
import 'package:nutritrack/fitur/profile.dart';
import 'package:nutritrack/fitur/archive.dart';
import 'package:nutritrack/attribute/bottom.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NutriTrack',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Blank(),
      routes: {
        '/home': (context) => HomePage(),
        '/calendar': (context) => Calendar(),
        '/kamera': (context) => Camera(),
        '/archive': (context) => Archive(),
        '/profile': (context) => Profile(),
      },
    );
  }
}
