import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testing/home_page.dart';

void main() {
  testWidgets(
      'given counter is 0 when increment button is clicked then counter should be 1',
      (tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: HomePage()),
    );

    final ctr = find.text('0');
    expect(ctr, findsOneWidget);

    // for single widget
    // final incrementBtn = find.byType(FloatingActionButton);

    // for multiple widget then use keys
    final incrementBtn = find.byKey(const Key('increment'));

    await tester.tap(incrementBtn);
    await tester.pump();

    final ctr2 = find.text('1');
    expect(ctr2, findsOneWidget);
  });
}
