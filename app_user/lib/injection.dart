import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:postman_dio/postman_dio.dart';

import 'injection.config.dart';
import 'module/auth/auth.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit(
  asExtension: false, // default
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
)
void configureInjection(String env) {
  $initGetIt(getIt, environment: env);
  getIt<Dio>().interceptors.add(PostmanDioLogger());
  getIt<Dio>().interceptors.add(getIt<AuthInterceptors>());
}
// getIt<Dio>().interceptors.add(PostmanDioLogger(enablePrint: true));
