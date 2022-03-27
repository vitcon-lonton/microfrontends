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
        BlocProvider.value(value: getIt<OrderDetailCubit>()),
        BlocProvider.value(value: getIt<OrderDeleteCubit>()),
        BlocProvider.value(value: getIt<OrderConfirmCubit>()),
      ],
      child: MultiBlocListener(
        listeners: [
          // LISTENER DETAIL
          BlocListener<OrderDetailCubit, OrderDetailState>(
              listener: (context, state) {}),

          // LISTENER DELETE
          BlocListener<OrderDeleteCubit, OrderDeleteState>(
              listener: (context, state) {
            state.whenOrNull(deleteSuccess: () {
              return context
                  .read<OrderDetailCubit>()
                  .detailRequested(bookingId);
            }, deleteFailure: (failure) {
              return context
                  .read<OrderDetailCubit>()
                  .detailRequested(bookingId);
            });
          }),

          // LISTENER CONFIRM
          BlocListener<OrderConfirmCubit, OrderConfirmState>(
              listener: (context, state) {
            state.whenOrNull(confirmSuccess: () {
              return context
                  .read<OrderDetailCubit>()
                  .detailRequested(bookingId);
            }, confirmFailure: (failure) {
              return context
                  .read<OrderDetailCubit>()
                  .detailRequested(bookingId);
            });
          }),
        ],
        child: Scaffold(
          // APP BAR
          appBar: AppBar(title: BlocBuilder<OrderDetailCubit, OrderDetailState>(
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
                  .read<OrderDetailCubit>()
                  .detailRequested(bookingId);
            },
          ),

          // // BOTTOM NAVIGATION BAR
          // bottomNavigationBar: Padding(
          //     child: Row(children: const [OrderCancelButton()]),
          //     padding: const EdgeInsets.all(kSpaceM)),

          // BOTTOM NAVIGATION BAR
          bottomNavigationBar: BlocBuilder<OrderDetailCubit, OrderDetailState>(
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
