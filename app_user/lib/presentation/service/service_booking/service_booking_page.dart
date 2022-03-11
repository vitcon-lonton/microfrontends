import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme_manager/theme_manager.dart';
import 'package:app_user/injection.dart';
import 'package:app_user/module/cart/cart.dart';
import 'package:app_user/module/favorite/favorite.dart';
import 'package:app_user/module/service/service.dart';
import 'package:app_user/presentation/routes/router.gr.dart';
import 'package:app_user/presentation/service/service.dart';

class ServiceBookingPage extends StatelessWidget {
  const ServiceBookingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => getIt<FavoriteCubit>()),
          BlocProvider(create: (_) => getIt<CartCreateCubit>()),
          BlocProvider(create: (_) => getIt<ServiceDetailCubit>()),
          BlocProvider(create: (_) => getIt<ServiceCheckingCubit>()),
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
              BlocListener<CartCreateCubit, CartCreateState>(
                  listener: (context, state) => state.mapOrNull(
                      createSuccess: (state) =>
                          context.router.push(const CartPageRoute()),
                      createFailure: (state) => ScaffoldMessenger.of(context)
                          .showSnackBar(const SnackBar(
                              behavior: SnackBarBehavior.floating,
                              content: Text('Unexpected error.'))))),

              // LISTEN FAVORITE FAILURE
              BlocListener<FavoriteCubit, FavoriteState>(
                  listener: (context, state) =>
                      state.failureOption.fold(() {}, (failure) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                behavior: SnackBarBehavior.floating,
                                content: Text('Server error')));
                      })),

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
                // APP_BAR
                AppBar(
                  backgroundColor: Theme.of(context).primaryColor,
                  actionsIconTheme: const IconThemeData.fallback()
                      .copyWith(color: Theme.of(context).colorScheme.onPrimary),
                  actions: [
                    Row(children: [
                      BlocBuilder<FavoriteCubit, FavoriteState>(
                          buildWhen: (prev, cur) =>
                              prev.isLiked != cur.isLiked ||
                              prev.isLoading != cur.isLoading,
                          builder: (context, state) {
                            if (state.isLoading) {
                              return IconButton(
                                  onPressed: null,
                                  icon: CircularProgressIndicator(
                                      strokeWidth: 2.0,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary));
                            }

                            return IconButton(
                                icon: Icon(state.isLiked
                                    ? Icons.favorite
                                    : Icons.favorite_border_outlined),
                                onPressed: context
                                    .read<FavoriteCubit>()
                                    .toggleFavoriteRequested);
                          }),
                    ])
                  ],
                ),

                // DETAIL
                const ServiceDetail(),
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
                  BlocBuilder<CartCreateCubit, CartCreateState>(
                      builder: (context, state) => state.maybeMap(
                          orElse: () => BottomNav.submit(
                              child: const Text('ADD TO CART'),
                              onPressed: () => context
                                  .read<CartCreateCubit>()
                                  .created(CartItem.random())),
                          actionInProgress: (state) => BottomNav.submit(
                              onPressed: null, child: const Text('...')))),
            )));
  }
}
