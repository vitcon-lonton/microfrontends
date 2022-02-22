import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme_manager/theme_manager.dart';

import 'service_detail_cubit.dart';

class ServiceDetail extends StatelessWidget {
  const ServiceDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ServiceDetailCubit>.value(
      value: context.read<ServiceDetailCubit>()..getDetailRequested(),
      child: BlocListener<ServiceDetailCubit, ServiceDetailState>(
        listener: (context, state) {},
        child: Scaffold(
          bottomNavigationBar: BottomNav.raw(
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: ListTile(
                    onTap: () {},
                    title: const Icon(Icons.favorite_border),
                  ),
                ),
                kHSpaceL,
                Expanded(
                  flex: 4,
                  child: ListTile(onTap: () {}, title: const Text('Continue')),
                )
              ],
            ),
          ),
          appBar: AppBar(
            centerTitle: false,
            title: BlocBuilder<ServiceDetailCubit, ServiceDetailState>(
              buildWhen: (prev, cur) => prev.service != cur.service,
              builder: (context, state) {
                if (state.service == null) return kSpaceZero;

                return Text(state.service!.name);
              },
            ),
          ),
          body: BlocBuilder<ServiceDetailCubit, ServiceDetailState>(
            buildWhen: (prev, cur) =>
                prev.status != cur.status || prev.service != cur.service,
            builder: (context, state) => state.status.maybeMap(
              orElse: () => Container(),
              busy: (_) => const LinearProgressIndicator(),
              idle: (_) {
                if (state.service == null) return kSpaceZero;

                final service = state.service!;
                final img = service.img;
                final price = service.price;
                final rating = service.rating;
                final description = service.description;

                return ListView(
                  // shrinkWrap: true,
                  // physics: const NeverScrollableScrollPhysics(),
                  children: [
                    Image.network(img),
                    ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.symmetric(horizontal: kSpaceS),
                      children: [
                        kVSpaceL,
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Icon(Icons.star, size: 15),
                            Text(rating.toString()),
                          ],
                        ),
                        kVSpaceL,
                        Text(price),
                        kVSpaceL,
                        const Text('Description'),
                        Text(description),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
