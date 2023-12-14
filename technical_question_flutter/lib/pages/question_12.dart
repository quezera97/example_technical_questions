import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import '../widget/reuse_widget.dart';

class Question12 extends StatefulWidget {
  const Question12({super.key});

  @override
  State<Question12> createState() => _Question12State();
}

class _Question12State extends State<Question12> {
  final generateWidget = GenerateWidget();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Question 12'),
        backgroundColor: generateWidget.excludeWhiteColor(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(15),
                child: HtmlWidget(
                  '''
                <h3>Design a function that validates whether a given string is a valid email address or not based on certain criteria</h3>
                ''',
                ),
              ),
              const SizedBox(height: 10),
            ]
          ),
        ),
      ),
    );
  }
}