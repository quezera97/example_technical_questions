import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import '../widget/reuse_widget.dart';

class Question15 extends StatefulWidget {
  const Question15({super.key});

  @override
  State<Question15> createState() => _Question15State();
}

class _Question15State extends State<Question15> {
  final generateWidget = GenerateWidget();
  final textController = TextEditingController(text: 'I love programming Dart');
  
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
            children: [
              const Padding(
                padding: EdgeInsets.all(15),
                child: HtmlWidget(
                  '''
                  <h3>Given a list of words, write a Dart function to find all possible combinations of words that form a valid sentence. 
                  The function should take a list of words as input and return a list of sentences that can be constructed by concatenating these words in any order</h3>

                  <h5>For example, given the words: ["I", "love", "programming", "Dart"], the function should return sentences like:</h5>
                  <ul>
                    <li>"I love programming"</li>
                    <li>"Dart programming love"</li>
                    <li>"programming Dart I love"</li>
                  </ul>
                ''',
                ),
              ),
              const SizedBox(height: 10),

              generateWidget.createTextFormField(textController, 'Word', 'Enter any word', (p0) => null, null, TextInputType.text),
            ]
          ),
        ),
      ),
    );
  }
}




