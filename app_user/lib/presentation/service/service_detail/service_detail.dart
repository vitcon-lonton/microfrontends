import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme_manager/theme_manager.dart';
import 'package:app_user/module/service/service.dart';

class ServiceDetail extends StatelessWidget {
  const ServiceDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ServiceDetailCubit>.value(
      value: context.read<ServiceDetailCubit>()..getDetailRequested(),
      child: BlocListener<ServiceDetailCubit, ServiceDetailState>(
        listener: (context, state) {},
        child: BlocBuilder<ServiceDetailCubit, ServiceDetailState>(
            builder: (context, state) {
              if (state.isSubmitting) return const LinearProgressIndicator();

              if (state.service == null) return kSpaceZero;

              // final img = service.img;
              final service = state.service!;
              final name = service.name;
              final price = service.priceApprox.toString();
              final description = service.description;

              return Column(
                children: [
                  // Image.network(img),

                  // HEADER
                  // kVSpaceM,
                  SizedBox.fromSize(
                      size: const Size.fromHeight(500),
                      child: Container(
                        color: Theme.of(context).primaryColor,
                        child: Stack(children: [
                          Center(
                            child: Icon(Icons.room_service,
                                size: 500,
                                color: Theme.of(context).colorScheme.onPrimary),
                          ),
                          Row(children: [
                            IconTheme(
                              data: IconThemeData(
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                              child: BlocBuilder<ServiceDetailCubit,
                                  ServiceDetailState>(
                                builder: (context, state) {
                                  if (state.isSubmittingLike) {
                                    return IconButton(
                                        icon: CircularProgressIndicator(
                                            color: Theme.of(
                                              context,
                                            ).colorScheme.onPrimary,
                                            strokeWidth: 2.0),
                                        onPressed: null);
                                  }

                                  if (state.isLiked) {
                                    return IconButton(
                                        onPressed: context
                                            .read<ServiceDetailCubit>()
                                            .unlikeRequested,
                                        icon: const Icon(Icons.favorite));
                                  }

                                  return IconButton(
                                      onPressed: context
                                          .read<ServiceDetailCubit>()
                                          .likeRequested,
                                      icon: const Icon(
                                          Icons.favorite_border_outlined));
                                },
                                buildWhen: (prev, cur) =>
                                    prev.isLiked != cur.isLiked ||
                                    prev.isSubmittingLike !=
                                        cur.isSubmittingLike,
                              ),
                            ),
                          ], mainAxisAlignment: MainAxisAlignment.end)
                        ]),
                      )),

                  Padding(
                    child: Column(children: [
                      Row(),
                      kVSpaceM,
                      Text(name),
                      kVSpaceM,
                      Text(price),
                      kVSpaceM,
                    ], crossAxisAlignment: CrossAxisAlignment.start),
                    padding: const EdgeInsets.symmetric(horizontal: kSpaceM),
                  ),

                  Padding(
                    child: Column(children: [
                      kVSpaceM,
                      const Text('Description'),
                      kVSpaceM,
                      Text(description),
                      kVSpaceM,
                    ], crossAxisAlignment: CrossAxisAlignment.start),
                    padding: const EdgeInsets.symmetric(horizontal: kSpaceM),
                  ),
                ],
              );
            },
            buildWhen: (prev, cur) =>
                prev.service != cur.service ||
                prev.isSubmitting != cur.isSubmitting),
      ),
    );
  }
}
