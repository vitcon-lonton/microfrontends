import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme_manager/theme_manager.dart';

import 'package:service/service.dart';

class ServiceBookingPage extends StatelessWidget {
  const ServiceBookingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<ServiceBookingFormCubit>.value(
              value: context.read<ServiceBookingFormCubit>()),
          BlocProvider<ServiceDetailCubit>.value(
              value: context.read<ServiceDetailCubit>()..getDetailRequested()),
        ],
        child: MultiBlocListener(
            listeners: [
              //
              BlocListener<ServiceDetailCubit, ServiceDetailState>(
                  listenWhen: (prev, cur) => prev.service != cur.service,
                  listener: (context, state) => context
                      .read<ServiceBookingFormCubit>()
                      .serviceChanged(state.service)),

              //
              BlocListener<ServiceBookingFormCubit, ServiceBookingFormState>(
                  listenWhen: (prev, cur) =>
                      prev.bookingFailureOrSuccessOption !=
                      cur.bookingFailureOrSuccessOption,
                  listener: (context, state) {}),
            ],
            child: WScaffold(
              // BODY
              body: ListView(children: const [
                ServiceDetail(),
                kVSpaceL,
                kVSpaceL,
                Center(child: Text('Pick your time')),
                kVSpaceL,
                ServiceBookingForm(),
                kVSpaceL,
              ]),

              // APP_BAR
              appBar: AppBar(
                  centerTitle: false,
                  title: BlocBuilder<ServiceDetailCubit, ServiceDetailState>(
                      builder: (context, state) => state.service == null
                          ? kSpaceZero
                          : Text(state.service!.name),
                      buildWhen: (prev, cur) => prev.service != cur.service)),

              // NAVIGATION_BAR
              bottomNavigationBar: BlocBuilder<ServiceBookingFormCubit,
                      ServiceBookingFormState>(
                  buildWhen: (prev, cur) =>
                      prev.isSubmitting != cur.isSubmitting,
                  builder: (_, state) => BottomNav.submit(
                      onPressed: state.isSubmitting
                          ? null
                          : context.read<ServiceBookingFormCubit>().submitted,
                      child: Text(state.isSubmitting ? '...' : 'ADD TO CART'))),
            )));
  }
}
