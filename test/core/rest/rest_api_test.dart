import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:requester/core/resource/data_state.dart';
import 'package:requester/core/rest/network_checker.dart';
import 'package:requester/core/rest/rest_api.dart';
import 'package:requester/core/utils/constants.dart';

import 'rest_api_test.mocks.dart';

@GenerateMocks([NetworkChecker, Dio])
MockNetworkChecker mockNetworkChecker = MockNetworkChecker();

void main() {
  final restApi = RestApi(mockNetworkChecker);
  group('makeAlerts method', () {
    test('should be return true message', () async {
      final tResponse = Response(
          requestOptions: RequestOptions(),
          statusCode: 500,
          data: {'data': 'test'});
      const matcher = 'error 500 : Internal Server Error\n{data: test}';
      // act
      final result = restApi.makeAlerts(response: tResponse);
      // assert
      expect(result, matcher);
    });
  });

  group('_postRequest method', () {
  test('should be post body and get response', () async {
    const tUrl = 'https://reqres.in/api/users';
    const tPostBody = {"name": "morpheus", "job": "leader"};
    final tRespons = DataSuccess(Response(
        requestOptions: RequestOptions(),
        statusCode: 201,
        data: {"id": "233", "createdAt": "2023-02-16T11:04:27.573Z"}));
    when(mockNetworkChecker.checkConnection()).thenAnswer((_) async => true);
    // act
    final result = await restApi.request(tUrl,
        requestType: RequestType.postRequest, body: tPostBody);
    // assert
    expect(result, isA<DataSuccess>());
    expect(result.data!.statusCode, tRespons.data!.statusCode);
  });

    test('should be post body with wrong url and return dataFaild', () async {
      const tUrl = 'https://WRONG_URL';
      const tPostBody = {"name": "morpheus", "job": "leader"};
      when(mockNetworkChecker.checkConnection()).thenAnswer((_) async => false);
      // act
      final result = await restApi.request(tUrl,
          requestType: RequestType.postRequest, body: tPostBody);
      // assert
      expect(result, isA<DataFailed>());
      expect(result.error, Constants.noConnectToNetwork);
    });
  });

  group('_getRequest method', () {
    test('should be getand return response', () async {
      const tUrl = 'https://reqres.in/api/unknown/2';
      final tRespons = DataSuccess(
          Response(requestOptions: RequestOptions(), statusCode: 200, data: {
        "data": {
          "id": 2,
          "name": "fuchsia rose",
          "year": 2001,
          "color": "#C74375",
          "pantone_value": "17-2031"
        },
        "support": {
          "url": "https://reqres.in/#support-heading",
          "text":
              "To keep ReqRes free, contributions towards server costs are appreciated!"
        }
      }));
      when(mockNetworkChecker.checkConnection()).thenAnswer((_) async => true);
      // act
      final result = await restApi.request(
        tUrl,
        requestType: RequestType.getRequest,
      );
      // assert
      expect(result, isA<DataSuccess>());
      expect(result.data!.statusCode, tRespons.data!.statusCode);
    });

    test('should be get with wrong url and return dataFaild', () async {
      const tUrl = 'https://WRONG_URL';
      when(mockNetworkChecker.checkConnection()).thenAnswer((_) async => false);
      // act
      final result = await restApi.request(
        tUrl,
        requestType: RequestType.getRequest,
      );
      // assert
      expect(result, isA<DataFailed>());
      expect(result.error, Constants.noConnectToNetwork);
    });
  });
}
