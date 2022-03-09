import 'package:app_user/module/booking/booking.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme_manager/theme_manager.dart';
import 'package:app_user/injection.dart';
import 'package:app_user/module/service/service.dart';
import 'package:app_user/presentation/routes/router.gr.dart';
import 'package:app_user/presentation/service/service.dart';

class ServiceBookingPage extends StatelessWidget {
  const ServiceBookingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => getIt<CartCubit>()),
          BlocProvider(create: (_) => getIt<ServiceCheckingCubit>()),
          BlocProvider(
            create: (_) => getIt<ServiceDetailCubit>()..getDetailRequested(),
          ),
        ],
        child: MultiBlocListener(
            listeners: [
              //
              BlocListener<ServiceDetailCubit, ServiceDetailState>(
                  listenWhen: (prev, cur) => prev.service != cur.service,
                  listener: (context, state) => context
                      .read<ServiceCheckingCubit>()
                      .serviceChanged(state.service)),

              //
              BlocListener<CartCubit, CartState>(
                listenWhen: (prev, cur) =>
                    prev.addFailureOrSuccessOption !=
                    cur.addFailureOrSuccessOption,
                listener: (context, state) {
                  state.addFailureOrSuccessOption.fold(() {}, (either) {
                    either.fold((failure) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          behavior: SnackBarBehavior.floating,
                          content: Text('Server error')));
                    }, (_) {
                      context.router.push(const CartPageRoute());
                    });
                  });
                },
              ),

              //
              // BlocListener<ServiceCheckingCubit, ServiceCheckingState>(
              //     listenWhen: (prev, cur) =>
              //         prev.failureOrSuccessOption != cur.failureOrSuccessOption,
              //     listener: (context, state) {
              //       state.failureOrSuccessOption.fold(() {}, (either) {
              //         either.fold((failure) {
              //           ScaffoldMessenger.of(context).showSnackBar(
              //               const SnackBar(
              //                   behavior: SnackBarBehavior.floating,
              //                   content: Text('Server error')));
              //         }, (_) {
              //           context.router.push(const CartPageRoute());
              //         });
              //       });
              //     }),
            ],
            child: Scaffold(
              // BODY
              body: ListView(children: [
                const ServiceDetail(),
                kVSpaceL,
                kVSpaceL,
                Row(children: const [
                  kHSpaceM,
                  Text('Pick your time'),
                  kHSpaceM
                ]),
                kVSpaceL,
                const ServiceBookingForm(),
                kVSpaceL,
              ]),

              // APP_BAR
              // appBar: AppBar(backgroundColor: Colors.transparent,),

              // NAVIGATION_BAR
              bottomNavigationBar: BlocBuilder<CartCubit, CartState>(
                  buildWhen: (prev, cur) => prev.isAdding != cur.isAdding,
                  builder: (context, state) => BottomNav.submit(
                      onPressed: state.isAdding
                          ? null
                          : context.read<CartCubit>().addItemRequested,
                      child: Text(state.isAdding ? '...' : 'ADD TO CART'))),
            )));
  }
}
