import 'package:requester/core/params/input_fragment_cubit_param.dart';
import 'package:requester/core/resource/data_state.dart';
import 'package:requester/core/utils/input_request_generator.dart';
import 'package:requester/features/feature_requester/data/data_source/remote/api_provider.dart';
import 'package:requester/features/feature_requester/domain/entities/request_reponse_entity.dart';

abstract class RequestRepository {
  final ApiProvider apiProvider;
  final InputRequestGenerator inputRequestGenerator;

  RequestRepository(this.apiProvider, this.inputRequestGenerator);

  Future<DataState<RequestResponsEntity>> fetchGetMethod(
      {required String url, InputFragmentCubitParam? inputCubits});
  Future<DataState<RequestResponsEntity>> fetchPostMethod(
      {required String url, InputFragmentCubitParam? inputCubits});
  Future<DataState<RequestResponsEntity>> fetchPutMethod(
      {required String url, InputFragmentCubitParam? inputCubits});
  Future<DataState<RequestResponsEntity>> fetchPatchMethod(
      {required String url, InputFragmentCubitParam? inputCubits});
  Future<DataState<RequestResponsEntity>> fetchDeleteMethod(
      {required String url, InputFragmentCubitParam? inputCubits});
}
