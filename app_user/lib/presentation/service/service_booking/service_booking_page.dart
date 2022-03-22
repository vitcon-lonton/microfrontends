import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme_manager/theme_manager.dart';
import 'package:app_user/i18n/i18n.dart';
import 'package:app_user/injection.dart';
import 'package:app_user/module/cart/cart.dart';
import 'package:app_user/module/favorite/favorite.dart';
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
          BlocProvider(create: (_) => getIt<FavoriteCreateCubit>()),
          BlocProvider(create: (_) => getIt<FavoriteDeleteCubit>()),
          BlocProvider(create: (_) {
            return getIt<FavoriteAlreadyExistCubit>()
              ..initialized(optionOf(serviceId))
              ..findItemRequested();
          }),
        ],
        child: MultiBlocListener(
            listeners: [
              // LISTEN LOADING SERVICE DETAIL
              BlocListener<ServiceDetailCubit, ServiceDetailState>(
                  listenWhen: (prev, cur) => prev.service != cur.service,
                  listener: (context, state) => context
                      .read<ServiceCheckingCubit>()
                      .serviceChanged(state.service)),

              // LISTEN ADD ITEM TO CART
              BlocListener<CartItemCreateCubit, CartItemCreateState>(
                  listener: (context, state) => state.mapOrNull(
                      createSuccess: (state) =>
                          context.router.push(const CartPageRoute()),
                      createFailure: (state) => ScaffoldMessenger.of(context)
                          .showSnackBar(const SnackBar(
                              behavior: SnackBarBehavior.floating,
                              content: Text('Unexpected error.'))))),

              // LISTEN FAVORITE CREATE
              BlocListener<FavoriteDeleteCubit, FavoriteDeleteState>(
                  listener: (context, state) => state.mapOrNull(
                      deleteSuccess: (state) => context
                          .read<FavoriteAlreadyExistCubit>()
                          .findItemRequested(),
                      deleteFailure: (state) => ScaffoldMessenger.of(context)
                          .showSnackBar(const SnackBar(
                              behavior: SnackBarBehavior.floating,
                              content: Text(
                                  'Unexpected error occurred while deleting.'))))),

              // LISTEN FAVORITE DELETE
              BlocListener<FavoriteCreateCubit, FavoriteCreateState>(
                  listener: (context, state) => state.mapOrNull(
                      createSuccess: (state) => context
                          .read<FavoriteAlreadyExistCubit>()
                          .findItemRequested(),
                      createFailure: (state) => ScaffoldMessenger.of(context)
                          .showSnackBar(const SnackBar(
                              behavior: SnackBarBehavior.floating,
                              content: Text('Unexpected error.'))))),

              // LISTEN FAVORITE FAILURE
              // BlocListener<FavoriteAlreadyExistCubit,
              //         FavoriteAlreadyExistState>(
              //     listenWhen: (prev, cur) =>
              //         prev.failureOption != cur.failureOption,
              //     listener: (context, state) =>
              //         state.failureOption.fold(() {}, (failure) {
              //           ScaffoldMessenger.of(context).showSnackBar(
              //               const SnackBar(
              //                   behavior: SnackBarBehavior.floating,
              //                   content: Text('Server error')));
              //         })),

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
                  backgroundColor: Theme.of(context).primaryColor,
                  actionsIconTheme: const IconThemeData.fallback()
                      .copyWith(color: Theme.of(context).colorScheme.onPrimary),
                  actions: [
                    Row(children: [
                      BlocBuilder<FavoriteAlreadyExistCubit,
                          FavoriteAlreadyExistState>(buildWhen: (prev, cur) {
                        return prev.isLoading != cur.isLoading ||
                            prev.isAlreadyExist != cur.isAlreadyExist;
                      }, builder: (context, state) {
                        if (state.isLoading) {
                          return IconButton(
                              onPressed: null,
                              icon: CircularProgressIndicator(
                                  strokeWidth: 2.0,
                                  color:
                                      Theme.of(context).colorScheme.onPrimary));
                        }

                        return IconButton(
                            onPressed: state.isAlreadyExist
                                ? () => context
                                    .read<FavoriteDeleteCubit>()
                                    .deleted(serviceId)
                                : () => context
                                    .read<FavoriteCreateCubit>()
                                    .created(serviceId),
                            icon: Icon(state.isAlreadyExist
                                ? Icons.favorite
                                : Icons.favorite_border_outlined));
                      }),
                    ])
                  ],
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
                      builder: (context, state) => state.maybeMap(
                          orElse: () => BottomNav.submit(
                              child: Text(tr(LocaleKeys.txt_add_to_cart)),
                              onPressed: () => context
                                  .read<CartItemCreateCubit>()
                                  .created(CartItem.random())),
                          actionInProgress: (state) => BottomNav.submit(
                              onPressed: null, child: const Text('...')))),
            )));
  }
}
