part of 'services.dart';

class ServicesWidget extends StatefulWidget {
  final bool isPagination;

  const ServicesWidget({
    Key? key,
    this.isPagination = true,
  }) : super(key: key);

  @override
  State<ServicesWidget> createState() => _ServicesWidgetState();
}

class _ServicesWidgetState extends State<ServicesWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ServicesCubit>.value(
      value: context.read<ServicesCubit>()..getServicesRequested(),
      child: BlocListener<ServicesCubit, ServicesState>(
        listener: (context, state) {},
        child: BlocBuilder<ServicesCubit, ServicesState>(
          buildWhen: (prev, cur) => prev.services != cur.services,
          builder: (context, state) {
            final services = state.services;

            if (!widget.isPagination) {
              return Column(
                children: [
                  Row(children: [
                    kHSpaceM,
                    Expanded(
                      child: DefaultTextStyle(
                          maxLines: 1,
                          child: const Text('Washing'),
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.headlineSmall!),
                    ),
                    kHSpaceM
                  ]),
                  kVSpaceS,
                  ListView.separated(
                    shrinkWrap: true,
                    itemCount: services.size,
                    separatorBuilder: (_, index) => kVSpaceS,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: kSpaceM),
                    itemBuilder: (_, index) {
                      return ServiceTile(service: services[index]);
                    },
                  ),
                ],
              );
            }

            return RefreshLoadmore(
              onRefresh: _onRefresh,
              onLoadmore: _onLoadMore,
              isLastPage: state.isLastPage,
              noMoreWidget: Text('No more data, you are at the end',
                  style: TextStyle(color: Theme.of(context).disabledColor)),
              child: Column(
                children: [
                  Row(children: [
                    kHSpaceM,
                    Expanded(
                      child: DefaultTextStyle(
                        maxLines: 1,
                        child: const Text('Washing'),
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.headlineSmall!,
                      ),
                    ),
                    kHSpaceM
                  ]),
                  kVSpaceS,
                  ListView.separated(
                    shrinkWrap: true,
                    itemCount: services.size,
                    separatorBuilder: (_, index) => kVSpaceS,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: kSpaceM),
                    itemBuilder: (_, index) {
                      return ServiceTile(service: services[index]);
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Future<void> _onLoadMore() async {
    final state = context.read<ServicesCubit>().state;
    final currentPage = state.page;
    final totalPage = state.pageCount;
    final nextPage = currentPage + 1;

    if (nextPage > totalPage) return;

    context.read<ServicesCubit>().pageNumberChanged(nextPage);
    await context.read<ServicesCubit>().getServicesRequested();
  }

  Future<void> _onRefresh() async {
    context.read<ServicesCubit>().refreshRequested();
    await context.read<ServicesCubit>().getServicesRequested();
  }
}
