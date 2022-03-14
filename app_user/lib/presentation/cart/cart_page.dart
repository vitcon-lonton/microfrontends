/* spell-checker: disable */
part of 'cart.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _OrderHistoriesPageState();
}

class _OrderHistoriesPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final txtEdit = tr(LocaleKeys.txt_edit);
    final txtMyShoppingCart = tr(LocaleKeys.txt_my_shopping_cart);
    final txtExecutionAddress = tr(LocaleKeys.txt_execution_address);

    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: getIt<CartCreateCubit>()),
        BlocProvider.value(value: getIt<CartDeleteCubit>()),
        BlocProvider.value(value: getIt<CartAllCubit>()..getAllRequested()),
        BlocProvider.value(value: getIt<OrderCreateCubit>()),
      ],
      child: MultiBlocListener(
        // LISTENERS
        listeners: [
          // LISTEN CREATE
          BlocListener<CartCreateCubit, CartCreateState>(
              listener: (context, state) => state.mapOrNull(
                  createSuccess: (state) =>
                      context.read<CartAllCubit>().getAllRequested(),
                  createFailure: (state) => ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(
                          behavior: SnackBarBehavior.floating,
                          content: Text('Unexpected error.'))))),

          // LISTEN DELETE
          BlocListener<CartDeleteCubit, CartDeleteState>(
              listener: (context, state) => state.mapOrNull(
                  deleteSuccess: (state) =>
                      context.read<CartAllCubit>().getAllRequested(),
                  deleteFailure: (state) => ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(
                          behavior: SnackBarBehavior.floating,
                          content: Text(
                              'Unexpected error occurred while deleting.'))))),
        ],

        // CHILD
        child: Scaffold(
          // BODY
          body: RefreshLoadmore(
            isLastPage: true,
            noMoreWidget: kSpaceZero,
            onRefresh: () async {
              context.read<CartAllCubit>().refreshRequested();
              await context.read<CartAllCubit>().getAllRequested();
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
                // kVSpaceM,
                Row(children: const [kHSpaceM, Text('Detail'), kHSpaceM]),
                kVSpaceS,
                BlocBuilder<CartAllCubit, CartAllState>(
                  buildWhen: (prev, cur) => prev.items != cur.items,
                  builder: (context, state) {
                    final items = state.items;

                    return ListView.separated(
                      shrinkWrap: true,
                      itemCount: items.length,
                      separatorBuilder: (_, index) => kVSpaceXS,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.symmetric(horizontal: kSpaceM),
                      itemBuilder: (_, index) {
                        return CartItemTile(item: items[index]);
                      },
                    );
                  },
                )
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
          floatingActionButton: BlocBuilder<CartCreateCubit, CartCreateState>(
              builder: (context, state) => state.maybeMap(
                  orElse: () => FloatingActionButton(
                      child: const Icon(Icons.add),
                      onPressed: () => context
                          .read<CartCreateCubit>()
                          .created(CartItem.random())),
                  actionInProgress: (state) => FloatingActionButton(
                      onPressed: null,
                      child: CircularProgressIndicator(
                          color: Theme.of(context).colorScheme.onPrimary)))),
        ),
      ),
    );
  }
}
