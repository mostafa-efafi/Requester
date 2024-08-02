import 'package:requester/core/resource/data_state.dart';
import 'package:requester/core/utils/constants.dart';
import 'package:requester/features/feature_requester/data/data_source/remote/api_provider.dart';
import 'package:requester/features/feature_requester/data/models/request_response_model.dart';
import 'package:requester/features/feature_requester/domain/entities/request_reponse_entity.dart';
import 'package:requester/features/feature_requester/domain/repositories/request_repository.dart';

class RequestRepositoryImpl implements RequestRepository {
  final ApiProvider apiProvider;

  RequestRepositoryImpl(this.apiProvider);
  @override
  Future<DataState<RequestResponsEntity>> fetchGetMethod(String url) async {
    final response = await apiProvider.getMethod(url);
    if (response is DataSuccess && response.data != null) {
      try {
        final RequestResponsEntity entity =
            RequestReponseModel.fromResponse(response.data!);
        return DataSuccess(entity);
      } catch (e) {
        return const DataFailed(Constants.noOutputExist);
      }
    } else {
      return DataFailed(response.error!);
    }
  }

  @override
  Future<DataState<RequestResponsEntity>> fetchPostMethod(
      {required String url, Map<String, dynamic>? body}) async {
    final response = await apiProvider.postMethod(url: url, body: body);
    if (response is DataSuccess && response.data != null) {
      try {
        final RequestResponsEntity entity =
            RequestReponseModel.fromResponse(response.data!);
        return DataSuccess(entity);
      } catch (e) {
        return const DataFailed(Constants.noOutputExist);
      }
    } else {
      return DataFailed(response.error!);
    }
  }

  @override
  Future<DataState<RequestResponsEntity>> fetchDeleteMethod(String url) async {
    final response = await apiProvider.deleteMethod(url);
    if (response is DataSuccess && response.data != null) {
      try {
        final RequestResponsEntity entity =
            RequestReponseModel.fromResponse(response.data!);
        return DataSuccess(entity);
      } catch (e) {
        return const DataFailed(Constants.noOutputExist);
      }
    } else {
      return DataFailed(response.error!);
    }
  }

  @override
  Future<DataState<RequestResponsEntity>> fetchPatchMethod(
      {required String url, Map<String, dynamic>? body}) async {
    final response = await apiProvider.patchMethod(url: url, body: body);
    if (response is DataSuccess && response.data != null) {
      try {
        final RequestResponsEntity entity =
            RequestReponseModel.fromResponse(response.data!);
        return DataSuccess(entity);
      } catch (e) {
        return const DataFailed(Constants.noOutputExist);
      }
    } else {
      return DataFailed(response.error!);
    }
  }

  @override
  Future<DataState<RequestResponsEntity>> fetchPutMethod(
      {required String url, Map<String, dynamic>? body}) async {
    final response = await apiProvider.putMethod(url: url, body: body);
    if (response is DataSuccess && response.data != null) {
      try {
        final RequestResponsEntity entity =
            RequestReponseModel.fromResponse(response.data!);
        return DataSuccess(entity);
      } catch (e) {
        return const DataFailed(Constants.noOutputExist);
      }
    } else {
      return DataFailed(response.error!);
    }
  }
}
