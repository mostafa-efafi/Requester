import 'package:requester/features/feature_requester/presentation/bloc/auth_all_fragments_cubit/auth_all_fragments_cubit.dart';
import 'package:requester/features/feature_requester/presentation/bloc/header_fragment_cubit/header_fragment_cubit.dart';
import 'package:requester/features/feature_requester/presentation/bloc/query_fragment_cubit/query_fragment_cubit.dart';

class InputFragmentCubitParam {
  final QueryFragmentCubit? query;
  final HeaderFragmentCubit? header;
  final AuthAllFragmentsCubit? auth;

  InputFragmentCubitParam({this.query, this.header, this.auth});
}
