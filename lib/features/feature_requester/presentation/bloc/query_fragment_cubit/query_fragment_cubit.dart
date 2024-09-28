// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:requester/core/params/query_data_param.dart';

part 'query_fragment_state.dart';

class QueryFragmentCubit extends Cubit<QueryFragmentState> {
  QueryFragmentCubit()
      : super(QueryFragmentState(
          queryParamsList: [QueryDataParam()],
        ));

  void editParameter(String text, int index) {
    List<QueryDataParam> newList = List.from(state.queryParamsList!);
    newList[index].parameter = text;
    emit(state.copyWith(
        newQueryParamsList: newList,
        newIsRefresh: !(state.isRefresh ?? false)));
  }

  void editValue(String text, int index) {
    List<QueryDataParam> newList = List.from(state.queryParamsList!);
    newList[index].value = text;
    emit(state.copyWith(
        newQueryParamsList: newList,
        newIsRefresh: !(state.isRefresh ?? false)));
  }

  void addNewQuery() {
    final List<QueryDataParam> newList = List.from(state.queryParamsList!)
      ..add(QueryDataParam());
    emit(state.copyWith(
        newQueryParamsList: newList,
        newIsRefresh: !(state.isRefresh ?? false)));
  }
}
