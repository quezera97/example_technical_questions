// Implement a sorting algorithm such as Bubble Sort, Quick Sort, or Merge Sort to sort an array of numbers in ascending order.
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import '../widget/reuse_widget.dart';
import '../widget/webview.dart';

class Question10 extends StatefulWidget {
  const Question10({super.key});

  @override
  State<Question10> createState() => _Question10State();
}

class _Question10State extends State<Question10> {
  final generateWidget = GenerateWidget();
  final numberController = TextEditingController(text: '5');
  List<int> arrDigit = [];
  List<int> bubbleSortArr = [];
  List<int> insertionSortArr = [];
  List<int> mergeSortArr = [];
  int lengthOfArray = 5;
  Random random = Random();

  @override
  void initState() {
    super.initState();
    generateAndSortNumber();
  }

  void generateAndSortNumber() {
    lengthOfArray = int.parse(numberController.text);
    
    for (int i = 0; i < lengthOfArray; i++) {
      int randomNumber = random.nextInt(100);
      arrDigit.add(randomNumber);
    }

    bubbleSortArr = List.from(arrDigit);
    insertionSortArr = List.from(arrDigit);
    mergeSortArr = List.from(arrDigit);
    bubbleSort(bubbleSortArr);
    insertionSort(insertionSortArr);
    mergeSort(mergeSortArr, 0, lengthOfArray - 1);

    setState(() {
      arrDigit;
    });
  }

  void bubbleSort(bubbleSortArr) {
    for (int i = 0; i < lengthOfArray - 1; i++) {
      for (int j = 0; j < lengthOfArray - i - 1; j++) {
        if (bubbleSortArr[j] > bubbleSortArr[j + 1]) {
          int temp = bubbleSortArr[j];
          bubbleSortArr[j] = bubbleSortArr[j + 1];
          bubbleSortArr[j + 1] = temp;
        }
      }
    }  
  }

  void insertionSort(insertionSortArr) {
    for (int i = 1; i < lengthOfArray; i++) {
      int key = insertionSortArr[i];
      int j = i - 1;
      
      while (j >= 0 && insertionSortArr[j] > key) {
        insertionSortArr[j + 1] = insertionSortArr[j];
        j = j - 1;
      }
      insertionSortArr[j + 1] = key;
    }
  }

  void mergeSort(List<int> arr, int left, int right) {
    if (left < right) {
      int mid = (left + right) ~/ 2;

      mergeSort(arr, left, mid);
      mergeSort(arr, mid + 1, right);

      merge(arr, left, mid, right);
    }
  }

  void merge(List<int> mergeSortArr, int left, int mid, int right) {
    int n1 = mid - left + 1;
    int n2 = right - mid;

    List<int> leftArr = List<int>.filled(n1, 0);
    List<int> rightArr = List<int>.filled(n2, 0);

    for (int i = 0; i < n1; i++) {
      leftArr[i] = mergeSortArr[left + i];
    }
    for (int j = 0; j < n2; j++) {
      rightArr[j] = mergeSortArr[mid + 1 + j];
    }

    int i = 0, j = 0;
    int k = left;

    while (i < n1 && j < n2) {
      if (leftArr[i] <= rightArr[j]) {
        mergeSortArr[k] = leftArr[i];
        i++;
      } else {
        mergeSortArr[k] = rightArr[j];
        j++;
      }
      k++;
    }

    while (i < n1) {
      mergeSortArr[k] = leftArr[i];
      i++;
      k++;
    }

    while (j < n2) {
      mergeSortArr[k] = rightArr[j];
      j++;
      k++;
    }
  }
  
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: const Text('Question 10'),
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
                    <h3> Implement a sorting algorithm such as Bubble Sort, Insertion Sort, or Merge Sort to sort an array of numbers in ascending order. </h3>
                  ''',
                ),
              ),
              const SizedBox(height: 10),
              
              generateWidget.createTextFormField(numberController, 'Size', 'Enter size of array', (p0) => null, [FilteringTextInputFormatter.allow(RegExp("[0-9]"))], TextInputType.number),
              generateWidget.createSimpleButton('Generate number', () {
                arrDigit = [];

                generateAndSortNumber();
              }),

              const SizedBox(height: 10),

              generateWidget.createSimpleButton('Reference Link', () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const WebViewWidget(url: 'https://medium.com/yay-its-erica/algorithms-for-beginners-bubble-sort-insertion-sort-merge-sort-29bd5506cc48')),
                );
              }),

              const SizedBox(height: 50),

              const Text('Generated list of array:', style: TextStyle(fontSize: 15)),
              const SizedBox(height: 10),
              Text(arrDigit.toString(), style: const TextStyle(fontSize: 25)),
              const SizedBox(height: 10),

              const Text('Bubble Sort'),
              const SizedBox(height: 10),
              Text(bubbleSortArr.toString(), style: const TextStyle(fontSize: 25)),
              const SizedBox(height: 10),

              const Text('Insertion Sort'),
              const SizedBox(height: 10),
              Text(insertionSortArr.toString(), style: const TextStyle(fontSize: 25)),
              const SizedBox(height: 10),

              const Text('Merge Sort'),
              const SizedBox(height: 10),
              Text(mergeSortArr.toString(), style: const TextStyle(fontSize: 25)),
              const SizedBox(height: 10),

            ]
          ),
        ),
      ),
     );
  }
}