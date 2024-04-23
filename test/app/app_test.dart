import 'package:angelschein_lernen/app/app.dart';
import 'package:angelschein_lernen/feature/main/main_view.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(MainView), findsOneWidget);
    });
  });
}
