import 'package:flutter/material.dart';
import 'package:flutter_questions/components/button.dart';
import 'package:flutter_test/flutter_test.dart';

MaterialApp componentTest(CustomButton component) {
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
  testWidgets('CustomButton test', (WidgetTester tester) async {
    final CustomButton component = CustomButton(
      keyElement: 'TestButtonKey',
      text: 'Custom Button Test',
      color: Colors.green,
      onPressed: () => print('Custom Button Test: onPressed!'),
    );

    await tester.pumpWidget(componentTest(component));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('TestButtonKey')), findsOneWidget);
    expect(find.text('Custom Button Test'), findsOneWidget);
  });
}
