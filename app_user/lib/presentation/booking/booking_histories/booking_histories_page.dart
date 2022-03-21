// ignore_for_file: unused_element
part of 'booking_histories.dart';

class BookingHistoriesPage extends StatefulWidget {
  const BookingHistoriesPage({Key? key}) : super(key: key);

  @override
  State<BookingHistoriesPage> createState() => _BookingHistoriesPageState();
}

class _BookingHistoriesPageState extends State<BookingHistoriesPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((duration) {});
  }

  Future<void> _onRefresh() async {
    context.read<BookingHistoriesCubit>().refreshRequested();
    await context.read<BookingHistoriesCubit>().getOrdersRequested();
  }

  Future<void> _onLoadMore() async {
    final state = context.read<BookingHistoriesCubit>().state;
    final currentPage = state.page;
    final totalPage = state.pageCount;
    final nextPage = currentPage + 1;

    if (nextPage > totalPage) return;

    context.read<BookingHistoriesCubit>().pageNumberChanged(nextPage);
    await context.read<BookingHistoriesCubit>().getOrdersRequested();
  }

  @override
  Widget build(BuildContext context) {
    final txtOrderHistory = tr(LocaleKeys.txt_order_history);

    return BlocProvider<BookingHistoriesCubit>(
      create: (context) => getIt<BookingHistoriesCubit>()..getOrdersRequested(),
      child: Scaffold(
        appBar: AppBar(title: Text(txtOrderHistory)),
        body: BlocBuilder<BookingHistoriesCubit, BookingHistoriesState>(
          buildWhen: (prev, cur) => prev.bookings != cur.bookings,
          builder: (context, state) {
            final bookings = state.bookings;

            return RefreshLoadmore(
              // onRefresh: _onRefresh,
              // onLoadmore: _onLoadMore,
              isLastPage: state.isLastPage,
              noMoreWidget: Text('No more data, you are at the end',
                  style: TextStyle(color: Theme.of(context).disabledColor)),
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: bookings.size,
                separatorBuilder: (_, index) => kVSpaceM,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: kSpaceM),
                itemBuilder: (_, index) => BookingTile(item: bookings[index]),
              ),
              onRefresh: () async {
                context.read<BookingHistoriesCubit>().refreshRequested();
                await context
                    .read<BookingHistoriesCubit>()
                    .getOrdersRequested();
              },
              onLoadmore: () async {
                final state = context.read<BookingHistoriesCubit>().state;
                final currentPage = state.page;
                final totalPage = state.pageCount;
                final nextPage = currentPage + 1;

                if (nextPage > totalPage) return;

                context
                    .read<BookingHistoriesCubit>()
                    .pageNumberChanged(nextPage);
                await context
                    .read<BookingHistoriesCubit>()
                    .getOrdersRequested();
              },
            );
          },
        ),
      ),
    );
  }
}
