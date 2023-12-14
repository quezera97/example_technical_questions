import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import '../widget/reuse_widget.dart';

class Question9 extends StatefulWidget {
  const Question9({super.key});

  @override
  State<Question9> createState() => _Question9State();
}

class _Question9State extends State<Question9> {
  final generateWidget = GenerateWidget();
  final numberController = TextEditingController(text: '5');
  List<int> arrDigit = [];
  int largestInt = 0;
  Random random = Random();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    generateAndFindNumber();
  }

  void generateAndFindNumber() {
    for (int i = 0; i < int.parse(numberController.text); i++) {
      int randomNumber = random.nextInt(100);
      arrDigit.add(randomNumber);
    }

    largestInt = arrDigit[0];

    for(int i = 1; i < int.parse(numberController.text); i++) {
      if(arrDigit[i] > largestInt){
        largestInt = arrDigit[i];
      }
    }

    setState(() {
      arrDigit;
      largestInt;
    });
  }
  
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: const Text('Question 9'),
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
                    <h3> Write an algorithm that finds the largest number in an array of integers without using built-in functions like max() </h3>
                  ''',
                ),
              ),
              const SizedBox(height: 10),

              generateWidget.createTextFormField(numberController, 'Size', 'Enter size of array', (p0) => null, [FilteringTextInputFormatter.allow(RegExp("[0-9]"))], TextInputType.number),
            
              generateWidget.createSimpleButton('Generate number', () {
                arrDigit = [];

                generateAndFindNumber();
              }),
              const SizedBox(height: 50),
              const Text('Generated list of array:', style: TextStyle(fontSize: 15)),
              const SizedBox(height: 10),
              Text(arrDigit.toString(), style: const TextStyle(fontSize: 25)),
              const SizedBox(height: 30),
              const Text('The largest number in the array is:', style: TextStyle(fontSize: 15)),
              const SizedBox(height: 10),
              Text(largestInt.toString(), style: const TextStyle(fontSize: 25)),
            ],
          ),
        ),
      ),
     );
  }
}