import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:requester/core/params/sent_param.dart';
import 'package:requester/core/resource/data_state.dart';
import 'package:requester/core/rest/rest_api.dart';
import 'package:requester/features/feature_requester/domain/entities/request_reponse_entity.dart';
import 'package:requester/features/feature_requester/domain/usecases/request_usecase.dart';
import 'package:requester/features/feature_requester/presentation/bloc/home_page_bloc/request_status.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final RequestUsecaseImpl usecaseImpl;
  HomePageBloc(this.usecaseImpl)
      : super(HomePageState(requestStatus: RequestNoAction())) {
    // Send request to server event
    on<SendRequestEvent>((event, emit) async {
      late DataState<RequestResponsEntity> response;

      /// [loading] status first
      try {
        emit(state.copyWith(newRequestStatus: RequestLoading()));
        final sentParam = event.sentParam;

        switch (sentParam.requestType) {
          /// [get]
          case RequestType.getRequest:
            response = await usecaseImpl.getMothodUsecase(sentParam.url);
            break;

          /// [post]
          case RequestType.postRequest:
            response = await usecaseImpl.postMethodUsecase(
                url: sentParam.url, body: sentParam.postBody);
            break;

          /// [put]
          case RequestType.putRequest:
            response = await usecaseImpl.putMethodUsecase(
                url: sentParam.url, body: sentParam.postBody);
            break;

          /// [patch]
          case RequestType.patchRequest:
            response = await usecaseImpl.postMethodUsecase(
                url: sentParam.url, body: sentParam.postBody);
            break;

          /// [delete]
          case RequestType.deleteRequest:
            response = await usecaseImpl.getMothodUsecase(sentParam.url);
            break;
          default:
            response = await usecaseImpl.getMothodUsecase(sentParam.url);
            break;
        }
        if (response is DataSuccess) {
          emit(state.copyWith(newRequestStatus: RequestLoaded(response.data!)));
        } else {
          emit(state.copyWith(newRequestStatus: RequestError(response.error!)));
        }
      } catch (e) {
        emit(state.copyWith(newRequestStatus: RequestError(e.toString())));
      }
    });
  }
}
