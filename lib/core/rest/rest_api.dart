import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:requester/core/resource/data_state.dart';
import 'package:requester/core/rest/network_checker.dart';
import 'package:requester/core/utils/text_tools.dart';

// Interfaces
abstract class IHttpClient {
  Future<Response<dynamic>> get(String url,
      {Map<String, dynamic>? headers, Map<String, dynamic>? queryParameters});
  Future<Response<dynamic>> post(String url,
      {dynamic body, Map<String, dynamic>? headers});
  Future<Response<dynamic>> put(String url,
      {dynamic body, Map<String, dynamic>? headers});
  Future<Response<dynamic>> patch(String url,
      {dynamic body, Map<String, dynamic>? headers});
  Future<Response<dynamic>> delete(String url, {Map<String, dynamic>? headers});
}

abstract class IErrorManager {
  void handleError(Response response);
}

// Concrete Implementation for HttpClient
class DioHttpClient implements IHttpClient {
  final Dio dio = Dio();

  @override
  Future<Response<dynamic>> get(String url,
      {Map<String, dynamic>? headers, Map<String, dynamic>? queryParameters}) {
    return dio.get(url,
        options: Options(headers: headers), queryParameters: queryParameters);
  }

  @override
  Future<Response<dynamic>> post(String url,
      {dynamic body, Map<String, dynamic>? headers}) {
    return dio.post(url, data: body, options: Options(headers: headers));
  }

  @override
  Future<Response<dynamic>> put(String url,
      {dynamic body, Map<String, dynamic>? headers}) {
    return dio.put(url, data: body, options: Options(headers: headers));
  }

  @override
  Future<Response<dynamic>> patch(String url,
      {dynamic body, Map<String, dynamic>? headers}) {
    return dio.patch(url, data: body, options: Options(headers: headers));
  }

  @override
  Future<Response<dynamic>> delete(String url,
      {Map<String, dynamic>? headers}) {
    return dio.delete(url, options: Options(headers: headers));
  }
}

// Error Handling Class
class ErrorManager implements IErrorManager {
  @override
  void handleError(Response response) {
    final int statusCode = response.statusCode ?? 500;
    debugPrint('Error: $statusCode, Response: ${response.data}');
    // Handle the error based on status code
  }
}

// RestApi Class (following SOLID principles)
class RestApi {
  final NetworkChecker networkChecker;

  RestApi({
    required this.networkChecker,
  });

  Future<DataState<Response>> request(String url,
      {required RequestType requestType,
      Map<String, dynamic>? body,
      Map<String, dynamic>? headers,
      Map<String, dynamic>? queryParameters}) async {
    final DioHttpClient dioHttpClient = DioHttpClient();
    final ErrorManager errorManager = ErrorManager();
    final bool isConnected = await networkChecker.checkConnection();

    if (!isConnected) {
      return const DataFailed('No internet connection');
    }

    /// added [http] to url
    url = TextTools.makestandardUrl(url);

    try {
      Response response;
      switch (requestType) {
        case RequestType.getRequest:
          response = await dioHttpClient.get(url,
              headers: headers, queryParameters: queryParameters);
          break;
        case RequestType.postRequest:
          response =
              await dioHttpClient.post(url, body: body, headers: headers);
          break;
        case RequestType.putRequest:
          response = await dioHttpClient.put(url, body: body, headers: headers);
          break;
        case RequestType.patchRequest:
          response =
              await dioHttpClient.patch(url, body: body, headers: headers);
          break;
        case RequestType.deleteRequest:
          response = await dioHttpClient.delete(url, headers: headers);
          break;
        default:
          throw UnimplementedError('Request type not implemented');
      }

      if (response.statusCode != 200) {
        errorManager.handleError(response);
      }

      return DataSuccess(response);
    } on TimeoutException {
      return const DataFailed('Request timed out');
    } catch (e) {
      return DataFailed('Error occurred: $e');
    }
  }
}

enum RequestType {
  getRequest,
  postRequest,
  putRequest,
  patchRequest,
  deleteRequest,
}
