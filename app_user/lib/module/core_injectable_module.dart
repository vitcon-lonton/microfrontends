import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:app_user/env_config.dart';

@module
abstract class CoreInjectableModule {
  @lazySingleton
  Dio get dio => Dio(EnvConfig.options);

  @lazySingleton
  FlutterSecureStorage get storage => const FlutterSecureStorage();
}
