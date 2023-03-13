import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:requester/core/params/sent_param.dart';
import 'package:requester/core/resource/data_state.dart';
import 'package:requester/core/rest/rest_api.dart';
import 'package:requester/features/feature_requester/data/models/request_response_model.dart';
import 'package:requester/features/feature_requester/domain/entities/request_reponse_entity.dart';
import 'package:requester/features/feature_requester/domain/usecases/request_usecase.dart';
import 'package:requester/features/feature_requester/presentation/bloc/home_page_bloc/home_page_bloc.dart';
import 'package:requester/features/feature_requester/presentation/bloc/home_page_bloc/request_status.dart';

import 'home_page_bloc_test.mocks.dart';

@GenerateMocks([RequestUsecaseImpl])
MockRequestUsecaseImpl mockRequestUsecaseImpl = MockRequestUsecaseImpl();

void main() {
  final bloc = HomePageBloc(mockRequestUsecaseImpl);
  group('SendRequestEvent', () {
    const data ={'response': 'true'};
    const errorMsg = 'Error!';
    final sentParamGet =
        SentParam(requestType: RequestType.getRequest, url: 'url');
    final fetchData =
        DataSuccess(Response(requestOptions: RequestOptions(), data: data));
    RequestResponsEntity tEntity =
        RequestReponseModel.fromResponse(fetchData.data!);
    final tResponse = DataSuccess(tEntity);
    final sentParamPost = SentParam(
        requestType: RequestType.postRequest,
        url: 'url',
        postBody: {'test': 'a'});

    test('should be retuen dataSuccess for Get type request', () async {
      // arrange
      when(mockRequestUsecaseImpl.getMothodUsecase(any))
          .thenAnswer((_) async => tResponse);
      // act
      bloc.add(SendRequestEvent(sentParamGet));
      // assert
      expectLater(
          bloc.stream,
          emitsInOrder([
            HomePageState(requestStatus: RequestLoading()),
            HomePageState(requestStatus: RequestLoaded(tResponse.data!)),
          ]));
    });

    test('should be retuen dataFailed for Get type request', () async {
      // arrange
      when(mockRequestUsecaseImpl.getMothodUsecase(any))
          .thenAnswer((_) async => const DataFailed(errorMsg));
      // act
      bloc.add(SendRequestEvent(sentParamGet));
      // assert
      expectLater(
          bloc.stream,
          emitsInOrder([
            HomePageState(requestStatus: RequestLoading()),
            HomePageState(requestStatus: RequestError(errorMsg)),
          ]));
    });

    test('should be retuen dataSuccess for Post type request', () async {
      // arrange
      when(mockRequestUsecaseImpl.postMethodUsecase(
          url: 'url', body: {'test': 'a'})).thenAnswer((_) async => tResponse);
      // act
      bloc.add(SendRequestEvent(sentParamPost));
      // assert
      expectLater(
          bloc.stream,
          emitsInOrder([
            HomePageState(requestStatus: RequestLoading()),
            HomePageState(requestStatus: RequestLoaded(tResponse.data!)),
          ]));
    });
    test('should be retuen dataFailed for Post type request', () async {
      // arrange
      when(mockRequestUsecaseImpl
              .postMethodUsecase(url: 'url', body: {'test': 'a'}))
          .thenAnswer((_) async => const DataFailed(errorMsg));
      // act
      bloc.add(SendRequestEvent(sentParamPost));
      // assert
      expectLater(
          bloc.stream,
          emitsInOrder([
            HomePageState(requestStatus: RequestLoading()),
            HomePageState(requestStatus: RequestError(errorMsg)),
          ]));
    });
  });
}
