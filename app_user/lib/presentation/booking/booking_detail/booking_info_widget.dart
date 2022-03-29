/* spell-checker: disable */
part of 'booking_detail.dart';

class BookingInfoWidget extends StatefulWidget {
  final int id;

  const BookingInfoWidget(this.id, {Key? key}) : super(key: key);

  @override
  State<BookingInfoWidget> createState() => _BookingInfoWidgetState();
}

class _BookingInfoWidgetState extends State<BookingInfoWidget> {
  @override
  Widget build(BuildContext context) {
    final txtPayment = tr(LocaleKeys.txt_payment);
    final txtCod = tr(LocaleKeys.txt_cod).toUpperCase();
    final txtPaymentPrice = tr(LocaleKeys.txt_payment_price);
    final txtExecutionTime = tr(LocaleKeys.txt_execution_time);
    final txtExecutionAddress = tr(LocaleKeys.txt_execution_address);

    return BlocProvider.value(
      value: context.read<BookingDetailCubit>()..detailRequested(widget.id),
      child: Column(children: [
        // PROGRESS INDICATOR
        ...[
          BlocBuilder<BookingDetailCubit, BookingDetailState>(
              builder: (context, state) {
            return state.maybeWhen(inProgress: () {
              return const LinearProgressIndicator();
            }, orElse: () {
              return kVSpaceXXS;
            });
          }),
          kVSpaceS,
        ],

        // INFO
        BlocBuilder<BookingDetailCubit, BookingDetailState>(
          builder: (context, state) {
            return state.maybeWhen(founded: (booking) {
              BookingStatus status = booking.status;
              String address = booking.address ?? '';
              String price = '${booking.priceTotal} VND';
              String date = booking.timeBoxingStart?.toIso8601String() ?? '';

              return Column(
                  children: [
                    // STATUS
                    ...[
                      _horizontalPaddingM(StatusTimeline(status)),
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
                    _horizontalPaddingM(const Divider(height: 0)),
                    kVSpaceM,
                    _section(
                      title: txtExecutionTime,
                      icon: const Icon(Icons.calendar_month_outlined),
                      content: Text(date),
                    ),
                    kVSpaceM,

                    // KTV
                    BookingTechnicianInfo(widget.id),

                    // INFO
                    const Divider(height: 8.0, thickness: 8.0),
                    kVSpaceM,
                    BookingServicesWidget(widget.id),
                    kVSpaceM,

                    // NOTE
                    const Divider(height: 8.0, thickness: 8.0),
                    kVSpaceM,
                    BookingStatusInfo(status),
                    kVSpaceM,

                    // PAYMENT METHOD
                    const Divider(height: 8.0, thickness: 8.0),
                    kVSpaceM,
                    _horizontalPaddingM(Row(children: [
                      Text(txtPayment),
                      const Spacer(),
                      Text(txtCod),
                    ])),
                    kVSpaceM,

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
            }, orElse: () {
              return kSpaceZero;
            });
          },
        ),
      ]),
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
