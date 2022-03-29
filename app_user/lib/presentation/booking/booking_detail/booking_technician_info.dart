part of 'booking_detail.dart';

class BookingTechnicianInfo extends StatefulWidget {
  final int bookingId;

  const BookingTechnicianInfo(this.bookingId, {Key? key}) : super(key: key);

  @override
  State<BookingTechnicianInfo> createState() =>
      BookingBookingTechnicianFindState();
}

class BookingBookingTechnicianFindState extends State<BookingTechnicianInfo> {
  @override
  Widget build(BuildContext context) {
    final txtTechnician = tr(LocaleKeys.txt_technician);

    return BlocProvider.value(
      value: getIt<BookingTechnicianFindCubit>()
        ..findRequested(widget.bookingId),
      child: Column(children: [
        _horizontalPaddingM(const Divider(height: 0)),
        kVSpaceM,
        _section(
          title: txtTechnician,
          icon: const Icon(Icons.person_outline_rounded),
          content: Expanded(child: BlocBuilder<BookingTechnicianFindCubit,
              BookingTechnicianFindState>(builder: (context, state) {
            return state.maybeWhen(founded: (technician) {
              return Row(children: [
                Text(
                  '$txtTechnician ${technician.name} | ${technician.phone}',
                ),
                const Spacer(),
                const Icon(Icons.phone, size: 16),
              ]);
            }, orElse: () {
              return Row(children: const [Text('Finding ...')]);
            });
          })),
        ),
        kVSpaceM,
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
