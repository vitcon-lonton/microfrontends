part of 'cart_item_form.dart';

class CartItemFormPage extends StatelessWidget {
  final CartItem? cartItem;

  const CartItemFormPage({Key? key, this.cartItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final txtUpdate = tr(LocaleKeys.txt_update);
    final txtDescription = tr(LocaleKeys.txt_description);

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) {
          return cartItem == null
              ? getIt<ServiceDetailCubit>()
              : getIt<ServiceDetailCubit>()
            ..getDetailRequested(cartItem!.serviceId);
        }),
        BlocProvider.value(value: getIt<CartItemUpdateCubit>()),
        BlocProvider.value(
          value: getIt<CartItemFormCubit>()..initialized(optionOf(cartItem)),
        ),
      ],
      child: MultiBlocListener(
          listeners: [
            // LISTEN LOADING SERVICE DETAIL
            BlocListener<ServiceDetailCubit, ServiceDetailState>(
                listener: (context, state) {
              state.whenOrNull(founded: (service) {});
            }),

            // LISTEN UPDATE CART ITEM
            BlocListener<CartItemUpdateCubit, CartItemUpdateState>(
                listener: (context, state) => state.mapOrNull(
                    updateSuccess: (state) =>
                        context.router.push(const CartPageRoute()),
                    updateFailure: (state) => ScaffoldMessenger.of(context)
                        .showSnackBar(const SnackBar(
                            behavior: SnackBarBehavior.floating,
                            content: Text('Unexpected error.'))))),

            // LISTEN CART ITEM SERVICE ID
            BlocListener<CartItemFormCubit, CartItemFormState>(
                listenWhen: (prev, cur) =>
                    prev.cartItem.serviceId != cur.cartItem.serviceId,
                listener: (context, state) => context
                    .read<ServiceDetailCubit>()
                    .getDetailRequested(state.cartItem.serviceId)),

            // LISTEN UPDATE SUCCESS
            BlocListener<CartItemFormCubit, CartItemFormState>(
                listenWhen: (prev, cur) =>
                    prev.saveFailureOrSuccessOption !=
                    cur.saveFailureOrSuccessOption,
                listener: (context, state) {
                  state.saveFailureOrSuccessOption.fold(() {}, (either) {
                    either.fold((failure) {
                      return ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Unexpected error.')));
                    }, (_) {
                      return context.router.pop();
                    });
                  });
                }),
          ],
          child: Scaffold(
            // BODY
            body: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: ListView(children: [
                // DETAIL LOADING
                BlocBuilder<ServiceDetailCubit, ServiceDetailState>(
                    builder: (context, state) {
                  return state.maybeWhen(
                      inProgress: () => const LinearProgressIndicator(),
                      orElse: () => kSpaceZero);
                }),

                // DETAIL
                BlocBuilder<ServiceDetailCubit, ServiceDetailState>(
                    builder: (context, state) {
                  return state.maybeWhen(
                      orElse: () => kSpaceZero,
                      founded: (service) => ServiceTile(service: service));
                }),

                // NOTE EDITOR
                kVSpaceL,
                BlocBuilder<CartItemFormCubit, CartItemFormState>(
                  buildWhen: (prev, cur) =>
                      prev.cartItem.note != cur.cartItem.note,
                  builder: (context, state) => Padding(
                    child: TextFormField(
                        initialValue: state.cartItem.note?.value
                            .fold((failure) => null, (str) => str),
                        decoration: InputDecoration(labelText: txtDescription),
                        validator: (_) {
                          return context
                              .read<CartItemFormCubit>()
                              .state
                              .cartItem
                              .note
                              ?.value
                              .fold((failure) {
                            return '$txtDescription Invalid';
                          }, (_) => null);
                        },
                        maxLines: 8,
                        onChanged:
                            context.read<CartItemFormCubit>().noteChanged),
                    padding: const EdgeInsets.symmetric(horizontal: kSpaceS),
                  ),
                ),

                // IMAGES SELECTOR
                kVSpaceL,
                const Padding(
                    child: CartItemImagesSelector(),
                    padding: EdgeInsets.symmetric(horizontal: kSpaceS)),

                BlocBuilder<CartItemFormCubit, CartItemFormState>(
                  buildWhen: (prev, cur) =>
                      prev.cartItem.base64Images != cur.cartItem.base64Images,
                  builder: (context, state) {
                    if (state.cartItem.base64Images?.isValid() ?? true) {
                      return kSpaceZero;
                    }

                    return Padding(
                        child: Text('Max image picker is 6',
                            style: const TextStyle(fontSize: 12.5)
                                .copyWith(color: Theme.of(context).errorColor)),
                        padding: const EdgeInsets.symmetric(horizontal: kSpaceS)
                            .copyWith(top: kSpaceS));
                  },
                ),

                // BOOKING FORM
                kVSpaceL,
                // const ServiceBookingForm(),
                kVSpaceL,
              ]),
            ),

            // APP BAR
            appBar: AppBar(title: Text(txtUpdate)),

            // NAVIGATION_BAR
            bottomNavigationBar:
                BlocBuilder<CartItemFormCubit, CartItemFormState>(
                    builder: (context, state) {
                      if (state.isSaving) {
                        return BottomNav.submit(
                            onPressed: null, child: const Text('...'));
                      }

                      if (!state.isValid) {
                        return BottomNav.submit(
                            onPressed: null, child: Text(txtUpdate));
                      }

                      return BottomNav.submit(
                          child: Text(txtUpdate),
                          onPressed: context.read<CartItemFormCubit>().saved);
                    },
                    buildWhen: (prev, cur) =>
                        prev.isValid != cur.isValid ||
                        prev.isSaving != cur.isSaving),
          )),
    );
  }
}
