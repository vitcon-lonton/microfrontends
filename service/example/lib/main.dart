import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:service/category/category_cubit.dart';
import 'package:service/category/category_page.dart';
import 'package:service/service.dart';

void main() => runApp(const MyApp());

final options =
    BaseOptions(sendTimeout: 5000, connectTimeout: 5000, receiveTimeout: 5000);
final dio = Dio(options);
final api = CatalogueApi(dio);
final repository = ServiceRepository(api);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CategoryCubit>(create: (_) => CategoryCubit(repository)),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        home: const CategoryPage(),
        theme: ThemeData(primarySwatch: Colors.blue),
      ),
    );
  }
}
