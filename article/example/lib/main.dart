import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:article/article.dart';

void main() => runApp(const MyApp());

final options =
    BaseOptions(sendTimeout: 5000, connectTimeout: 5000, receiveTimeout: 5000);
final dio = Dio(options);
final api = ArticleApi(dio);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ArticlesCubit>(create: (_) => ArticlesCubit(api)),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        home: const Articles(),
        theme: ThemeData(primarySwatch: Colors.blue),
      ),
    );
  }
}
