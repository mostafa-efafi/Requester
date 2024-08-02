import 'package:requester/core/resource/data_state.dart';
import 'package:requester/features/feature_requester/domain/entities/request_reponse_entity.dart';

abstract class RequestRepository {
  Future<DataState<RequestResponsEntity>> fetchGetMethod(String url);
  Future<DataState<RequestResponsEntity>> fetchPostMethod(
      {required String url, Map<String, dynamic>? body});
  Future<DataState<RequestResponsEntity>> fetchPutMethod(
      {required String url, Map<String, dynamic>? body});
  Future<DataState<RequestResponsEntity>> fetchPatchMethod(
      {required String url, Map<String, dynamic>? body});
  Future<DataState<RequestResponsEntity>> fetchDeleteMethod(String url);
}
