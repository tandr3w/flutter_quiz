import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback selectHandler;
  final String answerText;

  Answer(this.selectHandler, this.answerText);
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.75,
      child: Container(
          margin: EdgeInsets.all(5),
          // width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Colors.green),
            onPressed: selectHandler,
            child: Text(answerText),
          )),
    );
  }
}
// Custom widget
// Styles text and wraps around a container
// Splitting widgets into different files makes it cleaner.
