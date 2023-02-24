import 'package:equatable/equatable.dart';

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
  final Map<String, dynamic> response;
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
