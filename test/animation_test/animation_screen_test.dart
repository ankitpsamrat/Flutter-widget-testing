import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testing/animation_test/animation_screen.dart';

void main() {
  testWidgets('Animation screen widget test.', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: AnimationScreen(),
      ),
    );

    // check container
    expect(find.byType(Container), findsOneWidget);

    // check initial container properties
    var container = tester.widget<Container>(find.byType(Container));

    expect(container.constraints!.minWidth, 50);
    expect(container.constraints!.minHeight, 50);
    expect((container.decoration as BoxDecoration).color, Colors.blue);
    expect((container.decoration as BoxDecoration).borderRadius,
        BorderRadius.zero);

    // check animated container properties
    await tester.pumpAndSettle();
    container = tester.widget<Container>(find.byType(Container));

    expect(container.constraints!.minWidth, 200);
    expect(container.constraints!.minHeight, 200);
    expect((container.decoration as BoxDecoration).color, Colors.green);
    expect((container.decoration as BoxDecoration).borderRadius,
        BorderRadius.circular(50));
  });
}
