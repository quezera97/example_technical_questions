import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import '../dashboard.dart';
import '../widget/generate_shape.dart';
import '../widget/reuse_widget.dart';
class Question3 extends StatefulWidget {
  const Question3({Key? key}) : super(key: key);

  @override
  State<Question3> createState() => _Question3State();
}

class _Question3State extends State<Question3> {
  final generateShape = GenerateShape();
  final generateWidget = GenerateWidget();

  String selectedShape = '';
  bool passValidation = false;
  final heightController = TextEditingController(text: '2');
  final lengthController = TextEditingController(text: '2');

  Widget returnGeneratedShape() {
    if (selectedShape == 'rectangle' || selectedShape == 'square') {
      return generateShape.generateRectangleSquare(int.parse(heightController.text), int.parse(lengthController.text));
    } else if (selectedShape == 'triangle') {
      return generateShape.generateTriangle(int.parse(heightController.text));
    } else if (selectedShape == 'diamond') {
      return generateShape.generateDiamond(int.parse(heightController.text));
    } else {
      return const SizedBox(height: 0);
    }
  }

  void selectShape(String shape) {
    setState(() {
      selectedShape = shape;
    });
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

  void setStateValidation(bool validate) {
    setState(() {
      passValidation = validate;
    });
  }

  void generateShapeAction(String shape) {
    bool checkIsEmpty = false;
    int? height, length;

    if (selectedShape == 'rectangle' || selectedShape == 'square') {
      if (heightController.text.isEmpty && lengthController.text.isEmpty) {
        checkIsEmpty = true;
      } else {
        height = int.tryParse(heightController.text);
        length = int.tryParse(lengthController.text);
      }
    } else {
      if (heightController.text.isEmpty) {
        checkIsEmpty = true;
      } else {
        height = int.tryParse(heightController.text);
      }
    }

    if (checkIsEmpty) {
      setStateValidation(false);
      showValidationDialog('Please enter valid dimensions');
    } else {
      if (height != null && length != null) {
        if (height < 2 || length < 2) {
          setStateValidation(false);
          showValidationDialog('Dimensions should be greater than 2');
        } else if (selectedShape == 'rectangle') {
          if (height == length) {
            setStateValidation(false);
            showValidationDialog('Length or height should differ for a rectangle');
          } else {
            setStateValidation(true);
          }
        } else if (selectedShape == 'square') {
          if (height == length) {
            setStateValidation(true);
          } else {
            setStateValidation(false);
            showValidationDialog('Square should have equal dimensions');
          }
        }
      } else {
        if (selectedShape == 'triangle' || selectedShape == 'diamond') {
          if (height! < 2) {
            setStateValidation(false);
            showValidationDialog('Height should be greater than 2');
          } else {
            setStateValidation(true);
          }
        } else {
          setStateValidation(false);
        }
      }
    }

    String uppercasedShape = shape.toUpperCase();
    if (passValidation) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('$uppercasedShape shape is shown. Do you want to choose another shape? Swipe up/down or left/right to see more'),
            content: Center(child: SingleChildScrollView(child: SizedBox(child: SingleChildScrollView(scrollDirection: Axis.horizontal, child: returnGeneratedShape())))),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const Dashboard()),
                    (Route<dynamic> route) => false,
                  );
                },
                child: const Text('Close'),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    selectedShape = '';
                    passValidation = false;
                  });
                  Navigator.of(context).pop();
                },
                child: const Text('Yes'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Question 3'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.5),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(15),
                  child: HtmlWidget(
                    '''
                  <h3>Create a short program that displays a 2D shape - e.g square, triangle, and circle.</h3>
                  <ol>
                    <li>Allow users to key in the shape to display, e.g. "Square".</li>
                    <li>Ask the user for the size of the shape, draw the shape according to the size.</li>
                    <li>Display the shape according to the user's input</li>
                    <li>Allow users to decide when to quit the program</li>
                  </ol>
                  ''',
                  ),
                ),
                const SizedBox(height: 10),
                PopupMenuButton<String>(
                  onSelected: selectShape,
                  itemBuilder: (BuildContext context) {
                    return [
                      'rectangle',
                      'square',
                      'triangle',
                      'diamond',
                    ].map((String shape) {
                      return PopupMenuItem(
                        value: shape,
                        child: Text(shape.capitalizeFirst()),
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
                        'Choose a shape',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                if (selectedShape == 'rectangle' || selectedShape == 'square') ...[
                  generateWidget.createTextFormField(heightController, 'Height', 'Enter Height', (p0) => null, [FilteringTextInputFormatter.allow(RegExp(r"[0-9]"))], TextInputType.number),
                  generateWidget.createTextFormField(lengthController, 'Length', 'Enter Length', (p0) => null, [FilteringTextInputFormatter.allow(RegExp(r"[0-9]"))], TextInputType.number),
                ] else if (selectedShape == 'triangle' || selectedShape == 'diamond') ...[
                  generateWidget.createTextFormField(heightController, 'Height', 'Enter Height', (p0) => null, [FilteringTextInputFormatter.allow(RegExp(r"[0-9]"))], TextInputType.number),
                ],
                if (selectedShape != '') ...[
                  ElevatedButton(
                    onPressed: () {
                      generateShapeAction(selectedShape);
                    },
                    child: const Text('Generate Shape'),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

extension StringExtension on String {
  String capitalizeFirst() {
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}
