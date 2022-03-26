/* spell-checker: disable */
part of 'booking_detail.dart';

class BookingTechInfo extends StatefulWidget {
  final int id;

  const BookingTechInfo(this.id, {Key? key}) : super(key: key);

  @override
  State<BookingTechInfo> createState() => BookingTechInfoState();
}

class BookingTechInfoState extends State<BookingTechInfo> {
  @override
  Widget build(BuildContext context) {
    final txtTechnician = tr(LocaleKeys.txt_technician);

    return BlocProvider.value(
      value: getIt<TechnicianInfoCubit>()..getTechnicianRequested(widget.id),
      child: BlocBuilder<TechnicianInfoCubit, TechnicianInfoState>(
          builder: (context, state) {
        return state.maybeWhen(
            orElse: () => const LinearProgressIndicator(),
            founded: (technician) {
              final name = technician.name;
              final phone = technician.phone;

              return Column(
                  children: [
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
                              Text('$txtTechnician $name | $phone'),
                              const Spacer(),
                              const Icon(Icons.phone, size: 16),
                            ],
                          ),
                        ),
                      ),
                      kVSpaceM,
                    ],
                  ],
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start);
            });
      }),
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
