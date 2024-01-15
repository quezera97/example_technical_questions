import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import '../../widget/reuse_widget.dart';

class Question13 extends StatefulWidget {
  const Question13({super.key});

  @override
  State<Question13> createState() => _Question13State();
}

class _Question13State extends State<Question13> {
  final generateWidget = GenerateWidget();
  final firstWordController = TextEditingController(text: 'silent');
  final secondWordController = TextEditingController(text: 'listen');

  var countCharInWord = [];
  var countEachNumber = 0;

  void checkAnagram(String firstWord, String secondWord) {
    if (firstWord == '' && secondWord == '') {
      showValidationDialog('Please enter valid word');
    } else {
      firstWord = firstWord.replaceAll(' ', '');
      secondWord = secondWord.replaceAll(' ', '');

      if (firstWord.length != secondWord.length) {
        showValidationDialog('Please enter valid word');
      } else {
        checkLetterInFirstWord(firstWord);
        checkLetterInSecondWord(secondWord);

        if (countEachNumber == 0) {
          showValidationDialog('These 2 words are anagram');
        } else {
          showValidationDialog('These 2 words aren\'t anagram');
        }
      }
    }
  }

  void checkLetterInFirstWord(String firstWord) {
    countCharInWord = [];
    countEachNumber = 0;
    for (var i = 0; i < firstWord.length; i++) {
      String char = firstWord[i];

      countEachNumber++;
      countCharInWord.add(char);
    }
  }

  void checkLetterInSecondWord(String secondWord) {
    for (var i = 0; i < secondWord.length; i++) {
      for (var j = 0; j < countCharInWord.length; j++) {
        if (secondWord[i] == countCharInWord[j]) {
          countEachNumber--;
        }
      }
    }
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
        title: const Text('Question 13'),
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
                <h3>Develop an algorithm to check if two strings are anagrams of each other. Anagrams are words or phrases formed by rearranging the letters of another, such as "listen" and "silent"</h3>
                ''',
              ),
            ),
            const SizedBox(height: 10),
            generateWidget.createTextFormField(firstWordController, 'First Word', 'Enter the first word', (p0) => null, null, TextInputType.text),
            generateWidget.createTextFormField(secondWordController, 'Second Word', 'Enter the second word', (p0) => null, null, TextInputType.text),
            const SizedBox(height: 20),
            generateWidget.createSimpleButton('Check Anagram', () {
              checkAnagram(firstWordController.text, secondWordController.text);
            }),
          ]),
        ),
      ),
    );
  }
}
