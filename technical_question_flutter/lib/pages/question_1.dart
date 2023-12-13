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
  final generateWidget = GenerateWidget();

  List<int> lengthOfArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  int sizeOfArray = 0;
  List<int> arrDigit = [];
  String numberContainingNine = '';
  bool containsNine = false;
  bool _showInstruction = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      setState(() {
        _showInstruction = true;
      });
    });
  }

  String calcDigit(digitArr) {
    //check if contains '9' it will return that digit
    if (digitArr.contains('9')) {
      return digitArr;
    }

    //check if divisible by 2 it return that digit, otherwise it will return 'Odd'
    if (int.parse(digitArr) % 2 == 0) {
      return digitArr;
    } else {
      return 'Odd';
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_showInstruction) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return const AlertDialog(
              title: Text('Instruction'),
              content: HtmlWidget(
                '''
                  <ol>
                    <li>Choose the length of array (the higher the better)</li>
                    <li>Click 'Generate Number' button, to generate random number</li>
                    <li>If there's no number 9 in generated number, repeat step 2</li>
                    <li>The list of numbers can be scrolled</li>
                  </ol>
                ''',
              ),
            );
          },
        );
      });

      setState(() {
        _showInstruction = false;
      });
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('Question 1'),
          backgroundColor: generateWidget.excludeWhiteColor(),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.5),
          child: Center(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(15),
                  child: HtmlWidget(
                    '''
                    <h3>Create a function that accepts an array of integers, do the following:</h3>
                    <ol>
                      <li>Loop through the array and display the integer if it is an even number, display "Odd" if it is an odd number.</li>
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
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      height: 50,
                      child: const Center(
                        child: Text(
                          'Choose the length of Array',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                if (sizeOfArray > 0) ...[
                  generateWidget.createSimpleButton('Generate Number', () {
                    arrDigit = [];
                    numberContainingNine = '';
                    containsNine = false;

                    //let user to generate number with selected size of array (limit it)
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
                            //if does not contain '9' it will show the text below with the digits
                            if (checkListForNine.contains('9')) {
                              containsNine = true;
                              numberContainingNine = checkListForNine;
                            }

                            return ListTile(
                              title: Text('Number from Array: $digitArr'),
                              subtitle: Text('Output: $checkListForNine'),
                            );
                          } else {
                            //if contain '9' it will stop looping and show which digits will be excluded
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
        ));
  }
}
