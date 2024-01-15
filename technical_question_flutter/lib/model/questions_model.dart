import 'package:flutter/material.dart';

class QuestionsModel {
  final String heading;
  final String subHeading;
  final Icon icon;
  final Color color;
  final VoidCallback onTap;

  QuestionsModel({
    required this.heading,
    required this.subHeading,
    required this.icon,
    required this.color,
    required this.onTap,
  });
}