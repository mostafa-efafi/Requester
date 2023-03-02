import 'package:flutter_test/flutter_test.dart';
import 'package:requester/features/feature_requester/presentation/bloc/home_page_bloc/home_page_bloc.dart';
import 'package:requester/features/feature_requester/presentation/bloc/home_page_bloc/request_status.dart';

void main() {
  group('HomePageState copyWith method', () {
    test('should be returned The second status', () async {
      // act
      HomePageState state = HomePageState(requestStatus: RequestNoAction());
      state = state.copyWith(newRequestStatus: RequestLoading());
      // assert
      expect(state.requestStatus, isA<RequestLoading>());
    });
  });
}
