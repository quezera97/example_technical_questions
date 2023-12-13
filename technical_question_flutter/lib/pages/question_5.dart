import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import '../widget/reuse_widget.dart';

// ignore: must_be_immutable
class Question5 extends StatelessWidget {
  Question5({super.key});

  InAppWebViewController? _webViewController;

  Future<void> _loadHTMLFromAssets() async {
    try {
      await _webViewController?.loadFile(
        //get html file from assets to initially load it first (takes time)
        assetFilePath: "assets/question_5.html",
      );
    } catch (e) {
      print("Error loading HTML file: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final generateWidget = GenerateWidget();
    
    return Scaffold(
        appBar: AppBar(
          title: const Text('Question 5'),
          backgroundColor: generateWidget.excludeWhiteColor(),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: InAppWebView(
            initialUrlRequest: URLRequest(
              //because of using url from assets, so change it to blank url while waiting the assets to load
              url: Uri.parse("about:blank"),
            ),
            onWebViewCreated: (controller) {
              //when the launch url request, webview created
              //(while take to load initial url, load html file from asset)
              _webViewController = controller;
              _loadHTMLFromAssets();
            },
          ),
        ));
  }
}
