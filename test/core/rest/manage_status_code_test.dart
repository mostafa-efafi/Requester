import 'package:flutter_test/flutter_test.dart';
import 'package:requester/core/rest/manage_status_code.dart';

void main() {
  group('findError method', () {
    final manageStatusCode = ManageStatusCode();
    test('should subclass of HttpStatusCodeModel with sCode=400', () async {
      const matcher =
          HttpStatusCodeModel(statusCode: 400, description: 'Bad Request');
      // act
      final result = manageStatusCode.findError(sCode: 400);
      // assert
      expect(result, isA<HttpStatusCodeModel>());
      expect(result, matcher);
    });

    test('should subclass of HttpStatusCodeModel with sCode=305', () async {
      const matcher =
          HttpStatusCodeModel(statusCode: 305, description: 'Use Proxy');
      // act
      final result = manageStatusCode.findError(sCode: 305);
      // assert
      expect(result, isA<HttpStatusCodeModel>());
      expect(result, matcher);
    });

    test('should subclass of HttpStatusCodeModel with sCode=500', () async {
      const matcher = HttpStatusCodeModel(
          statusCode: 500, description: 'Internal Server Error');
      // act
      final result = manageStatusCode.findError();
      // assert
      expect(result, isA<HttpStatusCodeModel>());
      expect(result, matcher);
    });
  });
}
