import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:requester/features/feature_requester/data/models/request_response_model.dart';

void main() {
  group('RequestReponseModel.fromResponse', () {
    final tResponse = Response(
        data: {'data': 'result'},
        statusCode: 201,
        statusMessage: 'created',
        requestOptions: RequestOptions(
            sendTimeout: const Duration(seconds: 1),
            responseType: ResponseType.json));
    const matcher = RequestReponseModel(
        data: "{data: result}",
        statusCode: 201,
        statusMessage: 'created',
        sendTime: Duration(seconds: 1),
        resultType: ResponseType.json);
    test('should return subclass of RequestReponseModel', () async {
      // act
      final result = RequestReponseModel.fromResponse(tResponse);
      // assert
      expect(result, isA<RequestReponseModel>());
      expect(result, matcher);
    });
  });
}
