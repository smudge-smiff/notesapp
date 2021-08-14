import 'package:flutter/material.dart';
import 'pages/home.dart';

void main() {
  runApp(MaterialApp(
    title: 'Notes App',
    initialRoute: '/home',
    routes: {
      '/home': (context) => Home(),
    },
    theme: ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.lightBlue[600],
      accentColor: Colors.cyan[600],
    ),
  ));
}

