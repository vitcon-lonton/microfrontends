import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:service/service.dart';
import 'package:app_user/injection.dart';
import 'package:app_user/presentation/service/service.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ServicesCubit>.value(
      value: getIt<ServicesCubit>()..getServicesRequested(),
      child: Scaffold(
        body: const Services(),
        appBar: AppBar(title: const Text('Services')),
      ),
    );
  }
}
