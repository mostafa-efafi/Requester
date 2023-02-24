import 'package:requester/core/rest/rest_api.dart';
// All parameters that are requested in each request will be sent by this class
class SentParam {
  final RequestType requestType;
  final String url;
  final Map<String, dynamic>? postBody;

  SentParam({required this.requestType, required this.url, this.postBody});
}
