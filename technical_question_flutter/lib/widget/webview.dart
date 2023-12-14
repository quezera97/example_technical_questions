import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:technical_question/widget/reuse_widget.dart';

class WebViewWidget extends StatefulWidget {
  const WebViewWidget({super.key, required this.url});

  final String url;

  @override
  State<WebViewWidget> createState() => _WebViewWidgetState();
}

class _WebViewWidgetState extends State<WebViewWidget> {
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
            url: Uri.parse(widget.url),
          ),          
        ),
      )
    );
  }
}