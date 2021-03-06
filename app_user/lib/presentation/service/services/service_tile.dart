part of 'services.dart';

class ServiceTile extends StatefulWidget {
  final Service service;

  const ServiceTile({Key? key, required this.service}) : super(key: key);

  @override
  State<ServiceTile> createState() => _ServiceTileState();
}

class _ServiceTileState extends State<ServiceTile> {
  @override
  Widget build(BuildContext context) {
    final name = widget.service.name;
    final serviceId = widget.service.id;
    final image = widget.service.image;
    final price = widget.service.priceApprox.toString();

    return BlocProvider(
      create: (context) {
        return getIt<FavoriteFindCubit>()..findRequested(serviceId);
      },
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () {
          context.router.push(ServiceBookingPageRoute(serviceId: serviceId));
        },
        child: Ink(
          padding: const EdgeInsets.all(kSpaceS),
          decoration: BoxDecoration(
            color: const Color(0xFFF7F8FA),
            borderRadius: BorderRadius.circular(8),
          ),
          child: SizedBox.fromSize(
            size: const Size.fromHeight(60),
            child: Row(children: [
              image != null
                  ? SizedBox(
                      width: 60,
                      height: 60,
                      child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(width: 0.25),
                              borderRadius: BorderRadius.circular(2)),
                          child: DMQImage.network(image, fit: BoxFit.cover)))
                  : SizedBox(
                      width: 60,
                      height: 60,
                      child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(width: 0.25),
                              borderRadius: BorderRadius.circular(2)),
                          child: Icon(Icons.medical_services,
                              size: 60,
                              color: Theme.of(context).primaryColor))),
              kHSpaceM,
              Expanded(
                flex: 2,
                child: DefaultTextStyle(
                    maxLines: 2,
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(fontSize: 14),
                    overflow: TextOverflow.ellipsis,
                    child: Column(
                        children: [
                          kVSpaceXS,
                          Text(name, maxLines: 2),
                          kVSpaceXS,
                          Text(price,
                              maxLines: 1,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge!
                                  .copyWith(fontSize: 16))
                        ],
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start)),
              ),
              IconTheme(
                child: FavoriteButton(serviceId: serviceId),
                data: const IconThemeData.fallback()
                    .copyWith(color: Theme.of(context).primaryColor),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  // ignore: unused_element
  void _confirm() {
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
                  Text('Are you want unlike ${widget.service.name}?'),
                  kVSpaceXL,
                  kVSpaceXL,
                  Row(children: [
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
                  ]),
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
