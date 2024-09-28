import 'package:dio/dio.dart';
import 'package:requester/core/resource/data_state.dart';
import 'package:requester/core/rest/rest_api.dart';

class ApiProvider {
  final RestApi restApi;

  ApiProvider(this.restApi);

  /// api provider for [get] request
  Future<DataState<Response>> getMethod(
      String url, List<Map<String, dynamic>> inputs) async {
    final response = await restApi.request(url,
        requestType: RequestType.getRequest,
        queryParameters: inputs[0],
        headers: inputs[1]);
    if (response is DataSuccess) {
      return response;
    } else {
      return DataFailed(response.error!);
    }
  }

  /// api provider for [post] request
  Future<DataState<Response>> postMethod(
      {required String url, Map<String, dynamic>? body}) async {
    final response = await restApi.request(url,
        requestType: RequestType.postRequest, body: body);
    if (response is DataSuccess) {
      return response;
    } else {
      return DataFailed(response.error!);
    }
  }

  /// api provider for [delete] request
  Future<DataState<Response>> deleteMethod(String url) async {
    final response =
        await restApi.request(url, requestType: RequestType.deleteRequest);
    if (response is DataSuccess) {
      return response;
    } else {
      return DataFailed(response.error!);
    }
  }

  /// api provider for [put] request
  Future<DataState<Response>> putMethod(
      {required String url, Map<String, dynamic>? body}) async {
    final response = await restApi.request(url,
        requestType: RequestType.putRequest, body: body);
    if (response is DataSuccess) {
      return response;
    } else {
      return DataFailed(response.error!);
    }
  }

  /// api provider for [patch] request
  Future<DataState<Response>> patchMethod(
      {required String url, Map<String, dynamic>? body}) async {
    final response = await restApi.request(url,
        requestType: RequestType.patchRequest, body: body);
    if (response is DataSuccess) {
      return response;
    } else {
      return DataFailed(response.error!);
    }
  }
}
