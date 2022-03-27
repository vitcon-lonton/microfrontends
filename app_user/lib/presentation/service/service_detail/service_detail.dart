import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme_manager/theme_manager.dart';
import 'package:app_user/i18n/i18n.dart';
import 'package:app_user/module/service/service.dart';

class ServiceDetail extends StatelessWidget {
  final int id;

  const ServiceDetail({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ServiceDetailCubit>.value(
      value: context.read<ServiceDetailCubit>()..getDetailRequested(id),
      child: Column(
        children: [
          // LOADING INDICATOR
          BlocBuilder<ServiceDetailCubit, ServiceDetailState>(
              builder: (context, state) {
            return state.maybeWhen(
                inProgress: () => const LinearProgressIndicator(),
                orElse: () => kSpaceZero);
          }),

          // INFO DETAIL
          BlocBuilder<ServiceDetailCubit, ServiceDetailState>(
              builder: (context, state) {
            return state.maybeWhen(orElse: () {
              return kSpaceZero;
            }, founded: (service) {
              // final img = service.img;
              final name = service.name;
              final price = service.priceApprox.toString();
              final description = service.description;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // HEADER
                  // kVSpaceM,
                  // Image.network(img),
                  SizedBox.fromSize(
                      size: const Size.fromHeight(500),
                      child: Container(
                          color: Theme.of(context).primaryColor,
                          child: Icon(Icons.room_service,
                              size: 500,
                              color: Theme.of(context).colorScheme.onPrimary))),

                  // NAME, PRICE
                  Padding(
                      child: Column(children: [
                        Row(),
                        kVSpaceM,
                        Text(name),
                        kVSpaceM,
                        Text(price),
                        kVSpaceM,
                      ], crossAxisAlignment: CrossAxisAlignment.start),
                      padding: const EdgeInsets.symmetric(horizontal: kSpaceM)),

                  // DESCRIPTION
                  Padding(
                      child: Column(children: [
                        kVSpaceM,
                        Text(tr(LocaleKeys.txt_description)),
                        kVSpaceM,
                        Text(description),
                        kVSpaceM,
                      ], crossAxisAlignment: CrossAxisAlignment.start),
                      padding: const EdgeInsets.symmetric(horizontal: kSpaceM)),
                ],
              );
            });
          }),
        ],
      ),
    );
  }
}
