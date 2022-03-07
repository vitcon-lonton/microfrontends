part of 'order_histories.dart';

class OrderHistoriesPage extends StatefulWidget {
  const OrderHistoriesPage({Key? key}) : super(key: key);

  @override
  State<OrderHistoriesPage> createState() => _OrderHistoriesPageState();
}

class _OrderHistoriesPageState extends State<OrderHistoriesPage> {
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
        child: Scaffold(
          appBar: AppBar(
            centerTitle: false,
            title: const Text('Order History'),
          ),
          body: BlocBuilder<OrderHistoriesCubit, OrderHistoriesState>(
            buildWhen: (prev, cur) => prev.isSubmitting != cur.isSubmitting,
            builder: (context, state) {
              final orders = state.ordersOption
                  .foldRight(<Order>[], (orders, previous) => orders);

              return RefreshLoadmore(
                onRefresh: _onRefresh,
                onLoadmore: _onLoadMore,
                isLastPage: state.isLastPage,
                noMoreWidget: Text('No more data, you are at the end',
                    style: TextStyle(color: Theme.of(context).disabledColor)),
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: orders.length,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (_, index) => const Divider(height: 0),
                  itemBuilder: (_, index) => OrderTile(order: orders[index]),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
