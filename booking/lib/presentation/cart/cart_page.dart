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
      create: (context) => context.read<CartCubit>()..getCartRequested(),
      child: MultiBlocListener(
        // LISTENERS
        listeners: [
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

            // BOTTOM NAVIGATION_BAR
            bottomNavigationBar: BlocBuilder<CartCubit, CartState>(
                builder: (_, state) {
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
            appBar: AppBar(centerTitle: false, title: const Text('My Cart'))),
      ),
    );
  }
}
// context.read<CartCubit>().submitBookingRequested