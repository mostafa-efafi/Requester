import 'package:bloc/bloc.dart';
import 'package:requester/core/params/request_type_param.dart';
import 'package:requester/core/utils/constants.dart';

class RequestTypeListCubit extends Cubit<List<RequestTypeParam>> {
  RequestTypeListCubit() : super(Constants.initRequestTypeList);

  void changeStatus(RequestTypeParam selectedParam) {
    selectedParam.isSelected = true;
    final newState = state
        .map((e) => e.requestType == selectedParam.requestType
            ? RequestTypeParam(
                requestType: e.requestType, title: e.title, isSelected: true)
            : RequestTypeParam(
                requestType: e.requestType, title: e.title, isSelected: false))
        .toList();
    emit(newState);
  }
}
