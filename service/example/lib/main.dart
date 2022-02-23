import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        BlocProvider<CategoriesCubit>(create: (_) {
          return CategoriesCubit(repository);
        }),
        BlocProvider<ServiceDetailCubit>(create: (_) {
          return ServiceDetailCubit(repository);
        }),
        BlocProvider<ServiceBookingFormCubit>(create: (_) {
          return ServiceBookingFormCubit(repository);
        }),
        BlocProvider<ServicesCubit>(create: (_) => ServicesCubit(repository)),
      ],
      child: MaterialApp(
        // home: const Home(),
        title: 'Flutter Demo',
        home: const ServiceBookingForm(),
        theme: ThemeData(primarySwatch: Colors.blue),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(),
        body: ListView(
          children: [
            Services(
              onItemPressed: (service) {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const ServiceDetail()));
              },
            ),
            const Categories(),
          ],
        ),
      ),
    );
  }
}
