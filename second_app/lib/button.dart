import 'package:flutter/material.dart';

class Button {
  final int id;
  String text;
  Color bg;
  bool marked;

  Button(
      {this.id,
      this.text = '',
      this.bg = Colors.deepOrange,
      this.marked = false});
}
