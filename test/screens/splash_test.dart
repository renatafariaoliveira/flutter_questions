import 'package:flutter/material.dart';
import 'package:flutter_questions/screens/splash.dart';
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

  testWidgets('Splash Page Test', (WidgetTester tester) async {
    final Splash page = Splash();

    await tester.pumpWidget(makeTestableWidget(page));
    await tester.pumpAndSettle(const Duration(seconds: 1));

    expect(find.byType(Image), findsOneWidget);
  });
}
