part of 'auth_all_fragments_cubit.dart';

class AuthAllFragmentsState extends Equatable {
  final String? basicAuth;
  final String? bearerAuth;
  const AuthAllFragmentsState({this.basicAuth, this.bearerAuth});

  AuthAllFragmentsState copyWith(
      {String? newBasicAuth, String? newBearerAuth}) {
    return AuthAllFragmentsState(
        basicAuth: newBasicAuth ?? basicAuth,
        bearerAuth: newBearerAuth ?? bearerAuth);
  }

  @override
  List<Object?> get props => [basicAuth, bearerAuth];
}
