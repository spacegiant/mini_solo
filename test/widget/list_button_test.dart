import 'package:flutter/cupertino.dart';
import 'package:mini_solo/widgets/list_button.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('List Button Widget', (WidgetTester tester) async {
    await tester.pumpWidget(Directionality(
      textDirection: TextDirection.ltr,
      child: ListButton(label: const Text('label here'), onPressed: () {}),
    ));

    final titleFinder = find.text('label here');
    expect(titleFinder, findsOneWidget);
  });

  testWidgets('List Button Widget', (WidgetTester tester) async {
    bool isPressed = false;
    await tester.pumpWidget(Directionality(
      textDirection: TextDirection.ltr,
      child: ListButton(
          label: const Text('label here'),
          onPressed: () {
            isPressed = !isPressed;
          }),
    ));

    await tester.tap(find.byType(GestureDetector));
    expect(isPressed, isTrue);
  });
}
