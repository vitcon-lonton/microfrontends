import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refresh_loadmore/refresh_loadmore.dart';
import 'package:service/service.dart';
import 'package:theme_manager/theme_manager.dart';
import 'service_tile.dart';

class Services extends StatefulWidget {
  final bool isPagination;

  const Services({
    Key? key,
    this.isPagination = true,
  }) : super(key: key);

  @override
  State<Services> createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ServicesCubit>.value(
      value: context.read<ServicesCubit>()..getServicesRequested(),
      child: BlocListener<ServicesCubit, ServicesState>(
        listener: (context, state) {},
        child: BlocBuilder<ServicesCubit, ServicesState>(
          buildWhen: (prev, cur) => prev.isSubmitting != cur.isSubmitting,
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
                    itemCount: services.length,
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
                    itemCount: services.length,
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
