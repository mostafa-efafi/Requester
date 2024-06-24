/// read [https://docs.flutter.dev/testing/integration-tests]

import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:requester/core/utils/itegration_test_keys.dart';
import 'package:requester/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('App Test', () {
    testWidgets('integration test for Get request', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      final editText = find.byKey(IntegrationTestKeys.iEditTextKey);
      final sendButton = find.byKey(IntegrationTestKeys.iSendButtonKey);
      await tester.enterText(editText, 'https://reqres.in/api/users/2');
      await tester.pumpAndSettle();
      await tester.tap(sendButton);
      await tester.pumpAndSettle(/* const Duration(seconds: 3) */);
      expect(find.byKey(IntegrationTestKeys.iJsonViewKey), findsOneWidget);
    });
  });

}
