// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:requester/core/utils/auth_generator.dart';

part 'auth_all_fragments_state.dart';

class AuthAllFragmentsCubit extends Cubit<AuthAllFragmentsState> {
  final AuthGenerator authGeneratior;
  AuthAllFragmentsCubit(this.authGeneratior)
      : super(const AuthAllFragmentsState());

  void editBasicAuth({String? username, String? password}) {
    final basicAuth = authGeneratior.basic(
        username: username, password: password, previousData: state.basicAuth);
    emit(state.copyWith(newBasicAuth: basicAuth));
  }

  void editBearerAuth(String token) {
    final bearerAuth = authGeneratior.bearer(token);
    emit(state.copyWith(newBearerAuth: bearerAuth));
  }
}
