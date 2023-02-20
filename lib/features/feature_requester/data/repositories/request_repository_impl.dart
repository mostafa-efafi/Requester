import 'package:requester/core/resource/data_state.dart';
import 'package:requester/features/feature_requester/data/data_source/remote/api_provider.dart';
import 'package:requester/features/feature_requester/domain/repositories/request_repository.dart';

class RequestRepositoryImpl implements RequestRepository {
  final ApiProvider apiProvider;

  RequestRepositoryImpl(this.apiProvider);
  @override
  Future<DataState<Map<String, dynamic>>> fetchGetMethod(String url) async {
    final response = await apiProvider.getMethod(url);
    if (response is DataSuccess && response.data != null) {
      final data = response.data!.data;
      return DataSuccess(data);
    } else {
      return DataFailed(response.error!);
    }
  }

  @override
  Future<DataState<Map<String, dynamic>>> fetchPostMethod(
      {required String url, Map<String , dynamic>? body}) async {
    final response = await apiProvider.postMethod(url: url, body: body);
    if (response is DataSuccess && response.data != null) {
      final data = response.data!.data;
      return DataSuccess(data);
    } else {
      return DataFailed(response.error!);
    }
  }
}
