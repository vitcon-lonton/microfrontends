// ignore_for_file: unused_import

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:app_user/app_widget.dart';
import 'injection.dart';
import 'module/auth/auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  configureInjection(Environment.prod);

  getIt<Dio>().interceptors.add(getIt<AuthInterceptors>());
  getIt<Dio>().interceptors.add(PrettyDioLogger());
  // getIt<Dio>()
  //     .interceptors
  //     .add(PrettyDioLogger(requestHeader: false, responseHeader: false));

  runApp(
    EasyLocalization(
      path: 'translations',
      child: const AppWidget(),
      fallbackLocale: const Locale('en', 'US'),
      supportedLocales: const [Locale('en', 'US')],
      // assetLoader: const CodegenLoader(),
    ),
  );
}
