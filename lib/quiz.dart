import 'package:flutter/material.dart';

import './answer.dart';
import './question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionsIndex;
  final Function answerQuestions;

  Quiz(
      {required this.questions,
      required this.questionsIndex,
      required this.answerQuestions});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questions[questionsIndex]['questionText'] as String,
        ),
        ...(questions[questionsIndex]['answerText']
                as List<Map<String, Object>>)
            .map((answer) {
          return Answer(() => answerQuestions(answer['score'] as int),
              answer['text'] as String);
        }).toList()
      ],
    );
  }
}
