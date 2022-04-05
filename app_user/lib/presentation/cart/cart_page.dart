/* spell-checker: disable */
part of 'cart.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _BookingHistoriesPageState();
}

class _BookingHistoriesPageState extends State<CartPage> {
  // final CartAllCubit _allCubit = getIt<CartAllCubit>();

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance!.addPostFrameCallback((_) =>
    //     Future.delayed(const Duration(seconds: 1))
    //         .then((value) => _allCubit.getAllRequested()));
  }

  @override
  Widget build(BuildContext context) {
    final txtEdit = tr(LocaleKeys.txt_edit);
    final txtMyShoppingCart = tr(LocaleKeys.txt_my_shopping_cart);
    final txtExecutionAddress = tr(LocaleKeys.txt_execution_address);

    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: getIt<SyncCubit>()),
        BlocProvider.value(value: getIt<CartItemClearCubit>()),
        BlocProvider.value(value: getIt<CartItemCreateCubit>()),
        BlocProvider.value(value: getIt<CartItemDeleteCubit>()),
        BlocProvider.value(value: getIt<CartAllCubit>()..getAllRequested()),
        BlocProvider.value(value: getIt<CartWatcherCubit>()..watchAllStarted()),
      ],
      child: MultiBlocListener(
        // LISTENERS
        listeners: [
          // LISTEN SYNC
          BlocListener<SyncCubit, SyncState>(listener: (context, state) {
            state.whenOrNull(syncSuccess: () {
              return context.read<CartItemClearCubit>().cleared();
            }, syncFailure: (failure) {
              return ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Unable create booking.')));
            });
          }),

          // LISTEN WATCHER
          BlocListener<CartWatcherCubit, CartWatcherState>(
              listenWhen: (prev, cur) {
            return cur.whenOrNull(loadSuccess: (items) => true) ?? false;
          }, listener: (context, state) {
            context.read<CartAllCubit>().getAllRequested();
          }),

          // LISTEN CREATE
          BlocListener<CartItemCreateCubit, CartItemCreateState>(
              listener: (context, state) => state.whenOrNull(
                  createSuccess: () =>
                      context.read<CartAllCubit>().getAllRequested(),
                  createFailure: (failure) => ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(
                          behavior: SnackBarBehavior.floating,
                          content: Text('Unexpected error.'))))),

          // LISTEN DELETE
          BlocListener<CartItemDeleteCubit, CartItemDeleteState>(
              listener: (context, state) => state.whenOrNull(
                  deleteSuccess: () =>
                      context.read<CartAllCubit>().getAllRequested(),
                  deleteFailure: (failure) => ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(
                          behavior: SnackBarBehavior.floating,
                          content: Text(
                              'Unexpected error occurred while deleting.'))))),

          // LISTEN CLEAR
          BlocListener<CartItemClearCubit, CartItemClearState>(
              listener: (context, state) => state.whenOrNull(
                  clearSuccess: () =>
                      context.read<CartAllCubit>().getAllRequested(),
                  clearFailure: () => ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(
                          behavior: SnackBarBehavior.floating,
                          content: Text(
                              'Unexpected error occurred while clear cart.'))))),
        ],

        // CHILD
        child: Scaffold(
          // BODY
          body: RefreshLoadmore(
            isLastPage: true,
            noMoreWidget: kSpaceZero,
            onRefresh: () async {
              context.read<CartAllCubit>()
                ..refreshRequested()
                ..getAllRequested();
            },
            child: Column(children: [
              // ADDRESS
              ...[
                kVSpaceS,
                Row(children: [
                  kHSpaceM,
                  Text(txtExecutionAddress),
                  const Spacer(),
                  Link(text: txtEdit, onTap: () {}),
                  kHSpaceM,
                ]),
                kVSpaceS,
                Row(children: [
                  kHSpaceM,
                  Icon(Icons.location_on,
                      color: Theme.of(context).primaryColor),
                  kHSpaceXS,
                  const Expanded(
                    child: Text(
                        '261 Tran Binh Trong, Ward 4, District 5, Ho Chi Minh City',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis),
                  ),
                  kHSpaceM,
                ]),
              ],

              // LIST CART ITEM
              ...[
                kVSpaceL,
                const Divider(height: 8, thickness: 8),
                // LOADING INDICATOR
                BlocBuilder<CartAllCubit, CartAllState>(buildWhen: (prev, cur) {
                  return prev.isLoading != cur.isLoading;
                }, builder: (context, state) {
                  if (state.isLoading) {
                    return Container(
                        child: const LinearProgressIndicator(),
                        margin: const EdgeInsets.only(bottom: kSpaceS));
                  }

                  return kVSpaceM;
                }),
                // BlocBuilder<CartWatcherCubit, CartWatcherState>(
                //     builder: (context, state) {
                //   return state.maybeWhen(loadInProgress: () {
                //     return Container(
                //         child: const LinearProgressIndicator(),
                //         margin: const EdgeInsets.only(bottom: kSpaceS));
                //   }, orElse: () {
                //     return kVSpaceM;
                //   });
                // }),
                // kVSpaceM,
                Row(children: const [kHSpaceM, Text('Detail'), kHSpaceM]),
                kVSpaceS,
                // BlocBuilder<CartWatcherCubit, CartWatcherState>(
                //     buildWhen: (prev, cur) {
                //   return cur.whenOrNull(loadSuccess: (items) => true) ?? false;
                // }, builder: (context, state) {
                //   return state.maybeWhen(loadSuccess: (items) {
                //     return ListView.separated(
                //       shrinkWrap: true,
                //       itemCount: items.size,
                //       separatorBuilder: (_, index) => kVSpaceXS,
                //       physics: const NeverScrollableScrollPhysics(),
                //       itemBuilder: (_, index) {
                //         return CartItemTile(items[index]);
                //       },
                //       padding: const EdgeInsets.symmetric(horizontal: kSpaceM),
                //     );
                //   }, orElse: () {
                //     return kSpaceZero;
                //   });
                // }),
                BlocBuilder<CartAllCubit, CartAllState>(buildWhen: (prev, cur) {
                  return prev.items != cur.items;
                }, builder: (context, state) {
                  return ListView.separated(
                    shrinkWrap: true,
                    itemCount: state.items.size,
                    separatorBuilder: (_, index) => kVSpaceXS,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (_, index) {
                      return CartItemTile(state.items[index]);
                    },
                    padding: const EdgeInsets.symmetric(horizontal: kSpaceM),
                  );
                })
              ],

              // NOTE
              ...[
                kVSpaceL,
                const Padding(
                    child: CartNote(),
                    padding: EdgeInsets.symmetric(horizontal: kSpaceM)),
                kVSpaceL,
              ],
            ]),
          ),

          // BOTTOM NAVIGATION_BAR
          bottomNavigationBar: const CartRequestBtn(),

          // APP BAR
          appBar: AppBar(title: Text(txtMyShoppingCart)),

          // FLOATING ACTION
          floatingActionButton:
              BlocBuilder<CartItemCreateCubit, CartItemCreateState>(
                  builder: (context, state) {
            return state.maybeWhen(actionInProgress: () {
              return FloatingActionButton(
                  onPressed: null,
                  child: CircularProgressIndicator(
                      color: Theme.of(context).colorScheme.onPrimary));
            }, orElse: () {
              return FloatingActionButton(
                  child: const Icon(Icons.add),
                  onPressed: () => context
                      .read<CartItemCreateCubit>()
                      .created(CartItem.empty(serviceId: 1)));
            });
          }),
        ),
      ),
    );
  }
}
