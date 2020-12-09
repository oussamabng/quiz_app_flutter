import 'package:flutter/material.dart';
import 'result.dart';
import 'quiz.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      "questionText": "What\'s your favorite color?",
      "answers": [
        {"text": 'Black', "score": 10},
        {"text": "Red", "score": 3},
        {"text": "Orange", "score": 3},
        {"text": "White", "score": 1}
      ]
    },
    {
      "questionText": "What\ès your favorite animal?",
      "answers": [
        {"text": 'Snake', "score": 10},
        {"text": "Lion", "score": 3},
        {"text": "Cat", "score": 3},
        {"text": "Dog", "score": 1}
      ]
    },
    {
      "questionText": "What\ès your favorite language?",
      "answers": [
        {"text": 'Java', "score": 10},
        {"text": "Dart", "score": 3},
        {"text": "C", "score": 3},
        {"text": "Javascript", "score": 1}
      ]
    }
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {
    setState(() {
      _totalScore += score;
      _questionIndex = _questionIndex + 1;
    });
    if (_questionIndex < _questions.length) {
      print("more questions");
    } else
      print("no more");
  }

  void _restartQuiz() {
    setState(() {
      _totalScore = 0;
      _questionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('Quiz App'),
          ),
          body: _questionIndex < _questions.length
              ? Quiz(
                  questions: _questions,
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                )
              : Result(_totalScore, _restartQuiz)),
    );
  }
}
