import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_app_lesson/main.dart';

void main() {
  testWidgets("Widgetlarni aniqlash", (widgetTester) async {
    await widgetTester.pumpWidget(const MainApp());

    expect(find.byType(Image), findsNWidgets(1));
    expect(find.text("Submit"), findsOneWidget);
    expect(find.byKey(const ValueKey('button')), findsOneWidget);
  });
}
