part of 'result_fragment_cubit.dart';

class ResultFragmentState extends Equatable {
  final bool showHtml;
  const ResultFragmentState({this.showHtml = true});

  ResultFragmentState copyWith({bool? newShowHtml}) {
    return ResultFragmentState(showHtml: newShowHtml ?? showHtml);
  }

  @override
  List<Object> get props => [showHtml];
}
