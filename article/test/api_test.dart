import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:postman_dio/postman_dio.dart';

import 'package:article/data/data.dart';

void main() {
  final options = BaseOptions(
      sendTimeout: 10000, connectTimeout: 10000, receiveTimeout: 10000);
  final dio = Dio(options);
  final api = ArticleApi(dio);

  setUp(() {
    dio.interceptors.add(PostmanDioLogger(enablePrint: true));
  });

  test('getArticles', () async {
    await api.getArticles();
  });

  test('getArticleDetail', () async {
    const id = 16;
    await api.getArticleDetail(id);
  });
}
