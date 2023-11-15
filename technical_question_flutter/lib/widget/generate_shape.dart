import 'package:flutter/material.dart';

class GenerateShape {
  Widget generateRectangleSquare(int height, int length) {
    List<Widget> rows = [];

    for (int i = 0; i < height; i++) {
      List<Widget> rowChildren = [];
      
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: rowChildren,
      ));
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: rows,
    );
  }

  Widget generateDiamond(int height) {
    List<Widget> rows = [];

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