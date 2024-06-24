/// read [https://docs.flutter.dev/testing/integration-tests]

import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:requester/core/utils/itegration_test_keys.dart';
import 'package:requester/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('App test', () {
    const postBody = '''{
    "name": "morpheus",
    "job": "leader"
}''';
    testWidgets('integration test for Post request', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      /// all widgets
      final editText = find.byKey(IntegrationTestKeys.iEditTextKey);
      final sendButton = find.byKey(IntegrationTestKeys.iSendButtonKey);
      final postBodyEditText =
          find.byKey(IntegrationTestKeys.iPostBodyEditTextKey);

      /// enter url to editText
      await tester.enterText(editText, 'https://reqres.in/api/users');

      /// select post [Tab]
      await tester.tap(find.text('Post'));
      await tester.pumpAndSettle();

      /// enter post body to [editText]
      await tester.enterText(postBodyEditText, postBody);
      await tester.pumpAndSettle();

      /// tap to [Send] [button]
      await tester.tap(sendButton);
      await tester.pumpAndSettle(/* const Duration(seconds: 3) */);

      /// expect
      expect(find.byKey(IntegrationTestKeys.iJsonViewKey), findsOneWidget);
    });
  });
}
