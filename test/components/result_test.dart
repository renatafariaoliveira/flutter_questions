import 'package:flutter/material.dart';
import 'package:flutter_questions/components/button.dart';
import 'package:flutter_questions/components/result.dart';
import 'package:flutter_test/flutter_test.dart';

MaterialApp componentTest(Result component) {
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
  group('Result group', () {
    testWidgets('Result with Congrats test', (WidgetTester tester) async {
      final Result component = Result(
        keyElement: 'TestResultKey',
        total: 10,
        score: 9,
      );

      await tester.pumpWidget(componentTest(component));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('TestResultKey')), findsOneWidget);
      expect(find.text('Congrats!'), findsOneWidget);
      expect(find.text('Finished!\nYou scored 9 out of 10.'), findsOneWidget);
    });

    testWidgets('Result without Congrats test', (WidgetTester tester) async {
      final Result component = Result(
        keyElement: 'TestResultKey',
        total: 10,
        score: 3,
      );

      await tester.pumpWidget(componentTest(component));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('TestResultKey')), findsOneWidget);
      expect(find.text('Congrats!'), findsNothing);
      expect(find.text('Finished!\nYou scored 3 out of 10.'), findsOneWidget);
    });

    testWidgets('Result with Congrats and tap button test', (WidgetTester tester) async {
      final Result component = Result(
        keyElement: 'TestResultKey',
        total: 10,
        score: 10,
      );
      final Finder _playAgainButton = find.text('Play Again');

      await tester.pumpWidget(componentTest(component));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('TestResultKey')), findsOneWidget);
      expect(find.text('Congrats!'), findsOneWidget);
      expect(find.text('Finished!\nYou scored 10 out of 10.'), findsOneWidget);
      expect(find.byType(CustomButton), findsOneWidget);
      await tester.tap(_playAgainButton);
    });
  });
}
