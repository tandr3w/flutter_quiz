import 'package:flutter/material.dart';
import 'question.dart';
import 'answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  Quiz(
      {required this.questions,
      required this.answerQuestion,
      required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      // Layout widget which takes a list of widgets
      // Returns a column with the question and an answer button for each answer in the list.
      mainAxisAlignment:
          MainAxisAlignment.center, //Center Column contents vertically,
      crossAxisAlignment:
          CrossAxisAlignment.center, //Center Column contents horizontally,
      children: [
        Question(
          questions[questionIndex]['questionText'].toString(),
        ), // Show the question text
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(() => answerQuestion(answer['score']),
              (answer['text']) as String);
        }).toList()
        // Turns every answer into a custom Answer button widget with the text and a callback function that takes in the corresponding score, and converts it into a list.
      ],
    );
  }
}
