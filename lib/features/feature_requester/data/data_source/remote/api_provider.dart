import 'package:dio/dio.dart';
import 'package:requester/core/resource/data_state.dart';
import 'package:requester/core/rest/rest_api.dart';

class ApiProvider {
  final RestApi restApi;

  ApiProvider(this.restApi);

  /// api provider for [get] request
  Future<DataState<Response>> getMethod(String url) async {
    final response =
        await restApi.request(url, requestType: RequestType.getRequest);
    if (response is DataSuccess) {
      return response;
    } else {
      return DataFailed(response.error!);
    }
  }

  /// api provider for [post] request
  Future<DataState<Response>> postMethod(
      {required String url, String? body}) async {
    final response = await restApi.request(url,
        requestType: RequestType.postRequest, body: body);
    if (response is DataSuccess) {
      return response;
    } else {
      return DataFailed(response.error!);
    }
  }
}
