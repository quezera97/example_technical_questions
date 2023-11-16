import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import '../widget/reuse_widget.dart';

class Question1 extends StatefulWidget {
  const Question1({super.key});

  @override
  State<Question1> createState() => _Question1State();
}

class _Question1State extends State<Question1> {
  final generateButton = GenerateWidget();

  List<int> lengthOfArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  int sizeOfArray = 0;
  List<int> arrDigit = [];
  String numberContainingNine = '';
  bool containsNine = false;

  @override
  void initState() {
    super.initState();
  }

  String calcDigit(digitArr) {
    if (digitArr.contains('9')) {
      return digitArr;
    }

    if (int.parse(digitArr) % 2 == 0) {
      return digitArr;
    } else {
      return 'Odd';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Question 1'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.5),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(15),
                    child: HtmlWidget(
                    '''
                    <h3>Create a function that accepts an array of integers, do the following:</h3>
                    <ol>
                      <li>Loop through the array and display the integer if it is an even number, display "Odd" if it is anodd number.</li>
                      <li>Stop the loop if the number '9' is encountered</li>
                    </ol>
                    ''',
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: PopupMenuButton<int>(
                      onSelected: (int value) {
                        numberContainingNine = '';
                        containsNine = false;
          
                        setState(() {
                          sizeOfArray = value;
                        });
                      },
                      itemBuilder: (BuildContext context) {
                        return lengthOfArray.map((int value) {
                          return PopupMenuItem<int>(
                            value: value,
                            child: Text(value.toString()),
                          );
                        }).toList();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(12.0), // Rounded corners
                        ),
                        height: 50,
                        child: const Center(
                          child: Text(
                            'Choose the length of Array',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold, // Make text bold
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (sizeOfArray > 0) ...[
                    generateButton.createSimpleButton('Generate Number', () {
                      arrDigit = [];
                      numberContainingNine = '';
                      containsNine = false;
          
                      Random random = Random();
                      for (int i = 0; i < sizeOfArray; i++) {
                        int randomNumber = random.nextInt(100);
                        arrDigit.add(randomNumber);
                      }
          
                      setState(() {
                        arrDigit;
                      });
                    }),
                  ],
                  if (arrDigit.isNotEmpty) ...[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child: Text(
                          arrDigit.toString(),
                          style: const TextStyle(fontSize: 22),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10.5),
                        child: ListView.builder(
                          itemCount: arrDigit.length,
                          itemBuilder: (context, index) {
                            var digitArr = arrDigit[index].toString();
          
                            var checkListForNine = calcDigit(digitArr);
          
                            if (!containsNine) {
                              if (checkListForNine.contains('9')) {
                                containsNine = true;
                                numberContainingNine = checkListForNine;
                              }
          
                              return ListTile(
                                title: Text('Number from Array: $digitArr'),
                                subtitle: Text('Output: $checkListForNine'),
                              );
                            } else {
                              return ListTile(
                                title: Text('Number $digitArr excluded due to $numberContainingNine'),
                              );
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ));
  }
}
