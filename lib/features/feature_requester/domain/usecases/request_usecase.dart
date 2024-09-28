import 'package:requester/core/params/input_fragment_cubit_param.dart';
import 'package:requester/core/resource/data_state.dart';
import 'package:requester/features/feature_requester/data/repositories/request_repository_impl.dart';
import 'package:requester/features/feature_requester/domain/entities/request_reponse_entity.dart';

abstract class RequestUsecase {
  final RequestRepositoryImpl repository;

  RequestUsecase(
    this.repository,
  );

  Future<DataState<RequestResponsEntity>> getMothodUsecase(
      String url, InputFragmentCubitParam inputCubits);
  Future<DataState<RequestResponsEntity>> postMethodUsecase(
      String url, {InputFragmentCubitParam? inputCubits});
  Future<DataState<RequestResponsEntity>> putMethodUsecase(
      {required String url, Map<String, dynamic>? body});
  Future<DataState<RequestResponsEntity>> patchMethodUsecase(
      {required String url, Map<String, dynamic>? body});
  Future<DataState<RequestResponsEntity>> deleteMothodUsecase(
      String url, {InputFragmentCubitParam? inputCubits});
}

class RequestUsecaseImpl extends RequestUsecase {
  RequestUsecaseImpl(super.repository);

  @override
  Future<DataState<RequestResponsEntity>> getMothodUsecase(
      String url, InputFragmentCubitParam inputCubits) {
    return repository.fetchGetMethod(url: url, inputCubits: inputCubits);
  }

  @override
  Future<DataState<RequestResponsEntity>> postMethodUsecase(String url,
      {InputFragmentCubitParam? inputCubits} /* Map<String, dynamic>? body */) {
    return repository.fetchPostMethod(url: url /* , body: body */);
  }

  @override
  Future<DataState<RequestResponsEntity>> deleteMothodUsecase(
      String url, {InputFragmentCubitParam? inputCubits}) {
    return repository.fetchDeleteMethod(url: url);
  }

  @override
  Future<DataState<RequestResponsEntity>> patchMethodUsecase(
      {required String url, Map<String, dynamic>? body}) {
    return repository.fetchPatchMethod(
      url: url, /* body: body */
    );
  }

  @override
  Future<DataState<RequestResponsEntity>> putMethodUsecase(
      {required String url, Map<String, dynamic>? body}) {
    return repository.fetchPutMethod(
      url: url, /* body: body */
    );
  }
}
