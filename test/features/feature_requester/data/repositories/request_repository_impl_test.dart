import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:requester/core/resource/data_state.dart';
import 'package:requester/features/feature_requester/data/data_source/remote/api_provider.dart';
import 'package:requester/features/feature_requester/data/models/request_response_model.dart';
import 'package:requester/features/feature_requester/data/repositories/request_repository_impl.dart';
import 'package:requester/features/feature_requester/domain/entities/request_reponse_entity.dart';

import 'request_repository_impl_test.mocks.dart';

@GenerateMocks([ApiProvider])
MockApiProvider mockApiProvider = MockApiProvider();
RequestRepositoryImpl repository = RequestRepositoryImpl(mockApiProvider);

void main() {
  group('fetchGetMethod', () {
    const errorMsg = 'Error';
    final tResponse = DataSuccess(
        Response(requestOptions: RequestOptions(), data: {'name': 'test'}));
    RequestResponsEntity tEntity =
        RequestReponseModel.fromResponse(tResponse.data!);

    test('should be return dataSuccess', () async {
      // arrange
      when(mockApiProvider.getMethod(any)).thenAnswer((_) async => tResponse);
      // act
      final result = await repository.fetchGetMethod('http://ubuntu.com');
      // assert
      expect(result, isA<DataSuccess>());
      expect(result.data, tEntity);
      verify(mockApiProvider.getMethod(any)).called(1);
    });

    test('should be return dataFailed', () async {
      // arrange
      when(mockApiProvider.getMethod(any))
          .thenAnswer((_) async => const DataFailed(errorMsg));
      // act
      final result = await repository.fetchGetMethod('Wrong_Url');
      // assert
      expect(result, isA<DataFailed>());
      expect(result.error, errorMsg);
      verify(mockApiProvider.getMethod(any)).called(1);
    });
  });

  group('fetchPostMethod', () {
    final tResponse = DataSuccess(
        Response(requestOptions: RequestOptions(), data: {'name': 'test'}));
    RequestResponsEntity tEntity =
        RequestReponseModel.fromResponse(tResponse.data!);
    const url = 'http://ubuntu.com';
    const wrongUrl = 'Wrong_Url';
    const errorMsg = 'Error';
    test('should be return dataSuccess', () async {
      // arrange
      when(mockApiProvider.postMethod(url: url, body: {}))
          .thenAnswer((_) async => tResponse);
      // act
      final result = await repository.fetchPostMethod(url: url, body: {});
      // assert
      expect(result, isA<DataSuccess>());
      expect(result.data, tEntity);
      verify(mockApiProvider.postMethod(url: url, body: {})).called(1);
    });

    test('should be return dataFailed', () async {
      // arrange
      when(mockApiProvider.postMethod(url: wrongUrl, body: {}))
          .thenAnswer((_) async => const DataFailed(errorMsg));
      // act
      final result = await repository.fetchPostMethod(url: wrongUrl, body: {});
      // assert
      expect(result, isA<DataFailed>());
      expect(result.error, errorMsg);
      verify(mockApiProvider.postMethod(url: wrongUrl, body: {})).called(1);
    });
  });
}
