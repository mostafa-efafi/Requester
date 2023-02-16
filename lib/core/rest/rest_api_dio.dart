// ignore_for_file: always_specify_types, unnecessary_null_comparison, avoid_debugPrint

import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:karbalad_messenger/core/resource/data_state.dart';
import 'package:karbalad_messenger/core/rest/manage_status_code.dart';
import 'package:karbalad_messenger/core/rest/network_checker.dart';
import 'package:karbalad_messenger/core/utils/constants/constants.dart';
import 'package:karbalad_messenger/core/utils/text_tools.dart';

enum RequestType { getRequest, postRequest, fileRequest }

Dio _dio = Dio();
//  final CancelToken _cancellToken = CancelToken();

class RestApi {
  RestApi();

  Future<DataState<Response>> request(
    String url, {
    RequestType requestType = RequestType.getRequest,
    var body,
    Map<String, String>? headers,
  }) async {
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
      if (response != null && response.statusCode == 200) {
        return DataSuccess(response);
      } else {
        _makeAlerts(response: response, body: body);
        return const DataFailed(Constants.serverErrorDesc);
      }
    } else {
      return const DataFailed(Constants.noConnectToNetwork);
    }
  }

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
    }).timeout(const Duration(seconds: 40));
  }

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
    }).timeout(const Duration(seconds: 40));
  }

  String _makeAlerts({dynamic body, Response? response}) {
    final ManageStatusCode manageSC = ManageStatusCode();
    final HttpStatusCodeModel error =
        manageSC.findError(sCode: response!.statusCode ?? 500);
    final alertText =
        'خطا ${error.statusCode} : ${error.description}\n${response.data}';
    debugPrint('Response_Error =>  $alertText');
    // _showAlertSnackBar(
    //   text: alertText,
    //   context: context,
    // );
    return alertText;
  }

  // void _showAlertSnackBar({String? text, BuildContext? context}) {
  //   if (context != null) {
  //     snackBarTools.showIconSnackBar(
  //       text: text!,
  //       iconC: Icons.error_rounded,
  //       color: Colors.red,
  //       context: context,
  //     );
  //   }
  // }

  Future<dynamic> assetTestRequest(
      {required String path, String? loginElements}) async {
    final String response = await rootBundle.loadString('assets/apis/$path');
    final dynamic res = json.decode(response);
    return res;
  }

  Future<bool> downloadFile(
      {required String url,
      required String downloadedPath,
      required Function(double) onChangeProgress,
      bool successSnackBar = false}) async {
    Response<dynamic>? response;
    bool isDownload = false;
    response = await _dio.download(
      url,
      '$downloadedPath/${TextTools.getFileNameFromPath(filePath: url)}',
      onReceiveProgress: (progress, all) {
        final progressVal = progress / all;
        onChangeProgress(progressVal);
        if (progressVal == 1.0) {
          isDownload = true;
          if (successSnackBar == true) {
            // snackBarTools.showIconSnackBar(
            //     text: 'فایل در مسیر زیر ذخیره شد\n$downloadedPath',
            //     context: context,
            //     color: Colors.green,
            //     iconC: Icons.download_rounded);
          }
        }
      },
    ).catchError((e) {
      if (CancelToken.isCancel(e)) {
        _makeAlerts(response: response, body: response!.data ?? 'download');
      }
    });
    if (/* response.data != null && */
        response.statusCode != 500 && isDownload == true) {
      return true;
    } else {
      return false;
    }
  }

  // Future<void> _savedApiOnDataBase(
  //     {required String url,
  //     required dynamic response,
  //     required String requestType}) async {
  //   final stringResponse = json.encode(response);
  //   final allSavedApis = await _hiveHelperSavedRestApi.getAll();
  //   final findApi = allSavedApis.firstWhere(
  //       (element) => element.url == url && element.requestType == requestType,
  //       orElse: () => SavedRestApi());
  //   if (findApi.id != null) {
  //     findApi
  //       ..response = stringResponse
  //       ..createdTime = DateTime.now();
  //     await _hiveHelperSavedRestApi.update(findApi);
  //   } else {
  //     final savedModel = SavedRestApi(
  //         url: url,
  //         requestType: requestType,
  //         response: stringResponse,
  //         createdTime: DateTime.now());
  //     await _hiveHelperSavedRestApi.insert(savedModel);
  //   }
  // }

  // Future<dynamic> _readApiFromDataBase(
  //     {required String url,
  //     required bool allowShowSnackBar,
  //     required String requestType,
  //     BuildContext? context}) async {
  //   final allRestApis = await _hiveHelperSavedRestApi.getAll();
  //   final findApi = allRestApis.firstWhere(
  //       (element) => element.url == url && element.requestType == requestType,
  //       orElse: () => SavedRestApi());
  //   if (findApi.id != null) {
  //     return json.decode('${findApi.response}');
  //   } else {
  //     allowShowSnackBar == true
  //         ? _showAlertSnackBar(
  //             text: 'خطا : عدم اتصال به اینترنت',
  //             context: context,
  //           )
  //         : debugPrint('خطا : عدم اتصال به اینترنت');
  //     return 'error';
  //   }
  // }
}

Options _makeOptions({Map<String, String>? headers}) {
  // final header = bearerToken != null
  //     ? {
  //         'Content-Type': 'application/json; charset=UTF-8',
  //         'Accept': 'application/json',
  //         'Authorization': 'Bearer $bearerToken',
  //       }
  //     : {
  //         'Content-Type': 'application/json; charset=UTF-8',
  //       };

  return Options(
      receiveDataWhenStatusError: false,
      receiveTimeout: 10000,
      sendTimeout: 10000,
      validateStatus: (status) =>
          true /* (status) {
        return status! < 500;
      } */
      ,
      headers: headers);
}
