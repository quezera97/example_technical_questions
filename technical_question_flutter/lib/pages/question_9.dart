// String Manipulation: Create a function that takes in a string and returns the reverse of that string
import 'package:flutter/material.dart';

import '../widget/reuse_widget.dart';

class Question9 extends StatefulWidget {
  const Question9({super.key});

  @override
  State<Question9> createState() => _Question9State();
}

class _Question9State extends State<Question9> {
  final generateWidget = GenerateWidget();
  
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: const Text('Question 9'),
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