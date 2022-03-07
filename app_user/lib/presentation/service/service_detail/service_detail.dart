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
        child: BlocBuilder<ServiceDetailCubit, ServiceDetailState>(
            builder: (context, state) {
              if (state.isSubmitting) {
                return const LinearProgressIndicator();
              }

              if (state.service == null) {
                return kSpaceZero;
              }

              // final img = service.img;
              final service = state.service!;
              final price = service.price;
              final rating = service.rating;
              final description = service.description;

              return Padding(
                  child: Column(children: [
                    // Image.network(img),

                    // HEADER
                    kVSpaceM,
                    SizedBox.fromSize(
                        size: const Size.fromHeight(500),
                        child: Stack(children: [
                          const Center(
                              child: Icon(Icons.room_service, size: 500)),
                          Row(children: [
                            BlocBuilder<ServiceDetailCubit, ServiceDetailState>(
                              builder: (context, state) {
                                if (state.isSubmittingLike) {
                                  return const IconButton(
                                      icon: CircularProgressIndicator(
                                          strokeWidth: 2.0, color: Colors.red),
                                      onPressed: null);
                                }

                                if (state.isLiked) {
                                  return IconButton(
                                      color: Colors.red,
                                      onPressed: context
                                          .read<ServiceDetailCubit>()
                                          .unlikeRequested,
                                      icon: const Icon(Icons.favorite));
                                }

                                return IconButton(
                                  color: Colors.red,
                                  onPressed: context
                                      .read<ServiceDetailCubit>()
                                      .likeRequested,
                                  icon: const Icon(
                                      Icons.favorite_border_outlined),
                                );
                              },
                              buildWhen: (prev, cur) =>
                                  prev.isLiked != cur.isLiked ||
                                  prev.isSubmittingLike != cur.isSubmittingLike,
                            ),
                          ], mainAxisAlignment: MainAxisAlignment.end)
                        ])),

                    // BODY
                    kVSpaceL,
                    Row(children: [
                      const Icon(Icons.star, size: 15),
                      Text(rating.toString()),
                    ], crossAxisAlignment: CrossAxisAlignment.end),

                    kVSpaceL,
                    Text(price),

                    kVSpaceL,
                    const Text('Description'),

                    kVSpaceL,
                    Text(description),
                  ], crossAxisAlignment: CrossAxisAlignment.start),
                  padding: const EdgeInsets.symmetric(horizontal: kSpaceM));
            },
            buildWhen: (prev, cur) =>
                prev.service != cur.service ||
                prev.isSubmitting != cur.isSubmitting),
      ),
    );
  }
}
