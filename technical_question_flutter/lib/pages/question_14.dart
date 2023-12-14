import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import '../widget/reuse_widget.dart';

class Question14 extends StatefulWidget {
  const Question14({super.key});

  @override
  State<Question14> createState() => _Question14State();
}

class _Question14State extends State<Question14> {
  final generateWidget = GenerateWidget();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Question 14'),
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
                <h3> Design an algorithm to partition a string into as many palindromes as possible. For instance, "abbac" can be split into ["a", "b", "bab", "c"]</h3>
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