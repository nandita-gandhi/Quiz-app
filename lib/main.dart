import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionsIndex = 0;
  var _totalScore = 0;
  static const _questions = [
    {
      'questionText': 'What\'s your favorite color?',
      'answerText': [
        {'text': 'Blue', 'score': 2},
        {'text': 'Black', 'score': 20},
        {'text': 'Red', 'score': 5},
        {'text': 'Pink', 'score': 10}
      ]
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answerText': [
        {'text': 'Rabbit', 'score': 3},
        {'text': 'Elephant', 'score': 10},
        {'text': 'Tiger', 'score': 12},
        {'text': 'Lion', 'score': 5}
      ]
    },
    {
      'questionText': 'What\'s your favorite tourist place?',
      'answerText': [
        {'text': 'Uttarakhand', 'score': 5},
        {'text': 'Manali', 'score': 10},
        {'text': 'Goa', 'score': 15}
      ]
    }
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Quiz'),
        ),
        body: _questionsIndex < _questions.length
            ? Quiz(
                questions: _questions,
                questionsIndex: _questionsIndex,
                answerQuestions: _answerQuestion)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionsIndex = _questionsIndex + 1;
    });
  }

  void _resetQuiz() {
    setState(() {
      _questionsIndex = 0;
      _totalScore = 0;
    });
  }
}
