import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_user/injection.dart';
import 'package:app_user/module/service/service.dart';
import 'services.dart';

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
