import 'package:flutter/material.dart';

import 'package:service/domain/domain.dart';
import 'package:theme_manager/theme_manager.dart';

class ServiceTile extends StatelessWidget {
  final Service service;
  final VoidCallback? onTap;

  const ServiceTile({
    Key? key,
    this.onTap,
    required this.service,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final name = service.name;
    final price = service.price;

    return ListTile(
      onTap: onTap,
      title: Text(name),
      subtitle: Text(price),
      minVerticalPadding: 32.0,
      visualDensity: const VisualDensity(vertical: 4),
      trailing: IconButton(
        onPressed: () => _confirm(context),
        icon: const Icon(Icons.favorite, color: Colors.red),
      ),
      leading: Container(
        width: 70,
        height: 70,
        child: const Icon(Icons.medical_services),
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(6),
        ),
      ),
    );
  }

  void _confirm(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Material(
        color: Colors.transparent,
        child: Column(
          children: [
            const Spacer(),
            Container(
              color: Colors.white,
              margin: const EdgeInsets.symmetric(horizontal: kSpaceXXL),
              padding: const EdgeInsets.symmetric(
                  vertical: kSpaceXL, horizontal: kSpaceXXL),
              child: Column(
                children: [
                  kVSpaceL,
                  Text('Are you want unlike ${service.name}?'),
                  kVSpaceXL,
                  kVSpaceXL,
                  Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          child: const Text('Cancel'),
                          onPressed: Navigator.of(context).pop,
                        ),
                      ),
                      kHSpaceL,
                      Expanded(
                        child: ElevatedButton(
                          child: const Text('Unlike'),
                          style: ElevatedButton.styleFrom(
                              elevation: 0, shadowColor: Colors.transparent),
                          onPressed: Navigator.of(context).pop,
                        ),
                      ),
                    ],
                  ),
                  kVSpaceL,
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
