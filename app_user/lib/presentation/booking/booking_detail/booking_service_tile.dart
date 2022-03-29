part of 'booking_detail.dart';

class BookingServiceTile extends StatefulWidget {
  final int serviceId;

  const BookingServiceTile(this.serviceId, {Key? key}) : super(key: key);

  @override
  State<BookingServiceTile> createState() => _BookingServiceTileState();
}

class _BookingServiceTileState extends State<BookingServiceTile> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<ServiceDetailCubit>()..getDetailRequested(widget.serviceId),
      child: BlocBuilder<ServiceDetailCubit, ServiceDetailState>(
          builder: (context, state) {
        return state.maybeWhen(founded: (service) {
          final name = service.name;
          final price = '${service.priceApprox} VND';

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: kSpaceM),
            child: Container(
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
                      child: const Icon(Icons.room_service, size: 60),
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start),
                    ),
                  )
                ]),
              ),
            ),
          );
        }, notFound: () {
          return const Text('Not found');
        }, orElse: () {
          return kSpaceZero;
        });
      }),
    );
  }
}
