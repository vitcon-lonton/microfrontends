part of 'booking_detail.dart';

class BookingDetailPage extends StatefulWidget {
  final int id;

  const BookingDetailPage({Key? key, required this.id}) : super(key: key);

  @override
  State<BookingDetailPage> createState() => _BookingDetailPageState();
}

class _BookingDetailPageState extends State<BookingDetailPage> {
  @override
  Widget build(BuildContext context) {
    final bookingId = widget.id;
    final txtOrderCode = tr(LocaleKeys.txt_order_code);

    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: getIt<BookingDetailCubit>()),
        BlocProvider.value(value: getIt<BookingCancelCubit>()),
        BlocProvider.value(value: getIt<BookingConfirmCubit>()),
      ],
      child: MultiBlocListener(
        listeners: [
          // LISTENER DETAIL
          BlocListener<BookingDetailCubit, BookingDetailState>(
              listener: (context, state) {}),

          // LISTENER CANCEL
          BlocListener<BookingCancelCubit, BookingCancelState>(
              listener: (context, state) {
            state.whenOrNull(cancelSuccess: () {
              return context
                  .read<BookingDetailCubit>()
                  .detailRequested(bookingId);
            }, cancelFailure: (failure) {
              return context
                  .read<BookingDetailCubit>()
                  .detailRequested(bookingId);
            });
          }),

          // LISTENER CONFIRM
          BlocListener<BookingConfirmCubit, BookingConfirmState>(
              listener: (context, state) {
            state.whenOrNull(confirmSuccess: () {
              return context
                  .read<BookingDetailCubit>()
                  .detailRequested(bookingId);
            }, confirmFailure: (failure) {
              return context
                  .read<BookingDetailCubit>()
                  .detailRequested(bookingId);
            });
          }),
        ],
        child: Scaffold(
          // APP BAR
          appBar: AppBar(title:
              BlocBuilder<BookingDetailCubit, BookingDetailState>(
                  builder: (context, state) {
            return state.maybeWhen(
                founded: (booking) =>
                    Text('$txtOrderCode: #${booking.sku ?? ''}'),
                orElse: () => kSpaceZero);
          })),

          // BODY
          body: RefreshLoadmore(
            isLastPage: true,
            noMoreWidget: kSpaceZero,
            child: BookingInfo(bookingId),
            onRefresh: () {
              return context
                  .read<BookingDetailCubit>()
                  .detailRequested(bookingId);
            },
          ),

          // // BOTTOM NAVIGATION BAR
          // bottomNavigationBar: Padding(
          //     child: Row(children: const [OrderCancelButton()]),
          //     padding: const EdgeInsets.all(kSpaceM)),

          // BOTTOM NAVIGATION BAR
          bottomNavigationBar:
              BlocBuilder<BookingDetailCubit, BookingDetailState>(
                  builder: (context, state) {
            return state.maybeWhen(founded: (booking) {
              return Padding(
                  child: booking.status.maybeWhen(pending: () {
                    return Row(children: [OrderCancelButton(bookingId)]);
                  }, confirm: () {
                    return Row(children: [
                      OrderRejectButton(bookingId),
                      kHSpaceM,
                      OrderConfirmButton(bookingId),
                    ]);
                  }, orElse: () {
                    return kSpaceZero;
                  }),
                  padding: const EdgeInsets.all(kSpaceM));
            }, orElse: () {
              return kSpaceZero;
            });
          }),

          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
