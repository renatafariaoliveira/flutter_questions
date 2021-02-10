import 'package:flutter/material.dart';
import 'package:flutter_questions/components/button.dart';
import 'package:flutter_questions/components/question.dart';
import 'package:flutter_questions/screens/home.dart';
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
    testWidgets('Home Page Test', (WidgetTester tester) async {
      final Home page = Home();

      await tester.pumpWidget(makeTestableWidget(page));

      expect(find.byType(Question), findsOneWidget);
      expect(find.byType(Image), findsOneWidget);
      expect(find.byType(CustomButton), findsNWidgets(2));
    });

    testWidgets('Home Page - Tap Disney Button Test', (WidgetTester tester) async {
      final Home page = Home();

      await tester.pumpWidget(makeTestableWidget(page));
      final Finder _disneyButton = find.text('Disney');

      expect(find.byType(CustomButton), findsNWidgets(2));
      await tester.tap(_disneyButton);
    });

    testWidgets('Home Page - Tap Animals Button Test', (WidgetTester tester) async {
      final Home page = Home();

      await tester.pumpWidget(makeTestableWidget(page));
      final Finder _animalButton = find.text('Animals');

      expect(find.byType(CustomButton), findsNWidgets(2));
      await tester.tap(_animalButton);
    });
  });
}
