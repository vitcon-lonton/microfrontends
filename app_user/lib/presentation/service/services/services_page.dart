import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:service/service.dart';
import 'package:app_user/injection.dart';
import 'package:app_user/presentation/routes/router.gr.dart';
import 'package:app_user/presentation/service/service.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ServicesCubit>.value(
      value: getIt<ServicesCubit>()..getServicesRequested(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Services')),
        body: Services(
          onItemPressed: (service) =>
              context.router.push(const ServiceBookingPageRoute()),
        ),
      ),
    );
  }
}
