import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:requester/core/resource/data_state.dart';
import 'package:requester/features/feature_requester/data/models/request_response_model.dart';
import 'package:requester/features/feature_requester/data/repositories/request_repository_impl.dart';
import 'package:requester/features/feature_requester/domain/entities/request_reponse_entity.dart';
import 'package:requester/features/feature_requester/domain/usecases/request_usecase.dart';

import 'request_usecase_test.mocks.dart';

@GenerateMocks([RequestRepositoryImpl])
void main() {
  MockRequestRepositoryImpl mockRequestRepositoryImpl =
      MockRequestRepositoryImpl();
  group('getMothodUsecase', () {
    final usecase = RequestUsecaseImpl(mockRequestRepositoryImpl);
    const data = {'data': 'success'};
    final fetchData =
        DataSuccess(Response(requestOptions: RequestOptions(), data: data));
    RequestResponsEntity tEntity =
        RequestReponseModel.fromResponse(fetchData.data!);
    final tResponse = DataSuccess(tEntity);

    const errorMsg = 'Error!';

    test('should be resturn dataSuccess', () async {
      // arrange
      when(mockRequestRepositoryImpl.fetchGetMethod(any))
          .thenAnswer((_) async => tResponse);
      // act
      final result = await usecase.getMothodUsecase('url');
      // assert
      expect(result, isA<DataSuccess>());
      expect(result.data, tEntity);
      verify(mockRequestRepositoryImpl.fetchGetMethod(any)).called(1);
    });

    test('should be resturn dataFailed', () async {
      // arrange
      when(mockRequestRepositoryImpl.fetchGetMethod(any))
          .thenAnswer((_) async => const DataFailed(errorMsg));
      // act
      final result = await usecase.getMothodUsecase('Wrong_URL');
      // assert
      expect(result, isA<DataFailed>());
      expect(result.error, errorMsg);
      verify(mockRequestRepositoryImpl.fetchGetMethod(any)).called(1);
    });
  });

  group('postMethodUsecase', () {
    final usecase = RequestUsecaseImpl(mockRequestRepositoryImpl);
    const data = {'data': 'success'};
    final fetchData =
        DataSuccess(Response(requestOptions: RequestOptions(), data: data));
    RequestResponsEntity tEntity =
        RequestReponseModel.fromResponse(fetchData.data!);
    final tResponse = DataSuccess(tEntity);

    const errorMsg = 'Error!';
    const url = 'url';
    const Map<String, dynamic> body = {};
    test('should be return dataSuccess', () async {
      // arrange
      when(mockRequestRepositoryImpl.fetchPostMethod(url: url, body: body))
          .thenAnswer((_) async => tResponse);
      // act
      final result = await usecase.postMethodUsecase(url: url, body: body);
      // assert
      expect(result, isA<DataSuccess>());
      expect(result.data, tEntity);
      verify(mockRequestRepositoryImpl.fetchPostMethod(url: url, body: body))
          .called(1);
    });

    test('should be return dataFailded', () async {
      // arrange
      when(mockRequestRepositoryImpl.fetchPostMethod(url: url, body: body))
          .thenAnswer((_) async => const DataFailed(errorMsg));
      // act
      final result = await usecase.postMethodUsecase(url: url, body: body);
      // assert
      expect(result, isA<DataFailed>());
      expect(result.error, errorMsg);
      verify(mockRequestRepositoryImpl.fetchPostMethod(url: url, body: body))
          .called(1);
    });
  });
}
