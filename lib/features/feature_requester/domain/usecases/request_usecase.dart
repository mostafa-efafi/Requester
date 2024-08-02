import 'package:requester/core/resource/data_state.dart';
import 'package:requester/features/feature_requester/data/repositories/request_repository_impl.dart';
import 'package:requester/features/feature_requester/domain/entities/request_reponse_entity.dart';

abstract class RequestUsecase {
  final RequestRepositoryImpl repository;

  RequestUsecase(this.repository);

  Future<DataState<RequestResponsEntity>> getMothodUsecase(String url);
  Future<DataState<RequestResponsEntity>> postMethodUsecase(
      {required String url, Map<String, dynamic>? body});
  Future<DataState<RequestResponsEntity>> putMethodUsecase(
      {required String url, Map<String, dynamic>? body});
  Future<DataState<RequestResponsEntity>> patchMethodUsecase(
      {required String url, Map<String, dynamic>? body});
  Future<DataState<RequestResponsEntity>> deleteMothodUsecase(String url);
}

class RequestUsecaseImpl extends RequestUsecase {
  RequestUsecaseImpl(super.repository);

  @override
  Future<DataState<RequestResponsEntity>> getMothodUsecase(String url) {
    return repository.fetchGetMethod(url);
  }

  @override
  Future<DataState<RequestResponsEntity>> postMethodUsecase(
      {required String url, Map<String, dynamic>? body}) {
    return repository.fetchPostMethod(url: url, body: body);
  }

  @override
  Future<DataState<RequestResponsEntity>> deleteMothodUsecase(String url) {
    return repository.fetchDeleteMethod(url);
  }

  @override
  Future<DataState<RequestResponsEntity>> patchMethodUsecase(
      {required String url, Map<String, dynamic>? body}) {
    return repository.fetchPatchMethod(url: url, body: body);
  }

  @override
  Future<DataState<RequestResponsEntity>> putMethodUsecase(
      {required String url, Map<String, dynamic>? body}) {
    return repository.fetchPutMethod(url: url, body: body);
  }
}
