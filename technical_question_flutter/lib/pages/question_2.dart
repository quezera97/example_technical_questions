import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import '../widget/reuse_widget.dart';
import 'solutions_functions.dart';

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

      /** 
       * this function break into 5 steps
       * 1. check each and every character from the text that user key in
       * 2. if no special character or blank space found it will concantenate one each other
       * 3. if found, it will stop concantenate and get the word and insert into the array
       * 4. then, it will restart again (which is initialize the word to empty) (repeat step no.2)
       * 5. when all text checked, it will make a loop to check which of the word in th earray is longer
      **/
      for (int i = 0; i < value.length; i++) {
        String char = value[i];

        //it will check the vowel
        if (char == 'a' || char == 'e' || char == 'i' || char == 'o' || char == 'u') {
          countEachVowel++;
          oneCharVowel[char] = (oneCharVowel[char] ?? 0) + 1;

          wordConstructed += char;
        }
        //it will check special character
        else if (char.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>_-\s]'))) {
          countEachSpecialChar++;
          // ignore: unrelated_type_equality_checks
          if (char == RegExp(r'[\s]') || char == ' ') {
            char = '[ Blank Space ]';
          }

          oneCharSpecialChar[char] = (oneCharSpecialChar[char] ?? 0) + 1;

          listOfLongestWord.add(wordConstructed);
          wordConstructed = '';
        }
        //it will check numbers
        else if (char.contains(RegExp(r'[0-9]'))) {
          countEachNumber++;
          oneCharNumber[char] = (oneCharNumber[char] ?? 0) + 1;

          listOfLongestWord.add(wordConstructed);
          wordConstructed = '';
        }
        //it will check other than above which is consonant
        else {
          countEachConsonant++;
          oneCharConsonant[char] = (oneCharConsonant[char] ?? 0) + 1;

          wordConstructed += char;
        }
      }

      //the last word in the text will be added to the array
      if (wordConstructed.isNotEmpty) {
        listOfLongestWord.add(wordConstructed);
      }

      //it will check which is longer than other from the array
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
              generateWidget.createSimpleButton('Solutions and Functions', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SolutionsFunctions(title: 'Question 2', listOfImg: [
                            'assets/question_2/1.png',
                            'assets/question_2/2.png',
                          ])),
                );
              }),
              const SizedBox(height: 10),
              //user can enter own's word and press submit to check the occurence and longest word and display them
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
