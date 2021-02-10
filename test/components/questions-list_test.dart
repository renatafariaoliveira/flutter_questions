import 'package:flutter/material.dart';
import 'package:flutter_questions/components/button.dart';
import 'package:flutter_questions/components/questions-list.dart';
import 'package:flutter_test/flutter_test.dart';

MaterialApp componentTest(QuestionsList component) {
  return MaterialApp(
    home: Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          component,
        ],
      ),
    ),
  );
}

void main() {
  group('QuestionList group', () {
    testWidgets('QuestionList test', (WidgetTester tester) async {
      final List<Map<String, Object>> listQuiz = [
        {
          'question': 'Question 01?',
          'answers': [
            {'answer': 'A', 'score': 0, 'color': Colors.lightGreen[900]},
            {'answer': 'B', 'score': 1, 'color': Colors.red[900]},
            {'answer': 'C', 'score': 0, 'color': Colors.yellow[900]},
            {'answer': 'D', 'score': 0, 'color': Colors.teal[700]},
          ],
        },
        {
          'question': 'Question 02?',
          'answers': [
            {'answer': 'A', 'score': 0, 'color': Colors.lightGreen[900]},
            {'answer': 'B', 'score': 0, 'color': Colors.red[900]},
            {'answer': 'C', 'score': 1, 'color': Colors.yellow[900]},
            {'answer': 'D', 'score': 0, 'color': Colors.teal[700]},
          ],
        },
      ];

      final QuestionsList component = QuestionsList(
        questions: listQuiz,
        answerSelected: 0,
        answer: (_) => print('QuestionsList Test: answer!'),
        keyElement: 'TestQuestionsListKey',
      );

      await tester.pumpWidget(componentTest(component));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('TestQuestionsListKey')), findsOneWidget);
    });

    testWidgets('QuestionList - Tap Question Button Test', (WidgetTester tester) async {
      final Finder _questionButton = find.text('ABC');

      final List<Map<String, Object>> listQuiz = [
        {
          'question': 'Question 01?',
          'answers': [
            {'answer': 'ABC', 'score': 0, 'color': Colors.lightGreen[900]},
            {'answer': 'DEF', 'score': 1, 'color': Colors.red[900]},
            {'answer': 'GHE', 'score': 0, 'color': Colors.yellow[900]},
            {'answer': 'IJK', 'score': 0, 'color': Colors.teal[700]},
          ],
        },
        {
          'question': 'Question 02?',
          'answers': [
            {'answer': '123', 'score': 0, 'color': Colors.lightGreen[900]},
            {'answer': '456', 'score': 0, 'color': Colors.red[900]},
            {'answer': '789', 'score': 1, 'color': Colors.yellow[900]},
            {'answer': '000', 'score': 0, 'color': Colors.teal[700]},
          ],
        },
      ];

      final QuestionsList component = QuestionsList(
        questions: listQuiz,
        answerSelected: 0,
        answer: (_) => print('QuestionsList Test: answer!'),
        keyElement: 'TestQuestionsListKey',
      );

      await tester.pumpWidget(componentTest(component));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('TestQuestionsListKey')), findsOneWidget);

      expect(find.byType(CustomButton), findsNWidgets(4));
      await tester.tap(_questionButton);
    });
  });
}
