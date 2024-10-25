part of 'header_fragment_cubit.dart';

class HeaderFragmentState extends Equatable {
  final List<InputFieldDataParam>? headerParamsList;
  final bool? isRefresh;
  const HeaderFragmentState({this.headerParamsList, this.isRefresh = false});

  HeaderFragmentState copyWith(
      {List<InputFieldDataParam>? newHeaderParamsList,
      required bool newIsRefresh}) {
    return HeaderFragmentState(
        headerParamsList: newHeaderParamsList ?? newHeaderParamsList,
        isRefresh: newIsRefresh);
  }

  @override
  List<Object?> get props => [headerParamsList, isRefresh];
}
