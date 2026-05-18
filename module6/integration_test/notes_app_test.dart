import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:module6/test%20task/notes.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Notes App Integration Test', () {
    testWidgets('add note and verify it appears',
        (WidgetTester tester) async {
      await tester.pumpWidget(const NotesPage());

      // Enter note
      await tester.enterText(
        find.byKey(const Key('noteField')),
        'Buy groceries',
      );

      // Tap add button
      await tester.tap(find.byKey(const Key('addButton')));

      // Rebuild UI
      await tester.pump();

      // Verify note appears
      expect(find.text('Buy groceries'), findsOneWidget);
    });
  });
}