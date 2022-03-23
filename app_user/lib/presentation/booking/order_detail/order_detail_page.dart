/* spell-checker: disable */
part of 'order_detail.dart';

class BookingDetailPage extends StatefulWidget {
  final int id;

  const BookingDetailPage({Key? key, required this.id}) : super(key: key);

  @override
  State<BookingDetailPage> createState() => _BookingDetailPageState();
}

class _BookingDetailPageState extends State<BookingDetailPage> {
  @override
  Widget build(BuildContext context) {
    final id = widget.id;
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
              listener: (context, state) => state.maybeWhen(
                  orElse: () => null,
                  deleteSuccess: () =>
                      context.read<OrderDetailCubit>().detailRequested(id),
                  deleteFailure: (failure) =>
                      context.read<OrderDetailCubit>().detailRequested(id))),

          // LISTENER CONFIRM
          BlocListener<OrderConfirmCubit, OrderConfirmState>(
              listener: (context, state) => state.maybeWhen(
                  orElse: () => null,
                  confirmSuccess: () =>
                      context.read<OrderDetailCubit>().detailRequested(id),
                  confirmFailure: (failure) =>
                      context.read<OrderDetailCubit>().detailRequested(id))),
        ],
        child: Scaffold(
          // APP BAR
          appBar: AppBar(
            title: BlocBuilder<OrderDetailCubit, OrderDetailState>(
                buildWhen: (prev, cur) => prev.booking != cur.booking,
                builder: (context, state) =>
                    Text('$txtOrderCode: #${state.booking?.sku ?? ''}')),
          ),

          // BODY
          body: RefreshLoadmore(
            isLastPage: true,
            child: OrderInfo(id: id),
            noMoreWidget: kSpaceZero,
            onRefresh: () =>
                context.read<OrderDetailCubit>().detailRequested(id),
          ),

          // // BOTTOM NAVIGATION BAR
          // bottomNavigationBar: Padding(
          //     child: Row(children: const [OrderCancelButton()]),
          //     padding: const EdgeInsets.all(kSpaceM)),

          // BOTTOM NAVIGATION BAR
          bottomNavigationBar: Padding(
              child: Row(children: const [
                OrderRejectButton(),
                kHSpaceM,
                OrderConfirmButton(),
              ]),
              padding: const EdgeInsets.all(kSpaceM)),

          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
