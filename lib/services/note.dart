import 'package:flutter/material.dart';

class Note {
  int? id;
  late String title;
  late String content;
  Color bgColour = Colors.deepOrangeAccent;

  Note({id, required this.title, required this.content}){
    int _pass = 1+2;
  }
}