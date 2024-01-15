import 'dart:math';

import 'package:flutter/material.dart';

import '../constant.dart';
import '../model/questions_model.dart';
import '../pages/technical_questions/question_1.dart';
import '../pages/technical_questions/question_2.dart';
import '../pages/technical_questions/question_3.dart';
import '../pages/technical_questions/question_4.dart';
import '../pages/technical_questions/question_5.dart';
import '../pages/technical_questions/question_6.dart';
import '../pages/technical_questions/question_7.dart';
import '../pages/technical_questions/question_8.dart';
import '../pages/technical_questions/question_9.dart';
import '../pages/technical_questions/question_10.dart';
import '../pages/technical_questions/question_11.dart';
import '../pages/technical_questions/question_12.dart';
import '../pages/technical_questions/question_13.dart';
import '../pages/technical_questions/question_14.dart';
import '../pages/technical_questions/question_15.dart';
import 'random_color.dart';
import 'random_icon.dart';


class TechnicalQuestionsGrid extends StatefulWidget {
  const TechnicalQuestionsGrid({Key? key}) : super(key: key);

  @override
  State<TechnicalQuestionsGrid> createState() => _TechnicalQuestionsGridState();
}

class _TechnicalQuestionsGridState extends State<TechnicalQuestionsGrid> {

  Random random = Random();
  List<int> question = List<int>.generate(16, (index) => index + 1);
  List<int> usedIndices = [];

  int getRandomNumber() {
    if (usedIndices.length >= question.length) {
      usedIndices.clear();
    }

    int index;
    do {
      index = random.nextInt(question.length);
    } 
    while (usedIndices.contains(index));

    usedIndices.add(index);
    return question[index];
  }

  List<QuestionsModel> generateQuestions(BuildContext context) {
    return List.generate(5, (index) {
    int randomNum = getRandomNumber();
    Widget destinationWidget;

    switch (randomNum) {
      case 1:
        destinationWidget = const Question1();
        break;
      case 2:
        destinationWidget = const Question2();
        break;
      case 3:
        destinationWidget = const Question3();
        break;
      case 4:
        destinationWidget = const Question4();
        break;
      case 5:
        destinationWidget = Question5();
        break;
      case 6:
        destinationWidget = const Question6();
        break;
      case 7:
        destinationWidget = const Question7();
        break;
      case 8:
        destinationWidget = const Question8();
        break;
      case 9:
        destinationWidget = const Question9();
        break;
      case 10:
        destinationWidget = const Question10();
        break;
      case 11:
        destinationWidget = const Question11();
        break;
      case 12:
        destinationWidget = const Question12();
        break;
      case 13:
        destinationWidget = const Question13();
        break;
      case 14:
        destinationWidget = const Question14();
        break;
      default:
        destinationWidget = const Question15();
    }

      return QuestionsModel(
        heading: "Question $randomNum",
        subHeading: "",
        color: getRandomColor(),
        icon: Icon(
          getRandomIcon(),
          color: iconColor,
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => destinationWidget),
          );
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    List<QuestionsModel> questions = generateQuestions(context);

    return GridView.builder(
        itemCount: questions.length,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 16 / 4, crossAxisCount: 1, mainAxisSpacing: 20),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: questions[index].onTap,
            child: Container(
              decoration: BoxDecoration(
                  color: const Color(0xffF7F7F7),
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: questions[index].color,
                              borderRadius: BorderRadius.circular(10)),
                          height: 55,
                          width: 55,
                          child: questions[index].icon,
                        )
                      ],
                    ),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          questions[index].heading,
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width * 0.035,
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.ellipsis),
                        ),
                        // Text(
                        //   questions[index].subHeading,
                        //   style: TextStyle(
                        //     color: Colors.grey,
                        //     fontSize: MediaQuery.of(context).size.width * 0.03,
                        //   ),
                        // )
                      ],
                    ),
                    const Spacer(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.more_vert,
                          color: Colors.grey,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}