import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:postman_dio/postman_dio.dart';
import 'package:app_user/app_widget.dart';
import 'injection.dart';
import 'module/auth/auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureInjection(Environment.prod);

  getIt<Dio>().interceptors.add(PostmanDioLogger());
  getIt<Dio>().interceptors.add(getIt<AuthInterceptors>());
  // getIt<Dio>().interceptors.add(PostmanDioLogger(enablePrint: true));

  // await Firebase.initializeApp();
  runApp(const AppWidget());
}
