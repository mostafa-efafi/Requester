import 'package:requester/core/resource/data_state.dart';
import 'package:requester/features/feature_requester/data/repositories/request_repository_impl.dart';

abstract class RequestUsecase {
  final RequestRepositoryImpl repository;

  RequestUsecase(this.repository);

  Future<DataState<Map<String, dynamic>>> getMothodUsecase(String url);
  Future<DataState<Map<String, dynamic>>> postMethodUsecase(
      {required String url, Map<String, dynamic>? body});
}

class RequestUsecaseImpl extends RequestUsecase {
  RequestUsecaseImpl(super.repository);

  @override
  Future<DataState<Map<String, dynamic>>> getMothodUsecase(String url) {
    return repository.fetchGetMethod(url);
  }

  @override
  Future<DataState<Map<String, dynamic>>> postMethodUsecase(
      {required String url, Map<String, dynamic>? body}) {
    return repository.fetchPostMethod(url: url, body: body);
  }
}
