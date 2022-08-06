import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final VoidCallback resetHandler;

  Result(this.score, this.resetHandler);

  String get resultPhrase {
    String resultText;
    if (score <= 10) {
      resultText = "You are innovative!";
    } else if (score <= 20) {
      resultText = "You are pretty likeable!";
    } else if (score <= 40) {
      resultText = "You are strange?!";
    } else {
      resultText = "You are less positive!";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          TextButton(
            onPressed: resetHandler,
            child: Text(
              'Reset Quiz!',
              style: TextStyle(color: Colors.deepPurple),
            ),
          )
        ],
      ),
    );
  }
}
