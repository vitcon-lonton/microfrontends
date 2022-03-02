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
        BlocProvider<CategoriesCubit>(
            create: (_) => CategoriesCubit(repository)),
        BlocProvider<ServiceDetailCubit>(
            create: (_) => ServiceDetailCubit(repository)),
        BlocProvider<ServiceBookingFormCubit>(
            create: (_) => ServiceBookingFormCubit(repository)),
        BlocProvider<ServicesCubit>(create: (_) => ServicesCubit(repository)),
      ],
      child: MaterialApp(
        // title: 'Flutter Demo',
        // home: const Home(),
        // home: const ServiceDetail(),
        home: const ServiceBookingPage(),
        // home: const ServiceBookingForm(),
        debugShowCheckedModeBanner: false,
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
        body: Column(
          children: [
            const Categories(),
            Expanded(
              child: Services(
                onItemPressed: (service) {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const ServiceDetail()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
