import 'package:requester/core/resource/data_state.dart';

abstract class RequestRepository {
  Future<DataState<Map<String, dynamic>>> fetchGetMethod(String url);
  Future<DataState<Map<String, dynamic>>> fetchPostMethod(
      {required String url, Map<String , dynamic>? body});
}
