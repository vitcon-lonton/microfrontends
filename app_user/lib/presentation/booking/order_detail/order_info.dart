/* spell-checker: disable */
part of 'order_detail.dart';

class OrderInfo extends StatefulWidget {
  final int id;

  const OrderInfo({Key? key, required this.id}) : super(key: key);

  @override
  State<OrderInfo> createState() => _OrderInfoState();
}

class _OrderInfoState extends State<OrderInfo> {
  @override
  Widget build(BuildContext context) {
    final txtPayment = tr(LocaleKeys.txt_payment);
    final txtCod = tr(LocaleKeys.txt_cod).toUpperCase();
    final txtTechnician = tr(LocaleKeys.txt_technician);
    final txtPaymentPrice = tr(LocaleKeys.txt_payment_price);
    final txtExecutionTime = tr(LocaleKeys.txt_execution_time);
    final txtExecutionAddress = tr(LocaleKeys.txt_execution_address);

    return BlocProvider.value(
      value: context.read<OrderDetailCubit>()..detailRequested(widget.id),
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
              if (state.booking == null) return kSpaceZero;

              Booking booking = state.booking!;
              String name = booking.fullName;
              // final status = order.status;
              String address = booking.address ?? '';
              String price = '${booking.priceTotal} VND';
              String date = booking.timeBoxingStart?.toIso8601String() ?? '';

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
                        title: txtExecutionAddress,
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
                        title: txtExecutionTime,
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
                        title: txtTechnician,
                        icon: const Icon(Icons.person_outline_rounded),
                        content: Expanded(
                          child: Row(
                            children: [
                              Text('$txtTechnician Name | 9999999999'),
                              const Spacer(),
                              const Icon(Icons.phone, size: 16),
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
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '${tr(LocaleKeys.txt_note)}: ',
                                style:
                                    const TextStyle(color: Color(0xFF009B19)),
                              ),
                              TextSpan(text: tr(LocaleKeys.note_1)),
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
                      _horizontalPaddingM(Row(children: [
                        Text(txtPayment),
                        const Spacer(),
                        Text(txtCod),
                      ])),
                      kVSpaceM,
                    ],

                    // PRICE
                    ...[
                      const Divider(height: 8.0, thickness: 8.0),
                      // kVSpaceL,
                      kVSpaceM,
                      _horizontalPaddingM(Row(children: [
                        Text(txtPaymentPrice),
                        const Spacer(),
                        Text(price)
                      ])),
                      kVSpaceM,
                    ],
                  ],
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start);
            },
            buildWhen: (prev, cur) => prev.booking != cur.booking,
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
