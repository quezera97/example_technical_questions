import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import '../widget/reuse_widget.dart';

class Question13 extends StatefulWidget {
  const Question13({super.key});

  @override
  State<Question13> createState() => _Question13State();
}

class _Question13State extends State<Question13> {
  final generateWidget = GenerateWidget();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Question 13'),
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
                <h3>Develop an algorithm to check if two strings are anagrams of each other. Anagrams are words or phrases formed by rearranging the letters of another, such as "listen" and "silent"</h3>
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