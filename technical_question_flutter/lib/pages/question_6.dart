import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import '../widget/reuse_widget.dart';

class Question6 extends StatefulWidget {
  const Question6({super.key});

  @override
  State<Question6> createState() => _Question6State();
}

class _Question6State extends State<Question6> {
  final generateWidget = GenerateWidget();
  final fromNumberController = TextEditingController(text: '0');
  final toNumberController = TextEditingController(text: '100');
  int fromNumber = 0;
  int toNumber = 100;
  List<int> primeNumbers = [];
  

  @override
  void initState() {
    super.initState();
    calculatePrimeNumbers();
  }
  
  bool getPrimeNumber(int number) {
    if (number <= 1) {
      return false;
    }
    for (int i = 2; i <= number / 2; i++) {
      if (number % i == 0) {
        return false;
      }
    }
    return true;
  }

  void calculatePrimeNumbers() {
    primeNumbers.clear();
    for (int i = fromNumber; i <= toNumber; i++) {
      if (getPrimeNumber(i)) {
        primeNumbers.add(i);
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
        title: const Text('Question 6'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.5),
        child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(15),
                child: HtmlWidget(
                  '''
                    <h3> Please develop computer program to filter list of prime number from 1 - 100: </h3>
                  ''',
                ),
              ),
              const SizedBox(height: 10),

              generateWidget.createTextFormField(fromNumberController, 'From', 'Enter From Number', (p0) => null, [FilteringTextInputFormatter.allow(RegExp(r"[0-9]"))], TextInputType.number),
              generateWidget.createTextFormField(toNumberController, 'To', 'Enter To Number', (p0) => null, [FilteringTextInputFormatter.allow(RegExp(r"[0-9]"))], TextInputType.number),

              generateWidget.createSimpleButton('Generate Number', () {
                fromNumber = int.parse(fromNumberController.text);
                toNumber = int.parse(toNumberController.text);

                if(fromNumber >= toNumber){
                  showValidationDialog('Please enter FROM number lower than TO number');
                }

                setState(() {
                  fromNumber;
                  toNumber;
                });

                calculatePrimeNumbers();
              }),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.5),
                  child: ListView.builder(
                    itemCount: primeNumbers.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text('Prime Number : ${primeNumbers[index]}'),
                      );
                    },
                  ),
                ),
              ), 
            ]
          )
        )
    );
  }
}
