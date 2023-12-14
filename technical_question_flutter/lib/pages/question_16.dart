import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import '../widget/reuse_widget.dart';

class Question16 extends StatefulWidget {
  const Question16({super.key});

  @override
  State<Question16> createState() => _Question16State();
}

class _Question16State extends State<Question16> {
  final generateWidget = GenerateWidget();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Question 16'),
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
                <h3>  Write an algorithm to find the contiguous subarray within an array that has the largest sum</h3>
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