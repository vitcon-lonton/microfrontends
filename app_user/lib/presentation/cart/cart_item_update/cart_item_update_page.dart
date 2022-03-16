part of 'cart_item_update.dart';

class CartItemUpdatePage extends StatelessWidget {
  const CartItemUpdatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final txtDescription = tr(LocaleKeys.txt_description);

    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => getIt<FavoriteCubit>()),
          BlocProvider(create: (_) => getIt<CartUpdateCubit>()),
          BlocProvider(create: (_) {
            return getIt<ServiceDetailCubit>()..getDetailRequested(1);
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
              BlocListener<CartUpdateCubit, CartUpdateState>(
                  listener: (context, state) => state.mapOrNull(
                      updateSuccess: (state) =>
                          context.router.push(const CartPageRoute()),
                      updateFailure: (state) => ScaffoldMessenger.of(context)
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
            ],
            child: Scaffold(
              // BODY
              body: ListView(children: [
                // DETAIL
                BlocBuilder<ServiceDetailCubit, ServiceDetailState>(
                    buildWhen: (prev, cur) =>
                        prev.service != cur.service ||
                        prev.isSubmitting != cur.isSubmitting,
                    builder: (context, state) {
                      if (state.isSubmitting) {
                        return IconButton(
                            onPressed: null,
                            icon: CircularProgressIndicator(
                                strokeWidth: 2.0,
                                color:
                                    Theme.of(context).colorScheme.onPrimary));
                      }

                      if (state.service == null) {
                        return IconButton(
                            onPressed: null,
                            icon: CircularProgressIndicator(
                                strokeWidth: 2.0,
                                color:
                                    Theme.of(context).colorScheme.onPrimary));
                      }

                      return ServiceTile(service: state.service!);
                    }),
                kVSpaceL,
                Padding(
                  child: TextFormField(
                      onChanged: (value) {},
                      initialValue: '123123',
                      validator: (_) => null,
                      decoration: InputDecoration(labelText: txtDescription)),
                  padding: const EdgeInsets.symmetric(horizontal: kSpaceS),
                ),
                kVSpaceL,

                const Padding(
                  child: CartImagesSelector(),
                  padding: EdgeInsets.symmetric(horizontal: kSpaceS),
                ),

                // Row(children: const [
                //   kHSpaceM,
                //   Text('Pick your time'),
                //   kHSpaceM
                // ]),

                // BOOKING FORM
                kVSpaceL,
                // const ServiceBookingForm(),
                kVSpaceL,
              ]),

              // APP BAR
              appBar: AppBar(title: Text(tr(LocaleKeys.txt_update))),

              // NAVIGATION_BAR
              bottomNavigationBar:
                  BlocBuilder<CartUpdateCubit, CartUpdateState>(
                      builder: (context, state) => state.maybeMap(
                          orElse: () => BottomNav.submit(
                              child: Text(tr(LocaleKeys.txt_update)),
                              onPressed: () => context
                                  .read<CartUpdateCubit>()
                                  .updated(CartItem.random())),
                          actionInProgress: (state) => BottomNav.submit(
                              onPressed: null, child: const Text('...')))),
            )));
  }
}
