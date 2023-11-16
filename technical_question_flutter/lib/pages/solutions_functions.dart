import 'package:flutter/material.dart';

class SolutionsFunctions extends StatefulWidget {
  final String title;

  const SolutionsFunctions({
    super.key,
    required this.title
  });

  @override
  State<SolutionsFunctions> createState() => _SolutionsFunctionsState();
}

class _SolutionsFunctionsState extends State<SolutionsFunctions> {
  @override
  Widget build(BuildContext context) {
    String title = widget.title;

    return Scaffold(
      appBar: AppBar(
        title: Text('Solution for $title'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.5),
        child: SingleChildScrollView(
          child: Column(
            children: [
            ]
          ),
        ),
      ),
    );
  }
}