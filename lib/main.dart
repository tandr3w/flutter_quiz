import 'package:flutter/material.dart';
import 'src/quiz.dart';
import 'src/result.dart';

void main() {
  runApp(
      MyApp()); // Draws the widget tree, takes in the "core" widget and calls the build method.
}

class MyApp extends StatefulWidget {
  // Inherit default stateful/stateless widget class from material.dart
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  // You need 2 classes to make a stateful widget.
  // Adding a leading underscore makes private, and only usable inside the same file.

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex += 1;
    }); // You have to wrap the state change in the setState function.
  }

  final _questions = const [
    {
      'questionText': 'What is 1+1?',
      'answers': [
        {'text': '2', 'score': 1},
        {'text': 'Windows', 'score': 0},
        {'text': '11', 'score': 0},
        {'text': 'I don\'t know', 'score': 0},
      ]
    },
    {
      'questionText': '4x / 2 + 3 = 14; x = ?',
      'answers': [
        {'text': '7/13', 'score': 0},
        {'text': '10', 'score': 0},
        {'text': '11/2', 'score': 1},
        {'text': '17/4', 'score': 0},
        {'text': 'I don\'t know :(', 'score': 0},
      ]
    },
    {
      'questionText': '(x^3 / 12) = (89 / 5); x = ?',
      'answers': [
        {'text': 'sqrt(1068/5)', 'score': 0},
        {'text': '1068/5', 'score': 0},
        {'text': '(1068/5)^1/3', 'score': 1},
        {'text': '(1068/5)^3', 'score': 0},
        {'text': '????', 'score': 0},
      ]
    },
    {
      'questionText': '34 * 3^x = 983; x = ?',
      'answers': [
        {'text': '(983/34)^1/3', 'score': 0},
        {'text': 'log(983/34)/log(3)', 'score': 1},
        {'text': 'ln(983/34)*3', 'score': 0},
        {'text': 'sqrt(983/34)', 'score': 0},
        {'text': 'How am I supposed to do this?', 'score': 0},
      ]
    },
    {
      'questionText': '(4^(2x-3))(16) = 64^(x-5); x = ?',
      'answers': [
        {'text': '13', 'score': 0},
        {'text': '14', 'score': 1},
        {'text': '15', 'score': 0},
        {'text': '16', 'score': 0},
        {'text': '17', 'score': 0},
        {'text': 'What the heck?', 'score': 0},
      ]
    },
  ];

  var _questionIndex = 0; // using var is better practice than int
  var _totalScore = 0;
  bool _start = false;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
      _start = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Flutter will take care of context (some metadata) for you, you just need to accept it.
    // Build method of StatelessWidget that takes in a BuildContext type and returns a widget.
    // Called when drawing things on the screen.
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: const Text("The Best Quiz Ever! By Andrew"),
              centerTitle: true,
            ),
            body: _start
                ? _questionIndex < _questions.length
                    ? Quiz(
                        answerQuestion: _answerQuestion,
                        questionIndex: _questionIndex,
                        questions: _questions,
                      )
                    : Result(_totalScore, _questions.length, _resetQuiz)
                : Container(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Welcome To The Best Quiz Ever!",
                            style: TextStyle(fontSize: 36)),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                _start = true;
                              });
                            },
                            child: Text(
                              'Start Quiz',
                            ))
                      ],
                    )))); // Returns default widget with base setup.
    // Scaffold creates a base page design.
    // Text() converts plain text into a widget.
  }
}


// Layout and control widgets are invisible but give your app structure and control.