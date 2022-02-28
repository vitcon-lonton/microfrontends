part of 'notifications.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  Future<void> _onRefresh() async {
    context.read<NotificationsCubit>().refreshRequested();
    await context.read<NotificationsCubit>().getOrdersRequested();
  }

  Future<void> _onLoadMore() async {
    final state = context.read<NotificationsCubit>().state;
    final currentPage = state.page;
    final totalPage = state.pageCount;
    final nextPage = currentPage + 1;

    if (nextPage > totalPage) return;

    context.read<NotificationsCubit>().pageNumberChanged(nextPage);
    await context.read<NotificationsCubit>().getOrdersRequested();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NotificationsCubit>(
      create: (context) =>
          context.read<NotificationsCubit>()..getOrdersRequested(),
      child: BlocListener<NotificationsCubit, NotificationsState>(
        listener: (context, state) {},
        child: WScaffold(
          appBar: const WAppBar(
              backgroundColor: Colors.white, title: Text('Notifications')),
          body: BlocBuilder<NotificationsCubit, NotificationsState>(
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
