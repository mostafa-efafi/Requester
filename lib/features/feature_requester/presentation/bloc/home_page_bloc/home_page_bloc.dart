// ignore_for_file: unused_element
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:requester/core/params/input_fragment_cubit_param.dart';
import 'package:requester/core/params/sent_param.dart';
import 'package:requester/core/resource/data_state.dart';
import 'package:requester/core/rest/rest_api.dart';
import 'package:requester/features/feature_requester/domain/entities/request_reponse_entity.dart';
import 'package:requester/features/feature_requester/domain/usecases/request_usecase.dart';
import 'package:requester/features/feature_requester/presentation/bloc/header_fragment_cubit/header_fragment_cubit.dart';
import 'package:requester/features/feature_requester/presentation/bloc/home_page_bloc/request_status.dart';
import 'package:requester/features/feature_requester/presentation/bloc/query_fragment_cubit/query_fragment_cubit.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final RequestUsecaseImpl requestUsecase;
  final QueryFragmentCubit queryCubit;
  final HeaderFragmentCubit headerCubit;
  TabController? tabController;
  HomePageBloc(this.requestUsecase, this.queryCubit, this.headerCubit)
      : super(HomePageState(requestStatus: RequestNoAction())) {
    // Send request to server event
    on<SendRequestEvent>((event, emit) async {
      final inputCubits =
          InputFragmentCubitParam(query: queryCubit, header: headerCubit);
      late DataState<RequestResponsEntity> response;

      /// [loading] status first
      try {
        emit(state.copyWith(newRequestStatus: RequestLoading()));
        final sentParam = event.sentParam;

        switch (sentParam.requestType) {
          /// [get]
          case RequestType.getRequest:
            response = await requestUsecase.getMothodUsecase(
                sentParam.url, inputCubits);
            break;

          /// [post]
          case RequestType.postRequest:
            response = await requestUsecase
                .postMethodUsecase(sentParam.url /* , sentParam.postBody */);
            break;

          /// [put]
          case RequestType.putRequest:
            response = await requestUsecase.putMethodUsecase(
                url: sentParam.url, body: sentParam.postBody);
            break;

          /// [patch]
          case RequestType.patchRequest:
            response = await requestUsecase.postMethodUsecase(
              sentParam.url, /* sentParam.postBody */
            );
            break;

          /// [delete]
          case RequestType.deleteRequest:
            response = await requestUsecase.getMothodUsecase(
                sentParam.url, inputCubits);
            break;
          default:
            response = await requestUsecase.getMothodUsecase(
                sentParam.url, inputCubits);
            break;
        }
        if (response is DataSuccess) {
          /// animated to second fragment for show api result
          tabController!.animateTo(1);
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
