part of 'notifications.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  Future<void> _onRefresh() async {
    context.read<OrderHistoriesCubit>().refreshRequested();
    await context.read<OrderHistoriesCubit>().getOrdersRequested();
  }

  Future<void> _onLoadMore() async {
    final state = context.read<OrderHistoriesCubit>().state;
    final currentPage = state.page;
    final totalPage = state.pageCount;
    final nextPage = currentPage + 1;

    if (nextPage > totalPage) return;

    context.read<OrderHistoriesCubit>().pageNumberChanged(nextPage);
    await context.read<OrderHistoriesCubit>().getOrdersRequested();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OrderHistoriesCubit>(
      create: (context) =>
          context.read<OrderHistoriesCubit>()..getOrdersRequested(),
      child: BlocListener<OrderHistoriesCubit, OrderHistoriesState>(
        listener: (context, state) {},
        child: WScaffold(
          appBar: const WAppBar(
              backgroundColor: Colors.white, title: Text('Notifications')),
          body: BlocBuilder<OrderHistoriesCubit, OrderHistoriesState>(
            buildWhen: (prev, cur) => prev.isSubmitting != cur.isSubmitting,
            builder: (context, state) {
              final orders = state.ordersOption
                  .foldRight(<Order>[], (orders, previous) => orders);

              return RefreshLoadmore(
                onRefresh: _onRefresh,
                onLoadmore: _onLoadMore,
                isLastPage: state.isLastPage,
                noMoreWidget: Text(
                  'No more data, you are at the end',
                  style: TextStyle(
                    fontSize: 18,
                    color: Theme.of(context).disabledColor,
                  ),
                ),
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: orders.length,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (_, index) => const Divider(height: 0),
                  itemBuilder: (_, index) {
                    return NotificationTile(order: orders[index]);
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
