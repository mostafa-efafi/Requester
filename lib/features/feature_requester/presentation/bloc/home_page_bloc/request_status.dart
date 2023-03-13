import 'package:equatable/equatable.dart';
import 'package:requester/features/feature_requester/domain/entities/request_reponse_entity.dart';

abstract class RequestStatus extends Equatable {}

class RequestNoAction extends RequestStatus {
  RequestNoAction();
  @override
  List<Object?> get props => [];
}

class RequestLoading extends RequestStatus {
  RequestLoading();
  @override
  List<Object?> get props => [];
}

class RequestLoaded extends RequestStatus {
  final RequestResponsEntity response;
  RequestLoaded(this.response);
  @override
  List<Object?> get props => [response];
}

class RequestError extends RequestStatus {
  final String errorMessage;

  RequestError(this.errorMessage);
  @override
  List<Object?> get props => [errorMessage];
}
