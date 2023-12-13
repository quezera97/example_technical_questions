// String Manipulation: Create a function that takes in a string and returns the reverse of that string
import 'package:flutter/material.dart';

import '../widget/reuse_widget.dart';

class Question10 extends StatefulWidget {
  const Question10({super.key});

  @override
  State<Question10> createState() => _Question10State();
}

class _Question10State extends State<Question10> {
  final generateWidget = GenerateWidget();
  
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: const Text('Question 10'),
        backgroundColor: generateWidget.excludeWhiteColor(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.5),
          child: Column(
            children: [
            ]
          ),
        ),
      ),
     );
  }
}