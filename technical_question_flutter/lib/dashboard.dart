import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import 'pages/intermission.dart';
import 'pages/question5.dart';
import 'pages/question_1.dart';
import 'pages/question_2.dart';
import 'pages/question_3.dart';
import 'pages/question_4.dart';
import 'widget/reuse_widget.dart';

class MyInAppBrowser extends InAppBrowser {
  @override
  Future onBrowserCreated() async {
    print("InAppBrowser Created");
  }

  @override
  Future onLoadStart(url) async {
    print("Loading $url");
  }

  @override
  Future onLoadStop(url) async {
    print("Finished loading $url");
  }
}

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final generateWidget = GenerateWidget();
  InAppWebViewController? webView;  

  Future<void> loadHTMLFromAssets() async {
  await webView?.loadFile(
    assetFilePath: "assets/question_5/question_5.html",
  );
} 

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Technical Questions'),
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.5),
              child: GridView.count(
                childAspectRatio: 3.0,
                crossAxisCount: 2,
                children: [
                  generateWidget.createSimpleButton('Question 1', () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Question1()),
                    );
                  }),
                  generateWidget.createSimpleButton('Question 2', () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Question2()),
                    );
                  }),
                  generateWidget.createSimpleButton('Question 3', () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Question3()),
                    );
                  }),
                  generateWidget.createSimpleButton('Question 4', () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Question4()),
                    );
                  }),
                  generateWidget.createSimpleButton('Question 5', () async {
                    
                   Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => IntermissionQuestion5()),
                    );
                  }),
                ].map((button) {
                  return GridTile(
                    child: SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: button,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
