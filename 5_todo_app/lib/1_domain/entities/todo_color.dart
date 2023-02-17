import 'package:flutter/material.dart';

class ToDoColor {
  final int colorIndex;

  static const List<Color> predefinedColors = [
    Color(0xffD62006),
    Color(0xff3BC1EC),
    Color(0xffF5C412),
    Color(0xff1246F5),
    Color(0xff6CB705),
    Color(0xff9A54E6),
  ];

  Color get color => predefinedColors[colorIndex];

  ToDoColor({required this.colorIndex});
}
