import 'package:requester/core/rest/rest_api.dart';

/// This class is used to display the type of method selected by the user, such as post, get, etc.
class RequestTypeParam {
  final String title;
  final RequestType requestType;

  ///if the request is able to send the body, this parameter is [true]
  final bool withBody;
  bool? isSelected = false;

  RequestTypeParam(
      {required this.title,
      required this.requestType,
      required this.withBody,
      this.isSelected = false});
}
