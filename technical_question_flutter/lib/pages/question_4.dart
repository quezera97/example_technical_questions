import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Question4 extends StatefulWidget {
  const Question4({Key? key}) : super(key: key);

  @override
  State<Question4> createState() => _Question4State();
}

class _Question4State extends State<Question4> {
  String result = "0";
  String expression = "";

  void input(String input) {
    setState(() {
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
        } else{
          expression = expression.substring(0, expression.length - 1);
        }
      } else if (input == '=') {
        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);

          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          result = "Error";
        }
      } else if(input == '.'){
        if(expression == ""){
          expression = '${expression}0.';
        }
      } else {
        expression = expression + input;
      }
    });
  }

  Widget customButton(String text, Function() onPressed) {
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
                customButton('Del', () {
                  input('Del');
                }),
                customButton('AC', () {
                  input('AC');
                }),
              ],
            ),
            const SizedBox(height: 20),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    customButton('+', () {
                      input('+');
                    }),
                    customButton('-', () {
                      input('-');
                    }),
                    customButton('x', () {
                      input('x');
                    }),
                    customButton('÷', () {
                      input('÷');
                    }),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    customButton('1', () {
                      input('1');
                    }),
                    customButton('2', () {
                      input('2');
                    }),
                    customButton('3', () {
                      input('3');
                    }),
                    
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    customButton('4', () {
                      input('4');
                    }),
                    customButton('5', () {
                      input('5');
                    }),
                    customButton('6', () {
                      input('6');
                    }),
                    
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    customButton('7', () {
                      input('7');
                    }),
                    customButton('8', () {
                      input('8');
                    }),
                    customButton('9', () {
                      input('9');
                    }),
                    
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    customButton('.', () {
                      input('.');
                    }),
                    customButton('0', () {
                      input('0');
                    }),
                    customButton('=', () {
                      input('=');
                    }),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
