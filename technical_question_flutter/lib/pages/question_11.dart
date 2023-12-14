import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widget/reuse_widget.dart';

class Question11 extends StatefulWidget {
  const Question11({super.key});

  @override
  State<Question11> createState() => _Question11State();
}

class _Question11State extends State<Question11> {
  final generateWidget = GenerateWidget();
  final numberController = TextEditingController();
  String? stringSortedArr;
  List<int>? sortedArr;
  String locationFoundAt = 'Not Yet';

  @override
  void initState() {
    super.initState();
    getPrefsSortedArr();
  }

  Future<void> getPrefsSortedArr() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    stringSortedArr = prefs.getString('prefsSortedArr');
    List<String> stringValues = stringSortedArr!
      .replaceAll('[', '')
      .replaceAll(']', '')
      .split(',');

    // Trim whitespace and convert strings to integers
    sortedArr = stringValues.map((e) => int.parse(e.trim())).toList();

    setState(() {
      stringSortedArr;
    });
  }

  void binarySearch(dynamic searchedNumber) {
    int low = 0;
    int high = sortedArr!.length - 1;

    int targetNumber = int.parse(searchedNumber);

    while (low <= high) {
      int mid = ((low + high) / 2).floor();
      int midElement = sortedArr![mid];

      if (midElement == targetNumber) {
        locationFoundAt = mid.toString();

        setState(() {
          locationFoundAt;
        });

        return;
      } else if (midElement < targetNumber) {
        low = mid + 1; // Search the right half
      } else {
        high = mid - 1; // Search the left half
      }
    }

    setState(() {
      locationFoundAt = "-1 (Not Found)";
    });
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Question 11'),
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
                  <h3>Develop a function that performs a binary search on a sorted list and returns the index of a specific element, or -1 if the element is not found</h3>
                  ''',
                ),
              ),
              const SizedBox(height: 10),

              const Text('Array number from Question 10:', style: TextStyle(fontSize: 15)),
              const SizedBox(height: 10),
              Text('$stringSortedArr', style: const TextStyle(fontSize: 25)),
              const SizedBox(height: 10),

              generateWidget.createTextFormField(numberController, 'Number', 'Enter number to be searched', binarySearch, [FilteringTextInputFormatter.allow(RegExp("[0-9]"))], TextInputType.number),
              
              const Text('The input number found at (index):', style: TextStyle(fontSize: 15)),
              const SizedBox(height: 10),
              Text(locationFoundAt, style: const TextStyle(fontSize: 25)),
            ]
          ),
        ),
      ),
    );
  }
}