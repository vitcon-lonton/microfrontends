import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:service/domain/domain.dart';
import 'package:theme_manager/theme_manager.dart';

import 'services_cubit.dart';

class Services extends StatelessWidget {
  final void Function(Service)? onItemPressed;

  const Services({
    Key? key,
    this.onItemPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ServicesCubit>.value(
      value: context.read<ServicesCubit>()..getAllServices(),
      child: BlocListener<ServicesCubit, ServicesState>(
        listener: (context, state) {},
        child: BlocBuilder<ServicesCubit, ServicesState>(
          buildWhen: (previous, current) =>
              previous.status != current.status ||
              previous.services != current.services,
          builder: (context, state) {
            final status = state.status;
            final services = state.services;

            return status.maybeMap(
              orElse: () => kSpaceZero,
              busy: (_) => const LinearProgressIndicator(),
              idle: (_) => ListView.separated(
                shrinkWrap: true,
                itemCount: services.length,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) => kVSpaceXXS,
                itemBuilder: (context, index) {
                  final service = services[index];

                  return ServiceItem(
                    service: service,
                    onTap: onItemPressed == null
                        ? null
                        : () => onItemPressed!(service),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class ServiceItem extends StatelessWidget {
  final Service service;
  final VoidCallback? onTap;

  const ServiceItem({
    Key? key,
    this.onTap,
    required this.service,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final img = service.img;
    final name = service.name;
    final price = service.price;

    return ListTile(
      onTap: onTap,
      isThreeLine: true,
      title: Text(name),
      leading: Image.network(img),
      trailing: const Icon(Icons.favorite_border),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('By Teddy'),
          Text(price),
        ],
      ),
      minVerticalPadding: 0,
    );
  }
}
