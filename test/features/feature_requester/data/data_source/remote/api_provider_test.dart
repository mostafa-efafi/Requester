import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:requester/core/resource/data_state.dart';
import 'package:requester/core/rest/rest_api.dart';
import 'package:requester/features/feature_requester/data/data_source/remote/api_provider.dart';

import 'api_provider_test.mocks.dart';

@GenerateMocks([RestApi])
void main() {
  MockRestApi mockRestApi = MockRestApi();
  ApiProvider apiProvider = ApiProvider(mockRestApi);
  const url = 'http://ubuntu.com';
  group('getMethod', () {
    final tResponse = DataSuccess(Response(requestOptions: RequestOptions()));
    const errorMsg = 'error';
    test('should be return dataSuccess', () async {
      // arrange
      when(mockRestApi.request(any, requestType: RequestType.getRequest))
          .thenAnswer((_) async => tResponse);
      // act
      final result = await apiProvider.getMethod(url);
      // assert
      expect(result, isA<DataSuccess>());
      verify(
        mockRestApi.request(any, requestType: RequestType.getRequest),
      ).called(1);
    });

    test('should be return dataFailed', () async {
      // arrange
      when(mockRestApi.request(any, requestType: RequestType.getRequest))
          .thenAnswer((_) async => const DataFailed(errorMsg));
      // act
      final result = await apiProvider.getMethod(url);
      // assert
      expect(result, isA<DataFailed>());
      expect(result.error, errorMsg);
      verify(
        mockRestApi.request(any, requestType: RequestType.getRequest),
      ).called(1);
    });
  });

  group('postMethod', () {
    final tResponse = DataSuccess(Response(requestOptions: RequestOptions()));
    const errorMsg = 'error';
    test('should be return dataSuccess', () async {
      // arrange
      when(mockRestApi.request(any, requestType: RequestType.postRequest))
          .thenAnswer((_) async => tResponse);
      // act
      final result = await apiProvider.postMethod(url: url);
      // assert
      expect(result, isA<DataSuccess>());
      verify(
        mockRestApi.request(any, requestType: RequestType.postRequest),
      ).called(1);
    });

    test('should be return dataFailed', () async {
      // arrange
      when(mockRestApi.request(any, requestType: RequestType.postRequest))
          .thenAnswer((_) async => const DataFailed(errorMsg));
      // act
      final result = await apiProvider.postMethod(url: url);
      // assert
      expect(result, isA<DataFailed>());
      expect(result.error, errorMsg);
      verify(
        mockRestApi.request(any, requestType: RequestType.postRequest),
      ).called(1);
    });
  });
}
