import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:postman_dio/postman_dio.dart';

import 'env_config.dart';
import 'injection.config.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit(
  asExtension: false, // default
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
)
void configureInjection(String env) {
  final dioClient = Dio(EnvConfig.options);
  dioClient.interceptors.add(PostmanDioLogger(enablePrint: true));
  getIt.registerLazySingleton<Dio>(() => dioClient);
  $initGetIt(getIt, environment: env);
}
