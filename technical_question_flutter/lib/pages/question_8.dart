import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import '../widget/reuse_widget.dart';

class Question8 extends StatefulWidget {
  const Question8({super.key});

  @override
  State<Question8> createState() => _Question8State();
}

class _Question8State extends State<Question8> {
  final generateWidget = GenerateWidget();
  final textController = TextEditingController();
  var reversedString = '';

  void reverseString(String value) {
    reversedString = value.split('').reversed.join();

    setState(() {
      reversedString;
    });
  }
  
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: const Text('Question 8'),
        backgroundColor: generateWidget.excludeWhiteColor(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.5),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(15),
                child: HtmlWidget(
                  '''
                    <h3> Create a function that takes in a string and returns the reverse of that string </h3>
                  ''',
                ),
              ),
              const SizedBox(height: 10),

              generateWidget.createTextFormField(textController, 'Text', 'Enter text', reverseString, [FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]"))], TextInputType.text),
            
              const Text('*Press Enter or Done after completing the sentence'),

              const SizedBox(height: 50),
              const Text('Reversed Text: ', style: TextStyle(fontSize: 15)),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: Text(reversedString, style: const TextStyle(fontSize: 25)),
              ),
            ]
          ),
        ),
      ),
     );
  }
}