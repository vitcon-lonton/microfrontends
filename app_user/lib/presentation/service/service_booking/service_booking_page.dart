import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme_manager/theme_manager.dart';
import 'package:app_user/i18n/i18n.dart';
import 'package:app_user/injection.dart';
import 'package:app_user/module/cart/cart.dart';
import 'package:app_user/module/service/service.dart';
import 'package:app_user/presentation/routes/routes.dart';
import 'package:app_user/presentation/service/service.dart';

class ServiceBookingPage extends StatelessWidget {
  final int serviceId;

  const ServiceBookingPage({
    Key? key,
    required this.serviceId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => getIt<ServiceDetailCubit>()),
          BlocProvider(create: (_) => getIt<CartItemCreateCubit>()),
          BlocProvider(create: (_) => getIt<ServiceCheckingCubit>()),
        ],
        child: MultiBlocListener(
            listeners: [
              // LISTEN LOADING SERVICE DETAIL
              BlocListener<ServiceDetailCubit, ServiceDetailState>(
                  listener: (context, state) {
                state.whenOrNull(founded: (service) {
                  return context
                      .read<ServiceCheckingCubit>()
                      .serviceChanged(service);
                });
              }),

              // LISTEN ADD ITEM TO CART
              BlocListener<CartItemCreateCubit, CartItemCreateState>(
                  listener: (context, state) => state.mapOrNull(
                      createSuccess: (state) =>
                          context.router.push(const CartPageRoute()),
                      createFailure: (state) => ScaffoldMessenger.of(context)
                          .showSnackBar(const SnackBar(
                              behavior: SnackBarBehavior.floating,
                              content: Text('Unexpected error.'))))),

              //
              // LISTEN SERVICE CHECKING
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
                // APP BAR
                AppBar(
                  actions: [
                    Row(children: [FavoriteButton(serviceId: serviceId)])
                  ],
                  actionsIconTheme: const IconThemeData.fallback()
                      .copyWith(color: Theme.of(context).colorScheme.onPrimary),
                  backgroundColor: Theme.of(context).primaryColor,
                ),

                // DETAIL
                ServiceDetail(id: serviceId),
                kVSpaceL,
                kVSpaceL,
                Row(children: const [
                  kHSpaceM,
                  Text('Pick your time'),
                  kHSpaceM
                ]),

                // BOOKING FORM
                kVSpaceL,
                const ServiceBookingForm(),
                kVSpaceL,
              ]),

              // NAVIGATION_BAR
              bottomNavigationBar:
                  BlocBuilder<CartItemCreateCubit, CartItemCreateState>(
                      builder: (context, state) {
                return state.maybeWhen(orElse: () {
                  return BottomNav.submit(
                      child: Text(tr(LocaleKeys.txt_add_to_cart)),
                      onPressed: () {
                        context
                            .read<CartItemCreateCubit>()
                            .created(CartItem.random(serviceId: serviceId));
                      });
                }, actionInProgress: () {
                  return BottomNav.submit(
                      onPressed: null, child: const Text('...'));
                });
              }),
            )));
  }
}
