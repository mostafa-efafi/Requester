// ignore_for_file: must_be_immutable

part of 'query_fragment_cubit.dart';

class QueryFragmentState extends Equatable {
  final List<QueryDataParam>? queryParamsList;
  final bool? isRefresh;
  const QueryFragmentState({this.queryParamsList, this.isRefresh = false});

  QueryFragmentState copyWith(
      {List<QueryDataParam>? newQueryParamsList, required bool newIsRefresh}) {
    return QueryFragmentState(
        queryParamsList: newQueryParamsList ?? queryParamsList,
        isRefresh: newIsRefresh);
  }

  @override
  List<Object?> get props => [queryParamsList, isRefresh];
}
