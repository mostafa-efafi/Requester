// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:requester/core/params/input_field_data_param.dart';

part 'header_fragment_state.dart';

class HeaderFragmentCubit extends Cubit<HeaderFragmentState> {
  HeaderFragmentCubit()
      : super(HeaderFragmentState(
          headerParamsList: [InputFieldDataParam()],
        ));

  void editParameter(String text, int index) {
    List<InputFieldDataParam> newList = List.from(state.headerParamsList!);
    newList[index].parameter = text;
    emit(state.copyWith(
        newHeaderParamsList: newList,
        newIsRefresh: !(state.isRefresh ?? false)));
  }

  void editValue(String text, int index) {
    List<InputFieldDataParam> newList = List.from(state.headerParamsList!);
    newList[index].value = text;
    emit(state.copyWith(
        newHeaderParamsList: newList,
        newIsRefresh: !(state.isRefresh ?? false)));
  }

  void addNewQuery() {
    final List<InputFieldDataParam> newList = List.from(state.headerParamsList!)
      ..add(InputFieldDataParam());
    emit(state.copyWith(
        newHeaderParamsList: newList,
        newIsRefresh: !(state.isRefresh ?? false)));
  }
}
