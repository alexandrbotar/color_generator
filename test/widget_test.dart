import 'package:color_generator/random_color_page/random_color_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('MyWidget changes background color and text on tap',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: ColorPage()));

    final initialBackground =
        tester.widget<Scaffold>(find.byType(Scaffold)).backgroundColor;

    final textFinder = find.byType(Text);
    final initialText = tester.widget<Text>(textFinder).data;

    await tester.tap(find.byType(InkWell));
    await tester.pump();

    final newBackground =
        tester.widget<Scaffold>(find.byType(Scaffold)).backgroundColor;
    final newText = tester.widget<Text>(textFinder).data;

    expect(newBackground, isNot(equals(initialBackground)));
    expect(newText, isNot(equals(initialText)));
  });
}
