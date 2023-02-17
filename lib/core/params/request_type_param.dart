import 'package:requester/core/rest/rest_api.dart';

class RequestTypeParam {
  final String title;
  final RequestType requestType;
  bool? isSelected = false;

  RequestTypeParam(
      {required this.title,
      required this.requestType,
      this.isSelected = false});
}
