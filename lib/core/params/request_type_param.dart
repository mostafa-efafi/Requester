import 'package:requester/core/rest/rest_api.dart';
/// This class is used to display the type of method selected by the user, such as post, get, etc.
class RequestTypeParam {
  final String title;
  final RequestType requestType;
  bool? isSelected = false;

  RequestTypeParam(
      {required this.title,
      required this.requestType,
      this.isSelected = false});
}
