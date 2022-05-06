import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:bounce_button/bounce_button.dart';

void main() async {
  testWidgets('bounce button test', (WidgetTester tester) async {
    List<String> log = [];
    await tester.pumpWidget(
      Bounce(
        key: const Key('bounce_button'),
        child: Container(
          height: 100,
          width: 100,
          color: Colors.red,
        ),
        onTap: () {
          log.add("tap");
        },
      ),
    );

    expect(find.byType(Bounce), findsOneWidget);
    final Offset center = tester.getCenter(find.byType(Bounce));
    await tester.tapAt(center);
    await tester.pumpAndSettle(const Duration(seconds: 1));
    expect(log.length, equals(1));
  });
}
