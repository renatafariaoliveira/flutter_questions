import 'package:flutter/material.dart';
import 'package:flutter_questions/components/questions-list.dart';
import 'package:flutter_questions/components/result.dart';

class Quiz extends StatefulWidget {
  Quiz({@required this.questionsList});
  final List<Map<String, Object>> questionsList;

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int _answerSelected = 0;
  int _personalScore = 0;

  void _answer(int score) {
    setState(() {
      _answerSelected++;
      _personalScore += score;
    });
  }

  bool get _questionExists {
    return _answerSelected < widget.questionsList.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _questionExists
          ? QuestionsList(
              answer: _answer,
              answerSelected: _answerSelected,
              questions: widget.questionsList,
            )
          : Result(
              total: widget.questionsList.length,
              score: _personalScore,
            ),
    );
  }
}
