import 'package:flutter/material.dart';

class GenerateShape {
  Widget generateRectangleSquare(int height, int length) {
    List<Widget> rows = [];

    //this will loop height from given (start at first line (in row))
    for (int i = 0; i < height; i++) {
      List<Widget> rowChildren = [];
      
      //then it will loop through until the end of length (in column)
      for (int j = 0; j < length; j++) {
        rowChildren.add(const Icon(Icons.star, color: Colors.redAccent));
      }
      rows.add(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: rowChildren,
      ));
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: rows,
    );
  }

  Widget generateTriangle(int height) {
    List<Widget> rows = [];

    for (int i = 0; i < height; i++) {
      List<Widget> rowChildren = [];

      for (int j = 0; j <= i; j++) {
        rowChildren.add(const Icon(Icons.star, color: Colors.redAccent));
      }
      rows.add(Row(
        children: rowChildren,
      ));
    }

    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.end,
      children: rows,
    );
  }

  Widget generateDiamond(int height) {
    List<Widget> rows = [];

    //the upper part is the same as triangle
    for (int i = 0; i < height; i++) {
      List<Widget> rowChildren = [];

      for (int j = 0; j < i; j++) {
        rowChildren.add(const Icon(Icons.star, color: Colors.redAccent));
      }
      rows.add(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: rowChildren,
      ));
    }

    //but this is the inverse part, start from max (height) until 1
    for (int i = height; i > 0; i--) {
      List<Widget> rowChildren = [];

      for (int j = 0; j < i; j++) {
        rowChildren.add(const Icon(Icons.star, color: Colors.redAccent));
      }
      rows.add(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: rowChildren,
      ));
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: rows,
    );
  }
}