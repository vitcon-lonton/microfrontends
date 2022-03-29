/* spell-checker: disable */
part of 'booking_detail.dart';

class BookingServicesWidget extends StatefulWidget {
  final int bookingId;

  const BookingServicesWidget(this.bookingId, {Key? key}) : super(key: key);

  @override
  State<BookingServicesWidget> createState() => _BookingServicesWidgetState();
}

class _BookingServicesWidgetState extends State<BookingServicesWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<BookingServicesFindCubit>()..findRequested(widget.bookingId),
      child: BlocBuilder<BookingServicesFindCubit, BookingServicesFindState>(
        builder: (context, state) {
          return state.maybeWhen(founded: (ids) {
            return ListView.separated(
              shrinkWrap: true,
              itemCount: ids.size,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) => kVSpaceS,
              itemBuilder: (context, index) =>
                  BookingServiceTile(ids.get(index)),
            );
          }, orElse: () {
            return kSpaceZero;
          });
        },
      ),
    );
  }
}
