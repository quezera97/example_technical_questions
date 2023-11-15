import 'dart:math';

import 'package:flutter/material.dart';

class Question1 extends StatefulWidget {
  const Question1({super.key});

  @override
  State<Question1> createState() => _Question1State();
}

class _Question1State extends State<Question1> {
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
    if(digitArr.contains('9')){
      return digitArr;
    }

    if(int.parse(digitArr) % 2 == 0){
      return digitArr;
    }
    else{
      return 'Odd';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Question 1'),        
      ),
      body: Column(
        children: [
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
                color: Colors.blue,
                height: 50,
                child: const Text('Choose the length of Array'),
              ),
            ),
          ),

          if(sizeOfArray > 0) ... [
            ElevatedButton(
              onPressed: () {
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
              }, 
              child: const Text('Generate Number')
            ),
          ],

          if(arrDigit.isNotEmpty) ... [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Text(arrDigit.toString()),
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
      )
    );
  }
}