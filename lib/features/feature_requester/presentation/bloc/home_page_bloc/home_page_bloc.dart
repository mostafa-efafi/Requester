import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:requester/core/params/sent_param.dart';
import 'package:requester/features/feature_requester/domain/usecases/request_usecase.dart';
import 'package:requester/features/feature_requester/presentation/bloc/home_page_bloc/request_status.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final RequestUsecaseImpl usecaseImpl;
  HomePageBloc(this.usecaseImpl) : super(HomePageState(requestStatus: RequestNoAction())) {
    on<SendRequestEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
