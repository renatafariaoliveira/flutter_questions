import 'package:flutter/material.dart';
import 'package:flutter_questions/components/button.dart';
import 'package:flutter_questions/components/question.dart';
import 'package:flutter_questions/components/result.dart';
import 'package:flutter_questions/screens/quiz.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  Widget makeTestableWidget(Widget child) {
    return MaterialApp(
      home: Material(
        child: Builder(builder: (BuildContext context) {
          return child;
        }),
      ),
    );
  }

  group('Quiz group', () {
    testWidgets('Quiz Page with Questions Test', (WidgetTester tester) async {
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

      final Quiz page = Quiz(questionsList: listQuiz);
      await tester.pumpWidget(makeTestableWidget(page));
      expect(find.byType(Question), findsOneWidget);
    });

    testWidgets('Quiz Page with Result Test', (WidgetTester tester) async {
      final List<Map<String, Object>> listQuiz = [];

      final Quiz page = Quiz(questionsList: listQuiz);
      await tester.pumpWidget(makeTestableWidget(page));
      expect(find.byType(Result), findsOneWidget);
    });

    testWidgets('Quiz Page with Questions and tap button Test', (WidgetTester tester) async {
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

      final Quiz page = Quiz(questionsList: listQuiz);
      await tester.pumpWidget(makeTestableWidget(page));
      expect(find.byType(Question), findsOneWidget);
      expect(find.byType(CustomButton), findsNWidgets(4));
      await tester.tap(_questionButton);
    });
  });
}
