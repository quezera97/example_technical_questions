import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import '../../widget/reuse_widget.dart';

class Question15 extends StatefulWidget {
  const Question15({super.key});

  @override
  State<Question15> createState() => _Question15State();
}

class _Question15State extends State<Question15> {
  final generateWidget = GenerateWidget();  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(        
        title: const Text('Question 15'),
        backgroundColor: generateWidget.excludeWhiteColor(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Padding(
                padding: EdgeInsets.all(15),
                child: HtmlWidget(
                  '''
                  
                ''',
                ),
              ),
              SizedBox(height: 10),
            ]
          ),
        ),
      ),
    );
  }
}




