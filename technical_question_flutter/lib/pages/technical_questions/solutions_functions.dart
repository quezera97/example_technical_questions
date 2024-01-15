import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SolutionsFunctions extends StatefulWidget {
  final String title;
  final List<String>? listOfImg;

  const SolutionsFunctions({super.key, required this.title, this.listOfImg});

  @override
  State<SolutionsFunctions> createState() => _SolutionsFunctionsState();
}

class _SolutionsFunctionsState extends State<SolutionsFunctions> {
  @override
  Widget build(BuildContext context) {
    String title = widget.title;
    final double height = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Solution for $title'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.5),
        child: CarouselSlider(
          options: CarouselOptions(
            enableInfiniteScroll: false,
            height: height,
            viewportFraction: 1.0,
            enlargeCenterPage: false,
            // autoPlay: false,
          ),
          items: widget.listOfImg!
              .map((item) => Center(
                      child: Image.asset(
                    item,
                    fit: BoxFit.contain,
                    height: height,
                  )))
              .toList(),
        ),
      ),
    );
  }
}
