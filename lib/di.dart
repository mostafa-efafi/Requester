import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:requester/core/rest/network_checker.dart';
import 'package:requester/core/rest/rest_api.dart';
import 'package:requester/features/feature_requester/data/data_source/remote/api_provider.dart';
import 'package:requester/features/feature_requester/data/repositories/request_repository_impl.dart';
import 'package:requester/features/feature_requester/domain/usecases/request_usecase.dart';
import 'package:requester/features/feature_requester/presentation/bloc/home_page_bloc/home_page_bloc.dart';

import 'features/feature_requester/presentation/bloc/request_type_list_cubit.dart';

GetIt di = GetIt.instance;

setupDI() {
  /// [tools]
  di.registerSingleton<Dio>(Dio());
  di.registerSingleton<NetworkChecker>(NetworkChecker());
  di.registerSingleton<RestApi>(RestApi(di()));

  /// [data Sources]
  di.registerSingleton<ApiProvider>(ApiProvider(di()));

  /// [repositories]
  di.registerSingleton<RequestRepositoryImpl>(RequestRepositoryImpl(di()));

  /// [usecases]
  di.registerSingleton<RequestUsecaseImpl>(RequestUsecaseImpl(di()));

  /// [blocs]
  di.registerSingleton<RequestTypeListCubit>(RequestTypeListCubit());
  di.registerSingleton<HomePageBloc>(HomePageBloc(di()));
}
