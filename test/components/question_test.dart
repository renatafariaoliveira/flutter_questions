import 'package:flutter/material.dart';
import 'package:flutter_questions/components/question.dart';
import 'package:flutter_test/flutter_test.dart';

MaterialApp componentTest(Question component) {
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
  testWidgets('Question test', (WidgetTester tester) async {
    final Question component = Question(
      keyElement: 'TestQuestionKey',
      text: 'Custom Question Test',
      align: TextAlign.center,
    );

    await tester.pumpWidget(componentTest(component));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('TestQuestionKey')), findsOneWidget);
    expect(find.text('Custom Question Test'), findsOneWidget);
  });
}
