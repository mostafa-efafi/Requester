import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

class RequestResponsEntity extends Equatable {
  final String? data;
  final int? statusCode;
  final String? statusMessage;
  final Map<String, dynamic>? headers;
  final Duration? sendTime;
  final ResponseType? resultType;

  const RequestResponsEntity(
      {this.data,
      this.statusCode,
      this.statusMessage,
      this.headers,
      this.sendTime,
      this.resultType});

  @override
  List<Object?> get props =>
      [data, statusCode, statusMessage, headers, sendTime, resultType];
}
