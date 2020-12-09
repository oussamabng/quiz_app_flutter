import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function restartQuiz;

  Result(this.resultScore, this.restartQuiz);

  String get resultPhase {
    if (resultScore <= 8) {
      return "You are awesome!";
    } else if (resultScore <= 12) {
      return "Pretty good!";
    } else if (resultScore <= 16) {
      return "You are strange!";
    } else {
      return "You are so bad!";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Text(
          resultPhase,
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
        ),
        FlatButton(
            onPressed: restartQuiz,
            textColor: Colors.blue,
            child: Text("Restart quiz!"))
      ],
    ));
  }
}
