import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:math_expressions/math_expressions.dart';

import '../../widget/reuse_widget.dart';
class Question4 extends StatefulWidget {
  const Question4({Key? key}) : super(key: key);

  @override
  State<Question4> createState() => _Question4State();
}

class _Question4State extends State<Question4> {
  final generateWidget = GenerateWidget();
  String result = "0";
  String expression = "";

  void input(String input) {
    setState(() {
      //check input and change from symbol to math expression
      if (input == '÷') {
        expression = expression + input;
        expression = expression.replaceAll('÷', '/');
      } else if (input == 'x') {
        expression = expression + input;
        expression = expression.replaceAll('x', '*');
      } else if (input == 'AC') {
        expression = "";
        result = "0";
      } else if (input == 'Del') {
        if (expression == "") {
          expression = "";
        } else {
          expression = expression.substring(0, expression.length - 1);
        }
      } else if (input == '=') {
        try {
          //parse it into math expression using library
          Parser p = Parser();
          Expression exp = p.parse(expression);

          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          result = "Error";
        }
      } else if (input == '.') {
        if (expression == "") {
          expression = '${expression}0.';
        }
      } else {
        expression = expression + input;
      }
    });
  }

  Widget calculatorButton(String text, Function() onPressed) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Question 4'),
        backgroundColor: generateWidget.excludeWhiteColor(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(15),
                child: HtmlWidget(
                  '''
                <h3>Create a programme for a calculator that includes</h3>
                <ol>
                  <li>Features to calculate basic mathematical operations (addition +, subtraction -, multiplication*, division /)</li>
                  <li>Calculate a given mathematical equation correctly. e.g. 5 + 2 - 3 * 2 / 3 = 5</li>
                </ol>
                ''',
                ),
              ),
              const SizedBox(height: 10),
              Text(
                result,
                style: const TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 20),
              Text(
                expression,
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  calculatorButton('Del', () {
                    input('Del');
                  }),
                  calculatorButton('AC', () {
                    input('AC');
                  }),
                ],
              ),
              const SizedBox(height: 5),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      calculatorButton('+', () {
                        input('+');
                      }),
                      calculatorButton('-', () {
                        input('-');
                      }),
                      calculatorButton('x', () {
                        input('x');
                      }),
                      calculatorButton('÷', () {
                        input('÷');
                      }),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      calculatorButton('1', () {
                        input('1');
                      }),
                      calculatorButton('2', () {
                        input('2');
                      }),
                      calculatorButton('3', () {
                        input('3');
                      }),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      calculatorButton('4', () {
                        input('4');
                      }),
                      calculatorButton('5', () {
                        input('5');
                      }),
                      calculatorButton('6', () {
                        input('6');
                      }),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      calculatorButton('7', () {
                        input('7');
                      }),
                      calculatorButton('8', () {
                        input('8');
                      }),
                      calculatorButton('9', () {
                        input('9');
                      }),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      calculatorButton('.', () {
                        input('.');
                      }),
                      calculatorButton('0', () {
                        input('0');
                      }),
                      calculatorButton('=', () {
                        input('=');
                      }),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
