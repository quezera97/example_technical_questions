import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import '../widget/reuse_widget.dart';
import '../widget/webview.dart';

class Question12 extends StatefulWidget {
  const Question12({super.key});

  @override
  State<Question12> createState() => _Question12State();
}

class _Question12State extends State<Question12> {
  final generateWidget = GenerateWidget();
  final emailController = TextEditingController(text: 'noreply@example.com');
  bool isValid = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isValid = isValidEmail(emailController.text);
  }

  bool isValidEmail(String email) {
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    return emailRegExp.hasMatch(email);
  }

  void showValidationDialog(String message) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

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
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Padding(
              padding: EdgeInsets.all(15),
              child: HtmlWidget(
                '''
                    <h3>Design a function that validates whether a given string is a valid email address or not based on certain criteria</h3>
                  ''',
              ),
            ),
            const SizedBox(height: 10),
            generateWidget.createTextFormField(emailController, 'Number', 'Enter number to be searched', (p0) => null, null, TextInputType.text),
            generateWidget.createSimpleButton('Verify email', () {
              isValid = isValidEmail(emailController.text);

              isValid == true ? showValidationDialog('Email is Valid') : showValidationDialog('Email is Invalid');
            }),
            const SizedBox(height: 10),
            generateWidget.createSimpleButton('Reference Link', () async {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const WebViewWidget(url: 'https://www.geeksforgeeks.org/how-to-validate-email-address-without-using-regular-expression-in-javascript/')),
              );
            }),
          ]),
        ),
      ),
    );
  }
}
