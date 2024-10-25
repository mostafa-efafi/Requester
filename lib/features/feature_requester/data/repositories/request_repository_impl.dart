import 'package:requester/core/params/input_fragment_cubit_param.dart';
import 'package:requester/core/resource/data_state.dart';
import 'package:requester/core/utils/constants.dart';
import 'package:requester/features/feature_requester/data/models/request_response_model.dart';
import 'package:requester/features/feature_requester/domain/entities/request_reponse_entity.dart';
import 'package:requester/features/feature_requester/domain/repositories/request_repository.dart';

class RequestRepositoryImpl extends RequestRepository {
  RequestRepositoryImpl(
    super.apiProvider,
    super.inputRequestGenerator,
  );
  @override
  Future<DataState<RequestResponsEntity>> fetchGetMethod(
      {required String url, InputFragmentCubitParam? inputCubits}) async {
    final inputs = inputRequestGenerator.generate(inputCubits);
    final response = await apiProvider.getMethod(url, inputs);
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
      {required String url, InputFragmentCubitParam? inputCubits}) async {
    final response = await apiProvider.postMethod(url: url /* , body: body */);
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
  Future<DataState<RequestResponsEntity>> fetchDeleteMethod(
      {required String url, InputFragmentCubitParam? inputCubits}) async {
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
      {required String url, InputFragmentCubitParam? inputCubits}) async {
    final response = await apiProvider.patchMethod(url: url /* , body: body */);
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
      {required String url, InputFragmentCubitParam? inputCubits}) async {
    final response = await apiProvider.putMethod(url: url /* , body: body */);
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
