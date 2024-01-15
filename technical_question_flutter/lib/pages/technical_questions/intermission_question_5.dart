import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import '../../widget/reuse_widget.dart';
import 'question_5.dart';

class IntermissionQuestion5 extends StatelessWidget {
  IntermissionQuestion5({super.key});

  final generateWidget = GenerateWidget();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Confirmation to Question 5'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.5),
          child: SingleChildScrollView(
            child: Center(
                child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              const Padding(
                padding: EdgeInsets.all(15),
                child: HtmlWidget(
                  '''
                    <h3>Create a one-page web application for a membership subscription sign up page that</h3>
                    <ol>
                      <li>Allow the users to insert their personal information and select a subscription plan</li>
                      <li>When the form is submitted, the information inserted will be displayed and users arerequired to confirm whether or not the information is true</li>
                    </ol>
                    ''',
                ),
              ),
              const SizedBox(height: 10),
              
              generateWidget.createSimpleButton('GO (will be redirected to HTML file)', () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Question5()),
                );
              }),
            ])),
          ),
        ));
  }
}
