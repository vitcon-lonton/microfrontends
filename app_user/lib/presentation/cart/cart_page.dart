/* spell-checker: disable */
part of 'cart.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _OrderHistoriesPageState();
}

class _OrderHistoriesPageState extends State<CartPage> {
  Future<void> _onRefresh() async {
    context.read<CartCubit>().refreshRequested();
    await context.read<CartCubit>().getCartRequested();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CartCubit>(
      create: (context) => getIt<CartCubit>()..getCartRequested(),
      child: MultiBlocListener(
        // LISTENERS
        listeners: [
          BlocListener<CartCubit, CartState>(
            listenWhen: (prev, cur) =>
                prev.addFailureOrSuccessOption != cur.addFailureOrSuccessOption,
            listener: (context, state) {
              state.addFailureOrSuccessOption.fold(() {}, (either) {
                final mess = either.fold((failure) {
                  return 'Server error';
                }, (_) => 'Success');

                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    behavior: SnackBarBehavior.floating, content: Text(mess)));

                context.read<CartCubit>().getCartRequested();
              });
            },
          ),
          BlocListener<CartCubit, CartState>(
            listenWhen: (prev, cur) =>
                prev.removeFailureOrSuccessOption !=
                cur.removeFailureOrSuccessOption,
            listener: (context, state) {
              state.removeFailureOrSuccessOption.fold(() {}, (either) {
                final mess = either.fold((failure) {
                  return 'Server error';
                }, (_) => 'Success');

                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    behavior: SnackBarBehavior.floating, content: Text(mess)));

                context.read<CartCubit>().getCartRequested();
              });
            },
          ),
          BlocListener<CartCubit, CartState>(
            listenWhen: (prev, cur) =>
                prev.submitFailureOrSuccessOption !=
                cur.submitFailureOrSuccessOption,
            listener: (context, state) {
              state.submitFailureOrSuccessOption.fold(() {}, (either) {
                final mess = either.fold((failure) {
                  return 'Server error';
                }, (_) => 'Success');

                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    behavior: SnackBarBehavior.floating, content: Text(mess)));
              });
            },
          )
        ],

        // CHILD
        child: Scaffold(
          // BODY
          body: BlocBuilder<CartCubit, CartState>(
            buildWhen: (prev, cur) => prev.items != cur.items,
            builder: (context, state) {
              final items = state.items;

              return RefreshLoadmore(
                isLastPage: true,
                onRefresh: _onRefresh,
                // onRefresh: () async {
                //   context.read<CartCubit>().refreshRequested();
                //   await context.read<CartCubit>().getCartRequested();
                // },
                noMoreWidget: kSpaceZero,
                child: Column(children: [
                  // ADDRESS
                  ...[
                    kVSpaceS,
                    Row(children: [
                      kHSpaceM,
                      const Text('Address'),
                      const Spacer(),
                      Link(text: 'Edit', onTap: () {}),
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
                    kVSpaceM,
                    Row(children: const [kHSpaceM, Text('Detail'), kHSpaceM]),
                    kVSpaceS,
                    ListView.separated(
                        padding:
                            const EdgeInsets.symmetric(horizontal: kSpaceM),
                        shrinkWrap: true,
                        itemCount: items.length,
                        itemBuilder: (_, index) =>
                            CartItemTile(item: items[index]),
                        separatorBuilder: (_, index) => kVSpaceXS,
                        physics: const NeverScrollableScrollPhysics()),
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
              );
            },
          ),

          // FLOATING ACTION
          floatingActionButton: BlocBuilder<CartCubit, CartState>(
              builder: (context, state) => FloatingActionButton(
                  child: state.isAdding
                      ? const CircularProgressIndicator()
                      : const Icon(Icons.add),
                  onPressed: state.isAdding
                      ? null
                      : context.read<CartCubit>().addItemRequested),
              buildWhen: (prev, cur) => prev.isAdding != cur.isAdding),

          // BOTTOM NAVIGATION_BAR
          bottomNavigationBar: const CartRequestBtn(),

          // APP_BAR
          appBar: AppBar(title: const Text('My Cart')),
        ),
      ),
    );
  }
}
