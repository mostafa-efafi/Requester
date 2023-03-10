import 'package:dio/dio.dart';
import 'package:requester/features/feature_requester/domain/entities/request_reponse_entity.dart';

class RequestReponseModel extends RequestResponsEntity {
  const RequestReponseModel(
      {super.data,
      super.statusCode,
      super.statusMessage,
      super.headers,
      super.sendTime,
      super.resultType});

  factory RequestReponseModel.fromResponse(Response response) {
    return RequestReponseModel(
      data: response.data.toString(),
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
      // headers : response.headers,
      sendTime: response.requestOptions.sendTimeout,
      resultType: response.requestOptions.responseType,
    );
  }
}
