// ignore_for_file: invalid_visibility_annotation

import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:requester/core/resource/data_state.dart';
import 'package:requester/core/rest/manage_status_code.dart';
import 'package:requester/core/rest/network_checker.dart';
import 'package:requester/core/utils/constants.dart';
import 'package:requester/core/utils/text_tools.dart';

class RestApi {
  final Dio _dio = Dio();

  /// The main method for sending requests includes all types of [get] , [post] and...
  Future<DataState<Response>> request(
    String url, {
    RequestType requestType = RequestType.getRequest,
    var body,
    Map<String, String>? headers,
  }) async {
    /// added [http] to url
    url = TextTools.makestandardUrl(url);
    
    Response<dynamic> response;
    final bool connectNetwork = await NetworkChecker.checkConnection();
    if (connectNetwork == true) {
      try {
        if (requestType == RequestType.postRequest) {
          response = await _postRequest(
            url: url,
            headers: headers,
            body: body,
          );
        } else if (requestType == RequestType.fileRequest) {
          response = await _postFileRequest(
            url: url,
            headers: headers,
            body: body,
          );
        } else {
          response = await _getRequest(
            url: url,
            headers: headers,
          );
        }
      } on TimeoutException catch (e) {
        debugPrint(e.toString());
        return const DataFailed('error ${Constants.poorConnectionDesc} ');
      } on Error catch (e) {
        debugPrint('Error: $e');
        return const DataFailed('error ${Constants.poorConnectionDesc} ');
      }

      ///[decoded Result]
      if (response.statusCode == 200 || response.statusCode == 201) {
        return DataSuccess(response);
      } else {
        makeAlerts(response: response);
        return const DataFailed(Constants.serverErrorDesc);
      }
    } else {
      return const DataFailed(Constants.noConnectToNetwork);
    }
  }

  /// post file request method
  Future<Response<dynamic>> _postFileRequest(
      {required String url,
      required FormData body,
      Map<String, String>? headers,
      CancelToken? cancellToken}) async {
    var response = await _dio.post(url,
        data: body,
        options: _makeOptions(headers: headers),
        cancelToken: cancellToken, onSendProgress: (int sent, int total) {
      debugPrint('$sent  =>>> $total');
    });
    return response;
  }

  /// get request method
  Future<Response> _getRequest(
      {required String url,
      Map<String, String>? headers,
      CancelToken? cancellToken}) async {
    return _dio
        .get(
      url,
      cancelToken: cancellToken,
      options: _makeOptions(headers: headers),
    )
        .catchError((dynamic onError) {
      if (CancelToken.isCancel(onError)) {
        debugPrint(onError);
      }
      return Response(
          requestOptions: RequestOptions(
            path: url,
          ),
          statusCode: 401);
    }).timeout(Constants.serverTimeout);
  }

  /// post request method
  Future<Response<dynamic>> _postRequest(
      {required String url,
      dynamic body,
      Map<String, String>? headers,
      CancelToken? cancellToken}) async {
    return _dio
        .post(url,
            data: body,
            options: _makeOptions(headers: headers),
            cancelToken: cancellToken)
        .catchError((onError) {
      return Response(
          requestOptions: RequestOptions(
            path: url,
          ),
          statusCode: 401);
    }).timeout(Constants.serverTimeout);
  }

  @visibleForTesting
  String makeAlerts({Response? response}) {
    final ManageStatusCode manageSC = ManageStatusCode();
    final HttpStatusCodeModel error =
        manageSC.findError(sCode: response!.statusCode ?? 500);
    final alertText =
        'error ${error.statusCode} : ${error.description}\n${response.data}';
    debugPrint('Response_Error =>  $alertText');
    return alertText;
  }
}

Options _makeOptions({Map<String, String>? headers}) {
  return Options(
      receiveDataWhenStatusError: false,
      receiveTimeout: Constants.serverTimeout,
      sendTimeout: Constants.serverTimeout,
      validateStatus: (status) => true,
      headers: headers);
}

enum RequestType { getRequest, postRequest, fileRequest }
