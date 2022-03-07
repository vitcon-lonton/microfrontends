import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:service/service.dart';
import 'package:theme_manager/theme_manager.dart';
import 'package:app_user/injection.dart';
import 'package:app_user/presentation/routes/router.gr.dart';
import 'package:app_user/presentation/service/service.dart';

class ServiceBookingPage extends StatelessWidget {
  const ServiceBookingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<ServiceBookingFormCubit>(
              create: (_) => getIt<ServiceBookingFormCubit>()),
          BlocProvider<ServiceDetailCubit>(
              create: (_) => getIt<ServiceDetailCubit>()..getDetailRequested()),
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
                  listener: (context, state) {
                    state.bookingFailureOrSuccessOption.fold(() {}, (either) {
                      either.fold((failure) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                behavior: SnackBarBehavior.floating,
                                content: Text('Server error')));
                      }, (_) {
                        context.router.push(const CartPageRoute());
                      });
                    });
                  }),
            ],
            child: Scaffold(
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
                  builder: (context, state) => BottomNav.submit(
                      onPressed: state.isSubmitting
                          ? null
                          : context.read<ServiceBookingFormCubit>().submitted,
                      child: Text(state.isSubmitting ? '...' : 'ADD TO CART'))),
            )));
  }
}
