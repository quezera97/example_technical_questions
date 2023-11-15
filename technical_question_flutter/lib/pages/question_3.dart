import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../dashboard.dart';
import '../widget/generate_shape.dart';

class Question3 extends StatefulWidget {
  const Question3({Key? key}) : super(key: key);

  @override
  State<Question3> createState() => _Question3State();
}

class _Question3State extends State<Question3> {
  final generateShape = GenerateShape();

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

  void setStateValidation(bool validate){
    setState(() {
      passValidation = validate;
    });
  }

  void generateShapeAction(shape) {
    if(int.parse(heightController.text) < 2){
      setStateValidation(false);
      
      showValidationDialog('Please enter height more than 2');
    } else if(int.parse(lengthController.text) < 2){
      setStateValidation(false);
      showValidationDialog('Please enter length more than 2');
    }
    else{
      if (selectedShape == 'rectangle') {
        if(int.parse(heightController.text) == int.parse(lengthController.text)){
          setStateValidation(false);
          showValidationDialog('Please enter length or height that is higher or lower than the other');
        }
        else{
          setStateValidation(true);
        }

      } else if (selectedShape == 'square') {
        if (int.parse(heightController.text) == int.parse(lengthController.text)) {
          setStateValidation(true);
        } else {
          setStateValidation(false);
          showValidationDialog('Square must have similar dimensions of Height and Length');
        }
      } else {
        setStateValidation(true);
      }
    }

    String uppercasedShape = shape.toUpperCase();

    if (passValidation) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('$uppercasedShape shape is shown. Do you want to choose another shape?'),
            content: returnGeneratedShape(),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Dashboard()));
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
      body: Center(
        child: Column(
          children: [
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
                color: Colors.blue,
                height: 50,
                child: const Text('Choose a Shape'),
              ),
            ),
            if (selectedShape == 'rectangle' || selectedShape == 'square') ... [
              TextFormField(
                controller: heightController,
                decoration: const InputDecoration(labelText: 'Height'),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r"[0-9]")),
                ],
              ),
              TextFormField(
                controller: lengthController,
                decoration: const InputDecoration(labelText: 'Length'),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r"[0-9]")),
                ],
              ),
            ],
            if (selectedShape == 'triangle' || selectedShape == 'diamond') ... [
              TextFormField(
                controller: heightController,
                decoration: const InputDecoration(labelText: 'Height'),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r"[0-9]")),
                ],
              ),
            ],
            ElevatedButton(
              onPressed: () {
                generateShapeAction(selectedShape);
              },
              child: const Text('Generate Shape'),
            ),
          ],
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
