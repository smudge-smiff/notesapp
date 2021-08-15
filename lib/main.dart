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
      primaryColor: Color(0xff1976D2),//Colors.lightBlue[900],
      accentColor: Color(0xFF03A9F4),//Colors.cyan[600],
    ),
  ));
}
