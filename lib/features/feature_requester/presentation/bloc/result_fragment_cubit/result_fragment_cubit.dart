// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'result_fragment_state.dart';

class ResultFragmentCubit extends Cubit<ResultFragmentState> {
  ResultFragmentCubit() : super(const ResultFragmentState());

  void changeShowHtmlCheckBoxState({bool? value}) {
    emit(state.copyWith(newShowHtml: value ?? !state.showHtml));
  }
}
