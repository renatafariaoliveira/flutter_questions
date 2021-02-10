import 'package:flutter/material.dart';
import 'package:flutter_questions/components/questions-progress.dart';
import 'package:flutter_test/flutter_test.dart';

MaterialApp componentTest(Progress component) {
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
  testWidgets('Questions Progress test', (WidgetTester tester) async {
    final Progress component = Progress(
      keyElement: 'TestProgressKey',
      total: 10,
      actual: 5,
    );

    await tester.pumpWidget(componentTest(component));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('TestProgressKey')), findsOneWidget);
    expect(find.text('Question 5'), findsOneWidget);
    expect(find.text('/10'), findsOneWidget);
  });
}
