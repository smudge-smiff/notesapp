import 'package:flutter/material.dart';

class Note {
  late int id;
  late String title;
  late String content;
  Color bgColour = Colors.deepOrangeAccent;

  Note({required this.id, required this.title, required this.content}){
    int _pass = 1+2;
  }
}