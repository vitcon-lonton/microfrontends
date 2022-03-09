import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection.config.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit(
  asExtension: false, // default
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
)
void configureInjection(String env) {
  $initGetIt(getIt, environment: env);
}
// getIt<Dio>().interceptors.add(PostmanDioLogger(enablePrint: true));
