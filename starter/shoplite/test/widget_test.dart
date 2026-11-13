import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shoplite/main.dart';

void main() {
  testWidgets('ShopLite cart counter test', (tester) async {
    await tester.pumpWidget(const ShopLiteApp());

    expect(find.text('Сагсанд байгаа бараа:'), findsOneWidget);
    expect(find.text('0'), findsOneWidget);

    final addButton = find.byIcon(Icons.add);
    final removeButton = find.byIcon(Icons.remove);
    final resetButton = find.byIcon(Icons.refresh);

    await tester.tap(addButton);
    await tester.pump();

    expect(find.text('1'), findsOneWidget);

    await tester.tap(removeButton);
    await tester.pump();

    expect(find.text('0'), findsOneWidget);

    await tester.tap(removeButton);
    await tester.pump();

    expect(find.text('0'), findsOneWidget);

    for (int i = 0; i < 10; i++) {
      await tester.tap(addButton);
      await tester.pump();
    }

    expect(find.text('10'), findsOneWidget);

    expect(
      find.text('Нэг удаад 10-аас олон бараа захиалах боломжгүй'),
      findsOneWidget,
    );

    final addFab = tester.widget<FloatingActionButton>(
      find.ancestor(of: addButton, matching: find.byType(FloatingActionButton)),
    );

    expect(addFab.onPressed, isNull);

    await tester.tap(resetButton);
    await tester.pump();

    expect(find.text('0'), findsOneWidget);
  });
}
