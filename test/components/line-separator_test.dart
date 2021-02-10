import 'package:flutter/material.dart';
import 'package:flutter_questions/components/line-separator.dart';
import 'package:flutter_test/flutter_test.dart';

MaterialApp componentTest(LineSeparator component) {
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
  testWidgets('LineSeparator test', (WidgetTester tester) async {
    final LineSeparator component = LineSeparator(keyElement: 'TestLineKey');

    await tester.pumpWidget(componentTest(component));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('TestLineKey')), findsOneWidget);
  });
}
