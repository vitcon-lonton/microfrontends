part of 'order_detail.dart';

class OrderDetailPage extends StatefulWidget {
  const OrderDetailPage({Key? key}) : super(key: key);

  @override
  State<OrderDetailPage> createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends State<OrderDetailPage> {
  Future<void> _onRefresh() async {
    context.read<OrderHistoriesCubit>().refreshRequested();
    await context.read<OrderHistoriesCubit>().getOrdersRequested();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OrderHistoriesCubit>(
      create: (context) =>
          context.read<OrderHistoriesCubit>()..getOrdersRequested(),
      child: BlocListener<OrderHistoriesCubit, OrderHistoriesState>(
        listener: (context, state) {},
        child: WScaffold(
          // APP_BAR
          appBar: WAppBar(
              title: BlocBuilder<OrderDetailCubit, OrderDetailState>(
                  buildWhen: (prev, cur) => prev.order != cur.order,
                  builder: (context, state) => Text(
                      'Order ${state.order?.id.value.foldRight('', (string, prev) => string)}')),
              backgroundColor: Colors.white),

          // BODY
          body: BlocBuilder<OrderDetailCubit, OrderDetailState>(
              buildWhen: (prev, cur) => prev.order != cur.order,
              builder: (context, state) {
                if (state.order == null) return kSpaceZero;

                final order = state.order!;
                final name = order.name;
                final status = order.status;
                final address = order.address;
                final price = '${order.price} VND';
                final date = order.time.toIso8601String();
                final time = order.time.toIso8601String();

                return RefreshLoadmore(
                  isLastPage: true,
                  onRefresh: _onRefresh,
                  noMoreWidget: kSpaceZero,
                  child: ListView(
                      children: [
                        // STATUS
                        kVSpaceM,
                        OrderStatusView(status: status),

                        // INFO
                        kVSpaceL,
                        Row(children: [
                          const Expanded(child: Icon(Icons.room_service)),
                          Text(name),
                          Text(price),
                        ]),

                        // CANCEL ORDER
                        if (true) ...[
                          kVSpaceL,
                          WSubmitBtn(
                              onPressed: () {},
                              child: const Text('CANCEL ORDER'))
                        ],

                        // ADDRESS
                        ...[
                          kVSpaceL,
                          const Text('Booking Address'),
                          Row(children: [
                            kHSpaceL,
                            Text(address,
                                maxLines: 2, overflow: TextOverflow.ellipsis),
                            kHSpaceL,
                          ])
                        ],

                        // TIME
                        ...[
                          kVSpaceL,
                          const Text('Time'),
                          DefaultTextStyle(
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              child: Row(children: [
                                kHSpaceL,
                                const Icon(Icons.calendar_month_outlined),
                                Text(date),
                                const Spacer(),
                                const Icon(Icons.timer_sharp),
                                Text(time),
                                kHSpaceL,
                              ]),
                              style: Theme.of(context).textTheme.bodyMedium!)
                        ],

                        // KTV
                        ...[
                          kVSpaceL,
                          const Text('KTV'),
                          Row(children: [
                            Column(children: const [
                              Text('KTV'),
                              Text('9999999999')
                            ]),
                            IconButton(
                                iconSize: 40,
                                onPressed: () {},
                                icon: const Icon(Icons.phone))
                          ])
                        ],

                        // PRICE
                        ...[
                          kVSpaceL,
                          const Text('Price'),
                          Row(children: [
                            const Text('Last price'),
                            const Spacer(),
                            Text(price)
                          ])
                        ],
                      ],
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics()),
                );
              }),
        ),
      ),
    );
  }
}
