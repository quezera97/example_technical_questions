import 'package:flutter/material.dart';

import 'pages/question_1.dart';
import 'pages/question_2.dart';
import 'pages/question_3.dart';
import 'pages/question_4.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  Widget createSimpleButton(String textButton, VoidCallback routeCallback) {
    return ElevatedButton(
      onPressed: routeCallback,
      child: Text(textButton));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: Center(
        child: Column(
          children: [
            createSimpleButton('Question 1', () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Question1()),
              );
            }),
            createSimpleButton('Question 2', () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Question2()),
              );
            }),
            createSimpleButton('Question 3', () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Question3()),
              );
            }),
            createSimpleButton('Question 4', () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Question4()),
              );
            }),
            createSimpleButton('Question 5', () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Question4()),
              );
            }),
          ]
        ),
      ),
    );
  }
}