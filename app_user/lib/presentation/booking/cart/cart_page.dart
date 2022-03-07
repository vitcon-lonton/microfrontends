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
                        kHSpaceL,
                        kHSpaceXXL,
                        Expanded(
                          child: Text(
                              '261 Tran Binh Trong, Ward 4, District 5, Ho Chi Minh City',
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.headline6),
                        ),
                        kHSpaceXXL,
                        kHSpaceL,
                      ]),
                    ],

                    // LIST CART ITEM
                    ...[
                      kVSpaceL,
                      const Divider(height: 0),
                      kVSpaceM,
                      Row(children: const [kHSpaceM, Text('Detail'), kHSpaceM]),
                      kVSpaceS,
                      ListView.separated(
                          shrinkWrap: true,
                          itemCount: items.length,
                          itemBuilder: (_, index) =>
                              CartItemTile(item: items[index]),
                          separatorBuilder: (_, index) =>
                              const Divider(height: 0),
                          physics: const NeverScrollableScrollPhysics()),
                      const Divider(height: 0),
                    ],

                    // NOTE
                    ...[
                      kVSpaceXL,
                      const Divider(height: 0),
                      kVSpaceL,
                      const Padding(
                          child: Text(
                              'Đây là yêu cầu báo giá, sau khi gửi yêu cầu, nhân viên tư vấn sẽ liên hệ chốt giá và lựa chọn kỹ thuật viên phù hợp sau cho từng dịch vụ'),
                          padding: EdgeInsets.symmetric(horizontal: kSpaceXL)),
                      kVSpaceL,
                      const Divider(height: 0),
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
            bottomNavigationBar: BlocBuilder<CartCubit, CartState>(
                builder: (context, state) {
                  final isSubmitAvailable = state.isSubmitAvailable;
                  final title = isSubmitAvailable ? 'SEND REQUEST' : '...';

                  return BottomNav.submit(
                      child: Text(title),
                      onPressed: isSubmitAvailable
                          ? context.read<CartCubit>().submitBookingRequested
                          : null);
                },
                buildWhen: (prev, cur) =>
                    prev.isSubmitAvailable != cur.isSubmitAvailable),

            // APP_BAR
            appBar: AppBar(title: const Text('My Cart'))),
      ),
    );
  }
}
