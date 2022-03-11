/* spell-checker: disable */
part of 'order_detail.dart';

class OrderDetailPage extends StatefulWidget {
  const OrderDetailPage({Key? key}) : super(key: key);

  @override
  State<OrderDetailPage> createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends State<OrderDetailPage> {
  final UniqueId id = UniqueId();

  @override
  Widget build(BuildContext context) {
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
                buildWhen: (prev, cur) => prev.order != cur.order,
                builder: (context, state) =>
                    Text('Order ${state.order?.id.getOrCrash() ?? ''}')),
          ),

          // BODY
          body: RefreshLoadmore(
            isLastPage: true,
            child: const OrderInfo(),
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
