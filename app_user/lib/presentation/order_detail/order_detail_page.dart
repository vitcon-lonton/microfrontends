part of 'order_detail.dart';

class OrderDetailPage extends StatefulWidget {
  const OrderDetailPage({Key? key}) : super(key: key);

  @override
  State<OrderDetailPage> createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends State<OrderDetailPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<OrderDetailCubit>(
      create: (context) =>
          context.read<OrderDetailCubit>()..getOrderRequested(),
      child: BlocListener<OrderDetailCubit, OrderDetailState>(
        listener: (context, state) {},
        child: Scaffold(
          // APP_BAR
          appBar: AppBar(
              centerTitle: false,
              title: BlocBuilder<OrderDetailCubit, OrderDetailState>(
                  buildWhen: (prev, cur) => prev.order != cur.order,
                  builder: (context, state) =>
                      Text('Order ${state.order?.id.getOrCrash() ?? ''}'))),

          // BODY
          body: BlocBuilder<OrderDetailCubit, OrderDetailState>(
              buildWhen: (prev, cur) => prev.order != cur.order,
              builder: (context, state) {
                if (state.order == null) return kSpaceZero;

                final order = state.order!;
                final name = order.name;
                // final status = order.status;
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
                        kVSpaceS,
                        _horizontalPaddingM(const StatusTimeline()),

                        // INFO
                        kVSpaceL,
                        _horizontalPaddingM(SizedBox.fromSize(
                          size: const Size.fromHeight(100),
                          child: Row(children: [
                            Expanded(
                              child: Container(
                                height: 100,
                                child: const Icon(Icons.room_service, size: 50),
                                decoration: BoxDecoration(border: Border.all()),
                              ),
                            ),
                            kHSpaceM,
                            Expanded(
                              flex: 2,
                              child: DefaultTextStyle(
                                  maxLines: 2,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .copyWith(fontSize: 14),
                                  overflow: TextOverflow.ellipsis,
                                  child: Column(
                                      children: [
                                        Text(name, maxLines: 2),
                                        kVSpaceM,
                                        Text(price,
                                            maxLines: 1,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineLarge!
                                                .copyWith(fontSize: 16))
                                      ],
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start)),
                            )
                          ]),
                        )),

                        // CANCEL ORDER
                        const OrderCancelButton(),

                        // ADDRESS
                        ...[
                          kVSpaceL,
                          _horizontalPaddingM(const Text('Booking Address ')),
                          kVSpaceS,
                          _horizontalPaddingM(Row(children: [
                            kHSpaceM,
                            Expanded(
                              child: Column(children: [
                                Text(address,
                                    maxLines: 2,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6!
                                        .copyWith(fontSize: 14),
                                    overflow: TextOverflow.ellipsis),
                              ]),
                            ),
                            kHSpaceM,
                          ]))
                        ],

                        // TIME
                        ...[
                          kVSpaceL,
                          _horizontalPaddingM(const Text('Time')),
                          kVSpaceS,
                          DefaultTextStyle(
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              child: Column(
                                children: [
                                  Row(children: [
                                    kHSpaceS,
                                    const Icon(Icons.calendar_month_outlined),
                                    kHSpaceXXS,
                                    Text(date),
                                    kHSpaceS,
                                  ]),
                                  kVSpaceXXS,
                                  Row(children: [
                                    kHSpaceS,
                                    const Icon(Icons.timer_sharp),
                                    kHSpaceXXS,
                                    Text(time),
                                    kHSpaceS,
                                  ]),
                                ],
                              ),
                              style: Theme.of(context).textTheme.bodyMedium!),
                        ],

                        // KTV
                        ...[
                          kVSpaceL,
                          _horizontalPaddingM(const Text('Technician')),
                          kVSpaceS,
                          _horizontalPaddingM(Row(children: [
                            Column(children: const [
                              Text('Technician Name'),
                              kVSpaceXXS,
                              Text('9999999999')
                            ], crossAxisAlignment: CrossAxisAlignment.start),
                            const Spacer(),
                            IconButton(
                                iconSize: 40,
                                onPressed: () {},
                                icon: const Icon(Icons.phone))
                          ])),
                          kVSpaceL,
                        ],

                        // NOTE
                        ...[
                          const Divider(height: 0),
                          kVSpaceL,
                          _horizontalPaddingM(Row(children: const [
                            Text('Note'),
                            Spacer(),
                          ])),
                          kVSpaceXXS,
                          _horizontalPaddingM(const Text(
                              'Giá đã thay đổi, bao gồm phí đi lại, nguyên vật liệu thêm sau quá trình khảo sát',
                              maxLines: 5,
                              overflow: TextOverflow.ellipsis)),
                          kVSpaceL,
                        ],

                        // PRICE
                        ...[
                          const Divider(height: 0),
                          kVSpaceL,
                          _horizontalPaddingM(Row(children: const [
                            Text('Payment method'),
                            Spacer(),
                            Text('COD'),
                          ])),
                          kVSpaceL,
                        ],

                        // PRICE
                        ...[
                          const Divider(height: 0),
                          kVSpaceL,
                          _horizontalPaddingM(Row(children: [
                            const Text('Last price'),
                            const Spacer(),
                            Text(price)
                          ])),
                          kVSpaceL,
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

  Future<void> _onRefresh() async {
    // context.read<OrderDetailCubit>().refreshRequested();
    await context.read<OrderDetailCubit>().getOrderRequested();
  }

  Widget _horizontalPaddingM(Widget child) {
    return Padding(
        child: child, padding: const EdgeInsets.symmetric(horizontal: kSpaceM));
  }
}
