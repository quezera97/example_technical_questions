import 'package:flutter/material.dart';

class Question2 extends StatefulWidget {
  const Question2({super.key});

  @override
  State<Question2> createState() => _Question2State();
}

class _Question2State extends State<Question2> {
  final inputText = TextEditingController();

  int countEachVowel = 0;
  int countEachNumber = 0;
  int countEachConsonant = 0;
  int countEachSpecialChar = 0;

  Map<String, int> oneCharVowel = {};
  Map<String, int> oneCharNumber = {};
  Map<String, int> oneCharConsonant = {};
  Map<String, int> oneCharSpecialChar = {};

  void checkString(String value) {
    countEachVowel = 0;
    countEachNumber = 0;
    countEachConsonant = 0;
    countEachSpecialChar = 0;
    oneCharVowel = {};
    oneCharConsonant = {};
    oneCharSpecialChar = {};
    oneCharNumber = {};
      
    if(value.isNotEmpty){
      value = value.toLowerCase();

      for (int i = 0; i < value.length; i++) {
        String char = value[i];

        if(char == 'a' || char == 'e' || char == 'i' || char == 'o' || char == 'u'){
          countEachVowel+=1;
          oneCharVowel[char] = (oneCharVowel[char] ?? 0) + 1;
        }
        else if (char.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>_-\s]'))){
          countEachSpecialChar += 1;
          // ignore: unrelated_type_equality_checks
          if(char == RegExp(r'[\s]') || char == ' '){
            char = '[ Blank Space ]';
          }

          oneCharSpecialChar[char] = (oneCharSpecialChar[char] ?? 0) + 1;
        }
        else if (char.contains(RegExp(r'[0-9]'))){
          countEachNumber += 1;
          oneCharNumber[char] = (oneCharNumber[char] ?? 0) + 1;
        }
        else{
          countEachConsonant += 1;
          oneCharConsonant[char] = (oneCharConsonant[char] ?? 0) + 1;
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
      
    });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Question 2'),        
      ),
      body: Column(
        children: [
          TextFormField(
            controller: inputText,
            onFieldSubmitted: (value) {
              checkString(value);
            },
          ),
          ListTile(
            title: Text('Occurence of Vowel: $countEachVowel'),
            subtitle: Text('List of Vowel: $oneCharVowel'),
          ),
          ListTile(
            title: Text('Occurence of Special Character: $countEachSpecialChar'),
            subtitle: Text('List of Special Character: $oneCharSpecialChar'),
          ),
          ListTile(
            title: Text('Occurence of Consonant: $countEachConsonant'),
            subtitle: Text('List of Consonant: $oneCharConsonant'),
          ),
          ListTile(
            title: Text('Occurence of Number: $countEachNumber'),
            subtitle: Text('List of Number: $oneCharNumber'),
          )
        ],
      ),
    );
  }
}