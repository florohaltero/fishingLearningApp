import 'package:angelschein_lernen/feature/counter/counter_controller.dart';
import 'package:angelschein_lernen/feature/counter/counter_model.dart';
import 'package:angelschein_lernen/feature/counter/counter_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('App', () {
    final model = CounterModel(count: 2);
    final controller = CounterControllerImplementation()..model = model;
    testWidgets('renders Counter', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: CounterView(controller: controller),
        ),
      );
      expect(
        find.byType(CounterView),
        findsOneWidget,
      );
    });
  });
}
