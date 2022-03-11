/* spell-checker: disable */
part of 'order_detail.dart';

class OrderInfo extends StatefulWidget {
  const OrderInfo({Key? key}) : super(key: key);

  @override
  State<OrderInfo> createState() => _OrderInfoState();
}

class _OrderInfoState extends State<OrderInfo> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: context.read<OrderDetailCubit>()..detailRequested(UniqueId()),
      child: Column(
        children: [
          // PROGRESS INDICATOR
          ...[
            BlocBuilder<OrderDetailCubit, OrderDetailState>(
                builder: (context, state) => state.isLoading
                    ? const LinearProgressIndicator()
                    : kVSpaceXXS,
                buildWhen: (prev, cur) => prev.isLoading != cur.isLoading),
            kVSpaceS,
          ],

          // INFO
          BlocBuilder<OrderDetailCubit, OrderDetailState>(
            builder: (context, state) {
              if (state.order == null) return kSpaceZero;

              final order = state.order!;
              final name = order.name;
              // final status = order.status;
              final address = order.address;
              final price = '${order.price} VND';
              final date = order.time.toIso8601String();

              return Column(
                  children: [
                    // STATUS
                    ...[
                      _horizontalPaddingM(const StatusTimeline()),
                      kVSpaceM,
                    ],

                    // ADDRESS
                    ...[
                      const Divider(height: 8.0, thickness: 8.0),
                      kVSpaceM,
                      _section(
                        title: 'Booking Address',
                        icon: const Icon(Icons.pin_drop_outlined),
                        content: Text(address),
                      ),
                      kVSpaceM,
                    ],

                    // TIME
                    ...[
                      _horizontalPaddingM(const Divider(height: 0)),
                      kVSpaceM,
                      _section(
                        title: 'Time',
                        icon: const Icon(Icons.calendar_month_outlined),
                        content: Text(date),
                      ),
                      kVSpaceM,
                    ],

                    // KTV
                    ...[
                      _horizontalPaddingM(const Divider(height: 0)),
                      kVSpaceM,
                      _section(
                        title: 'Technician',
                        icon: const Icon(Icons.person_outline_rounded),
                        content: Expanded(
                          child: Row(
                            children: const [
                              Text('Technician Name | 9999999999'),
                              Spacer(),
                              Icon(Icons.phone, size: 16),
                            ],
                          ),
                        ),
                      ),
                      kVSpaceM,
                    ],

                    // INFO
                    ...[
                      const Divider(height: 8.0, thickness: 8.0),
                      kVSpaceM,
                      _horizontalPaddingM(Container(
                        padding: const EdgeInsets.all(kSpaceS),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF7F8FA),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: SizedBox.fromSize(
                          size: const Size.fromHeight(60),
                          child: Row(children: [
                            SizedBox(
                              width: 60,
                              height: 60,
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(width: 0.25),
                                  borderRadius: BorderRadius.circular(2),
                                ),
                                child: const Icon(
                                  Icons.room_service,
                                  size: 60,
                                ),
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
                                        kVSpaceXS,
                                        Text(name, maxLines: 1),
                                        kVSpaceXS,
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
                        ),
                      )),
                      kVSpaceM,
                    ],

                    // NOTE
                    ...[
                      const Divider(height: 8.0, thickness: 8.0),
                      kVSpaceM,
                      _horizontalPaddingM(
                        RichText(
                          maxLines: 5,
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: 'Note: ',
                                style: TextStyle(color: Color(0xFF009B19)),
                              ),
                              TextSpan(
                                text:
                                    'Giá đã thay đổi, bao gồm phí đi lại, nguyên vật liệu thêm sau quá trình khảo sát',
                              ),
                            ],
                          ),
                        ),
                      ),
                      kVSpaceM,
                    ],

                    // PAYMENT METHOD
                    ...[
                      const Divider(height: 8.0, thickness: 8.0),
                      kVSpaceM,
                      _horizontalPaddingM(Row(children: const [
                        Text('Payment method'),
                        Spacer(),
                        Text('COD'),
                      ])),
                      kVSpaceM,
                    ],

                    // PRICE
                    ...[
                      const Divider(height: 8.0, thickness: 8.0),
                      // kVSpaceL,
                      kVSpaceM,
                      _horizontalPaddingM(Row(children: [
                        const Text('Last price'),
                        const Spacer(),
                        Text(price)
                      ])),
                      kVSpaceM,
                    ],
                  ],
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start);
            },
            buildWhen: (prev, cur) => prev.order != cur.order,
          ),
        ],
      ),
    );
  }

  Widget _section(
      {required String title, required Widget icon, required Widget content}) {
    return _horizontalPaddingM(Column(children: [
      Row(children: [
        IconTheme(
            child: icon,
            data: IconThemeData(color: Theme.of(context).primaryColor)),
        kHSpaceS,
        Text(title),
      ]),
      kVSpaceXXS,
      Row(children: [kHSpaceXL, kHSpaceXXS, content]),
    ], crossAxisAlignment: CrossAxisAlignment.start));
  }

  Widget _horizontalPaddingM(Widget child) {
    return Padding(
        child: child, padding: const EdgeInsets.symmetric(horizontal: kSpaceM));
  }
}
