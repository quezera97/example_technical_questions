import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import '../widget/reuse_widget.dart';

class Question2 extends StatefulWidget {
  const Question2({super.key});

  @override
  State<Question2> createState() => _Question2State();
}

class _Question2State extends State<Question2> {
  final generateWidget = GenerateWidget();
  final inputText = TextEditingController();

  int countEachVowel = 0;
  int countEachNumber = 0;
  int countEachConsonant = 0;
  int countEachSpecialChar = 0;

  Map<String, int> oneCharVowel = {};
  Map<String, int> oneCharNumber = {};
  Map<String, int> oneCharConsonant = {};
  Map<String, int> oneCharSpecialChar = {};

  String longestWordinList = '';
  String wordConstructed = '';
  List<String> listOfLongestWord = [];

  void checkString(String value) {
    countEachVowel = 0;
    countEachNumber = 0;
    countEachConsonant = 0;
    countEachSpecialChar = 0;
    oneCharVowel = {};
    oneCharConsonant = {};
    oneCharSpecialChar = {};
    oneCharNumber = {};
    longestWordinList = '';
    wordConstructed = '';
    listOfLongestWord = [];


    if (value.isNotEmpty) {
      value = value.toLowerCase();

      for (int i = 0; i < value.length; i++) {
        String char = value[i];

        if (char == 'a' || char == 'e' || char == 'i' || char == 'o' || char == 'u') {
          countEachVowel++;
          oneCharVowel[char] = (oneCharVowel[char] ?? 0) + 1;

          wordConstructed += char;
        } else if (char.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>_-\s]'))) {
          countEachSpecialChar++;
          // ignore: unrelated_type_equality_checks
          if (char == RegExp(r'[\s]') || char == ' ') {
            char = '[ Blank Space ]';
          }

          oneCharSpecialChar[char] = (oneCharSpecialChar[char] ?? 0) + 1;

          listOfLongestWord.add(wordConstructed);
          wordConstructed = '';
        } else if (char.contains(RegExp(r'[0-9]'))) {
          countEachNumber++;
          oneCharNumber[char] = (oneCharNumber[char] ?? 0) + 1;

          listOfLongestWord.add(wordConstructed);
          wordConstructed = '';
        } else {
          countEachConsonant++;
          oneCharConsonant[char] = (oneCharConsonant[char] ?? 0) + 1;

          wordConstructed += char;
        }
      }

      if (wordConstructed.isNotEmpty) {
        listOfLongestWord.add(wordConstructed);
      }

      for (var word in listOfLongestWord) {
        if (word.length > longestWordinList.length) {
          longestWordinList = word;
        }
      }

      setState(() {
        countEachVowel;
        countEachConsonant;
        countEachSpecialChar;
        countEachNumber;
        oneCharVowel;
        oneCharConsonant;
        oneCharSpecialChar;
        oneCharNumber;
        longestWordinList;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Question 2'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.5),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(15),
                child: HtmlWidget(
                '''
                <h3> Create a function that accepts a string of varying length and does the following:</h3>
                <ol>
                  <li>Group the characters in the string into three categories - vowels (A, E, I, O, U), consonants(alphabets other than vowels), and special characters (non-alphabets)</li>
                  <li>Display the number of occurrences of each character in the string</li>
                  <li>Display the longest word in the string</li>
                </ol>
                ''',
                ),
              ),
              const SizedBox(height: 10),
              generateWidget.createTextFormField(inputText, '', 'Enter your words here', checkString, null, TextInputType.text),
              generateWidget.createListTile('Occurence of Vowel: $countEachVowel', 'List of Vowel: $oneCharVowel', 15.6),
              generateWidget.createListTile('Occurence of Special Character: $countEachSpecialChar', 'List of Special Character: $oneCharSpecialChar', 15.6),
              generateWidget.createListTile('Occurence of Consonant: $countEachConsonant', 'List of Consonant: $oneCharConsonant', 15.6),
              generateWidget.createListTile('Occurence of Number: $countEachNumber', 'List of Number: $oneCharNumber', 15.6),
              generateWidget.createListTile('The longest word in the given words is:', longestWordinList, 15.6),
            ],
          ),
        ),
      ),
    );
  }
}
