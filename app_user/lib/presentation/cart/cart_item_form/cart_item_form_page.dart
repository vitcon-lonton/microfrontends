part of 'cart_item_form.dart';

class CartItemFormPage extends StatelessWidget {
  final CartItem? cartItem;

  const CartItemFormPage({Key? key, this.cartItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final txtDescription = tr(LocaleKeys.txt_description);

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) {
          if (cartItem == null) {
            return getIt<ServiceDetailCubit>();
          }

          return getIt<ServiceDetailCubit>()
            ..getDetailRequested(cartItem!.serviceId);
        }),
        BlocProvider(create: (_) => getIt<CartItemUpdateCubit>()),
        BlocProvider(create: (_) => getIt<ServiceCheckingCubit>()),
        BlocProvider(create: (_) {
          return getIt<CartItemFormCubit>()..initialized(optionOf(cartItem));
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
          ],
          child: Scaffold(
            // BODY
            body: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: ListView(children: [
                // DETAIL LOADING
                BlocBuilder<ServiceDetailCubit, ServiceDetailState>(
                    builder: (context, state) => !state.isSubmitting
                        ? kSpaceZero
                        : const LinearProgressIndicator(),
                    buildWhen: (prev, cur) =>
                        prev.isSubmitting != cur.isSubmitting),

                // DETAIL
                BlocBuilder<ServiceDetailCubit, ServiceDetailState>(
                    buildWhen: (prev, cur) => prev.service != cur.service,
                    builder: (context, state) => state.service != null
                        ? ServiceTile(service: state.service!)
                        : kSpaceZero),

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
                        validator: (_) => state.cartItem.note?.value.fold(
                            (failure) => '$txtDescription Invalid',
                            (_) => null),
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
            appBar: AppBar(title: Text(tr(LocaleKeys.txt_update))),

            // NAVIGATION_BAR
            bottomNavigationBar:
                BlocBuilder<CartItemFormCubit, CartItemFormState>(
                    builder: (context, state) {
                      return state.isSaving || !state.isValid
                          ? BottomNav.submit(
                              onPressed: null, child: const Text('...'))
                          : BottomNav.submit(
                              child: Text(tr(LocaleKeys.txt_update)),
                              onPressed:
                                  context.read<CartItemFormCubit>().saved);
                    },
                    buildWhen: (prev, cur) =>
                        prev.isValid != cur.isValid ||
                        prev.isSaving != cur.isSaving),
          )),
    );
  }
}
