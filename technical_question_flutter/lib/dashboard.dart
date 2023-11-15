import 'package:flutter/material.dart';

import 'pages/question_1.dart';
import 'pages/question_2.dart';
import 'pages/question_3.dart';
import 'pages/question_4.dart';
import 'widget/reuse_widget.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final generateWidget = GenerateWidget();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: Center(
        child: Column(children: [
          generateWidget.createSimpleButton('Question 1', () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Question1()),
            );
          }),
          //longest word dalam question 2 x buat lagi
          generateWidget.createSimpleButton('Question 2', () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Question2()),
            );
          }),
          generateWidget.createSimpleButton('Question 3', () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Question3()),
            );
          }),
          generateWidget.createSimpleButton('Question 4', () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Question4()),
            );
          }),
          generateWidget.createSimpleButton('Question 5', () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Question4()),
            );
          }),
        ]),
      ),
    );
  }
}
