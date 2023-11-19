import 'dart:math';

import 'package:flutter/material.dart';

Color getRandomColor() {
  Random random = Random();
  List<Color> colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.purple,
    Colors.teal,
    Colors.pink,
    Colors.cyan,
    Colors.deepPurple,
    Colors.amber,
    Colors.indigo,
    Colors.lightBlue,
    Colors.deepOrange,
    Colors.brown,
    Colors.grey,
    Colors.tealAccent,
    Colors.blueGrey,
    Colors.orangeAccent,
    Colors.deepPurpleAccent,
    Colors.cyanAccent,
    Colors.indigoAccent,
    Colors.lightBlueAccent,
    Colors.deepOrangeAccent,
    Colors.pinkAccent,
    Colors.purpleAccent,
    Colors.redAccent,
    Colors.brown,
    Colors.grey,
    Colors.black,
  ];

  int index = random.nextInt(colors.length - 1);
  return colors[index];
}
