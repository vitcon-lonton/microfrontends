import 'package:app_user/i18n/i18n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme_manager/theme_manager.dart';
import 'package:app_user/module/service/service.dart';

class ServiceDetail extends StatefulWidget {
  const ServiceDetail({Key? key}) : super(key: key);

  @override
  State<ServiceDetail> createState() => _ServiceDetailState();
}

class _ServiceDetailState extends State<ServiceDetail> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ServiceDetailCubit>.value(
      value: context.read<ServiceDetailCubit>()..getDetailRequested(),
      child: Column(
        children: [
          // LOADING INDICATOR
          BlocBuilder<ServiceDetailCubit, ServiceDetailState>(
              buildWhen: (prev, cur) => prev.isSubmitting != cur.isSubmitting,
              builder: (_, state) => state.isSubmitting
                  ? const LinearProgressIndicator()
                  : kSpaceZero),

          // INFO DETAIL
          BlocBuilder<ServiceDetailCubit, ServiceDetailState>(
              buildWhen: (prev, cur) => prev.service != cur.service,
              builder: (context, state) => _buildInformation(state.service)),
        ],
      ),
    );
  }

  Widget _buildInformation(Service? service) {
    if (service == null) return kSpaceZero;

    // final img = service.img;
    final name = service.name;
    final price = service.priceApprox.toString();
    final description = service.description;

    return Column(
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
              Text(tr(LocaleKeys.txt_add_description)),
              kVSpaceM,
              Text(description),
              kVSpaceM,
            ], crossAxisAlignment: CrossAxisAlignment.start),
            padding: const EdgeInsets.symmetric(horizontal: kSpaceM)),
      ],
    );
  }
}
