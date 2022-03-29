import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

import 'i18n/i18n.dart';
import 'injection.config.dart';
import 'module/cart/cart.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit(
  asExtension: false, // default
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
)
Future<void> configureInjection(String env) async {
  await Hive.initFlutter();
  Hive.registerAdapter(CartItemDtoAdapter());
  await Hive.openBox<CartItemDto>(cartKey);
  await EasyLocalization.ensureInitialized();

  $initGetIt(getIt, environment: env);
}
