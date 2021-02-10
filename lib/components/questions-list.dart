import 'package:flutter/material.dart';
import 'package:flutter_questions/components/button.dart';
import 'package:flutter_questions/components/questions-progress.dart';
import 'package:flutter_questions/components/question.dart';

class QuestionsList extends StatelessWidget {
  QuestionsList({@required this.questions, @required this.answerSelected, @required this.answer, this.keyElement});

  final List<Map<String, Object>> questions;
  final int answerSelected;
  final Function(int) answer;
  final String keyElement;

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> _answers = questions[answerSelected]['answers'];
    List<Widget> _widgetsAsnwers = _answers
        .map(
          (textAnswer) => CustomButton(
            text: textAnswer['answer'],
            onPressed: () => answer(textAnswer['score']),
            color: textAnswer['color'],
          ),
        )
        .toList();

    return Container(
      key: Key(keyElement),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Progress(
            actual: answerSelected + 1,
            total: questions.length,
          ),
          Question(
            text: questions[answerSelected]['question'],
          ),
          ..._widgetsAsnwers,
        ],
      ),
    );
  }
}
