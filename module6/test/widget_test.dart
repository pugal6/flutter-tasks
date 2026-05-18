import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:module6/render object task/green_box.dart';

void main() {
  testWidgets('GreenBox renders correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: GreenBox(),
        ),
      ),
    );

    expect(find.byType(GreenBox), findsOneWidget);
  });
}