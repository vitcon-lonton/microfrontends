import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme_manager/theme_manager.dart';
import 'package:app_user/i18n/i18n.dart';
import 'package:app_user/injection.dart';
import 'package:app_user/module/cart/cart.dart';
import 'package:app_user/module/service/service.dart';
import 'package:app_user/presentation/routes/routes.dart';
import 'package:app_user/presentation/service/service.dart';
import 'service_booking_time.dart';

class ServiceBookingPage extends StatelessWidget {
  final int serviceId;

  const ServiceBookingPage({
    Key? key,
    required this.serviceId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final txtAddToCart = tr(LocaleKeys.txt_add_to_cart);

    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: getIt<ServiceDetailCubit>()),
        BlocProvider.value(value: getIt<CartItemCreateCubit>()),
        BlocProvider.value(
          value: getIt<CartItemFormCubit>()
            ..initialized(optionOf(CartItem.empty(serviceId: serviceId))),
        ),
      ],
      child: MultiBlocListener(
          listeners: [
            // LISTEN LOADING SERVICE DETAIL
            BlocListener<ServiceDetailCubit, ServiceDetailState>(
                listener: (context, state) {
              state.whenOrNull(founded: (service) {});
            }),

            // LISTEN ADD ITEM TO CART
            BlocListener<CartItemCreateCubit, CartItemCreateState>(
                listener: (context, state) {
              state.mapOrNull(createSuccess: (state) {
                return context.router.push(const CartPageRoute());
              }, createFailure: (state) {
                return ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        behavior: SnackBarBehavior.floating,
                        content: Text('Unexpected error.')));
              });
            }),

            // LISTEN ADD ITEM TO CART
            BlocListener<CartItemFormCubit, CartItemFormState>(
                listener: (context, state) {
              state.saveFailureOrSuccessOption.fold(() {}, (either) {
                either.fold((failure) {
                  return ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          behavior: SnackBarBehavior.floating,
                          content: Text('Unexpected error.')));
                }, (_) {
                  return context.router.push(const CartPageRoute());
                });
              });
            }),
          ],
          child: Scaffold(
            // BODY
            body: ListView(children: [
              // APP BAR
              AppBar(
                actions: [
                  Row(children: [FavoriteButton(serviceId: serviceId)])
                ],
                backgroundColor: Theme.of(context).primaryColor,
                actionsIconTheme: const IconThemeData.fallback()
                    .copyWith(color: Theme.of(context).colorScheme.onPrimary),
              ),

              // DETAIL
              ServiceDetail(id: serviceId),
              kVSpaceL,
              Row(children: const [kHSpaceM, Text('Pick your time'), kHSpaceM]),

              // BOOKING FORM
              kVSpaceL,
              BlocBuilder<CartItemFormCubit, CartItemFormState>(
                  builder: ((context, state) {
                return ServiceBookingTime(
                  onChanged: context.read<CartItemFormCubit>().timeChanged,
                );
              }), buildWhen: (prev, cur) {
                return false;
              }),

              kVSpaceL,
            ]),

            // NAVIGATION BAR
            bottomNavigationBar:
                BlocBuilder<CartItemFormCubit, CartItemFormState>(
                    builder: (context, state) {
              if (state.isSaving) {
                return BottomNav.submit(
                    onPressed: null, child: const Text('...'));
              }

              if (!state.isValid) {
                return BottomNav.submit(
                    onPressed: null, child: Text(txtAddToCart));
              }

              return BottomNav.submit(
                  child: Text(txtAddToCart),
                  onPressed: () => context.read<CartItemFormCubit>().saved());
            }),
          )),
    );
  }
}
