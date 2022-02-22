// ignore_for_file: non_constant_identifier_names, constant_identifier_names

import 'package:dio/dio.dart';

enum Mode { dev, stag, prod }

class EnvConfig {
  static const APP_MODE =
      String.fromEnvironment('APP_MODE', defaultValue: 'development');
  static const APP_NAME = String.fromEnvironment('APP_NAME');
  static const APP_SUFFIX = String.fromEnvironment('APP_SUFFIX');

  static Mode get mode {
    if (APP_MODE == 'staging') return Mode.stag;
    if (APP_MODE == 'production') return Mode.prod;
    return Mode.dev;
  }

  static String get DOMAIN => 'https://daiminhquang.acecom.vn/api/v1/';

  static BaseOptions get options {
    return BaseOptions(
        baseUrl: DOMAIN,
        connectTimeout: 5000,
        sendTimeout: 5000,
        receiveTimeout: 5000);
  }
}
