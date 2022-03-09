import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:app_user/auth/infrastructure/auth_facade.dart';

class AuthInterceptors extends Interceptor {
  AuthInterceptors(this._storage);

  final FlutterSecureStorage _storage;

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (options.headers.containsKey('requires-token')) {
      options.headers.remove('requires-token');

      final token = await _storage.read(key: tokenKey);

      if (token != null) {
        options.headers.addAll({'Authorization': token});

        if (kDebugMode) print('Authorization: $token');
      }
    }

    return super.onRequest(options, handler);
  }
}
