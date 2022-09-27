import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final int totalPossibleScore;
  VoidCallback resetQuiz;
  Result(this.resultScore, this.totalPossibleScore, this.resetQuiz);
  String get resultPhrase {
    if (resultScore == 0) {
      return 'You suck.';
    }
    if (resultScore == totalPossibleScore) {
      return 'Wow, Congrats!';
    }
    return 'You Finished!';
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment:
            MainAxisAlignment.center, //Center Column contents vertically,
        crossAxisAlignment:
            CrossAxisAlignment.center, //Center Column contents horizontally,
        children: [
          Text(
            "$resultPhrase Score is $resultScore / $totalPossibleScore",
            style: TextStyle(fontSize: 36),
            textAlign: TextAlign.center,
          ),
          TextButton(
            child: Text('Retry Quiz!'),
            onPressed: resetQuiz,
          ),
        ],
      ),
    );
  }
}
