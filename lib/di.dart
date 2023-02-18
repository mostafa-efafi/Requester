import 'package:get_it/get_it.dart';
import 'package:requester/core/rest/rest_api.dart';
import 'package:requester/features/feature_requester/data/data_source/remote/api_provider.dart';

GetIt di = GetIt.instance;

setupDI() {
  /// [tools]
  di.registerSingleton<RestApi>(RestApi());

  /// [data Source]
  di.registerSingleton<ApiProvider>(ApiProvider(di()));
}
