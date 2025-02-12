import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:requester/core/rest/network_checker.dart';
import 'package:requester/core/rest/rest_api.dart';
import 'package:requester/core/utils/auth_generator.dart';
import 'package:requester/core/utils/input_request_generator.dart';
import 'package:requester/features/feature_requester/data/data_source/remote/api_provider.dart';
import 'package:requester/features/feature_requester/data/repositories/request_repository_impl.dart';
import 'package:requester/features/feature_requester/domain/usecases/request_usecase.dart';
import 'package:requester/features/feature_requester/presentation/bloc/auth_all_fragments_cubit/auth_all_fragments_cubit.dart';
import 'package:requester/features/feature_requester/presentation/bloc/header_fragment_cubit/header_fragment_cubit.dart';
import 'package:requester/features/feature_requester/presentation/bloc/home_page_bloc/home_page_bloc.dart';
import 'package:requester/features/feature_requester/presentation/bloc/query_fragment_cubit/query_fragment_cubit.dart';
import 'package:requester/features/feature_requester/presentation/bloc/result_fragment_cubit/result_fragment_cubit.dart';

import 'features/feature_requester/presentation/bloc/request_type_list_cubit.dart';

GetIt di = GetIt.instance;

setupDI() {
  /// [tools]
  di.registerSingleton<Dio>(Dio());
  di.registerSingleton<NetworkChecker>(NetworkChecker());
  di.registerSingleton<RestApi>(RestApi(networkChecker: di()));
  di.registerSingleton<InputRequestGenerator>(InputRequestGenerator());
  di.registerSingleton<AuthGenerator>(AuthGenerator());

  /// [data Sources]
  di.registerSingleton<ApiProvider>(ApiProvider(di()));

  /// [repositories]
  di.registerSingleton<RequestRepositoryImpl>(
      RequestRepositoryImpl(di(), di()));

  /// [usecases]
  di.registerSingleton<RequestUsecaseImpl>(RequestUsecaseImpl(di()));

  /// [cubits]
  di.registerSingleton<QueryFragmentCubit>(QueryFragmentCubit());
  di.registerSingleton<HeaderFragmentCubit>(HeaderFragmentCubit());
  di.registerSingleton<ResultFragmentCubit>(ResultFragmentCubit());
  di.registerSingleton<AuthAllFragmentsCubit>(AuthAllFragmentsCubit(di()));

  /// [blocs]
  di.registerSingleton<RequestTypeListCubit>(RequestTypeListCubit());
  di.registerSingleton<HomePageBloc>(HomePageBloc(di(), di(), di(), di()));
}
