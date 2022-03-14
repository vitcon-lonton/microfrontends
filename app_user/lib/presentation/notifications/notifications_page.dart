// ignore_for_file: unused_element

part of 'notifications.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  Future<void> _onRefresh() async {
    context.read<NotificationsCubit>().refreshRequested();
    await context.read<NotificationsCubit>().getNotificationsRequested();
  }

  Future<void> _onLoadMore() async {
    final state = context.read<NotificationsCubit>().state;
    final currentPage = state.page;
    final totalPage = state.pageCount;
    final nextPage = currentPage + 1;

    if (nextPage > totalPage) return;

    context.read<NotificationsCubit>().pageNumberChanged(nextPage);
    await context.read<NotificationsCubit>().getNotificationsRequested();
  }

  @override
  Widget build(BuildContext context) {
    final txtNotification = tr(LocaleKeys.txt_notification);

    return BlocProvider<NotificationsCubit>(
      create: (context) =>
          getIt<NotificationsCubit>()..getNotificationsRequested(),
      child: BlocListener<NotificationsCubit, NotificationsState>(
        listener: (context, state) {},
        child: Scaffold(
          body: BlocBuilder<NotificationsCubit, NotificationsState>(
            buildWhen: (prev, cur) => prev.notifications != cur.notifications,
            builder: (context, state) {
              final notifications = state.notifications;

              return RefreshLoadmore(
                // onRefresh: _onRefresh,
                // onLoadmore: _onLoadMore,
                onRefresh: () async {
                  context.read<NotificationsCubit>().refreshRequested();
                  await context
                      .read<NotificationsCubit>()
                      .getNotificationsRequested();
                },
                onLoadmore: () async {
                  final state = context.read<NotificationsCubit>().state;
                  final currentPage = state.page;
                  final totalPage = state.pageCount;
                  final nextPage = currentPage + 1;

                  if (nextPage > totalPage) return;

                  context
                      .read<NotificationsCubit>()
                      .pageNumberChanged(nextPage);
                  await context
                      .read<NotificationsCubit>()
                      .getNotificationsRequested();
                },
                isLastPage: state.isLastPage,
                noMoreWidget: Text('No more data, you are at the end',
                    style: TextStyle(color: Theme.of(context).disabledColor)),
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: notifications.length,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (_, index) => const Divider(height: 0),
                  itemBuilder: (_, index) {
                    return NotificationTile(notification: notifications[index]);
                  },
                ),
              );
            },
          ),

          // APP_BAR
          appBar: AppBar(title: Text(txtNotification)),
        ),
      ),
    );
  }
}
