import 'package:flutter/material.dart';
import 'package:requester/core/params/request_type_param.dart';
import 'package:requester/core/rest/rest_api.dart';

class Constants {
  /// [errors]
  static const serverErrorDesc = 'Error: No response from the server';
  static const poorConnectionDesc = 'Error: Poor connection';
  static const noConnectToNetwork = 'Error: no internet connection';

  /// [times]
  static const serverTimeout = Duration(seconds: 20);

  /// [colors]
  static final scaffoldBackgroundColor = Colors.grey.shade200;

  /// [public]
  static final initRequestTypeList = [
    RequestTypeParam(
        title: 'Get', requestType: RequestType.getRequest, isSelected: true),
    RequestTypeParam(title: 'Post', requestType: RequestType.postRequest)
  ];
}
