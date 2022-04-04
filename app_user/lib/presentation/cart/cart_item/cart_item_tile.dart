part of 'cart_item.dart';

class CartItemTile extends StatefulWidget {
  CartItemTile(this.item) : super(key: Key(item.id.getOrCrash()));

  final CartItem item;

  @override
  State<CartItemTile> createState() => _CartItemTileState();
}

class _CartItemTileState extends State<CartItemTile> {
  @override
  Widget build(BuildContext context) {
    final id = widget.item.id;
    final serviceId = widget.item.serviceId;
    final base64Images = widget.item.base64Images;
    final noteStr = widget.item.note?.getOrCrash();
    final bookingTime = widget.item.time;
    final timeStart = bookingTime.timeStart.toString();
    final timeEnd = bookingTime.timeEnd.toString();
    final dateStr = DateFormat.yMd().format(bookingTime.date);

    return BlocProvider.value(
      value: getIt<ServiceDetailCubit>()..getDetailRequested(serviceId),
      child: InkWell(
        borderRadius: BorderRadius.circular(4),
        child: Ink(
          color: const Color(0xFFF7F8FA),
          child: DefaultTextStyle(
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleSmall!,
            child: Column(children: [
              Row(children: [
                SizedBox.square(
                    child: BlocBuilder<ServiceDetailCubit, ServiceDetailState>(
                        builder: (context, state) {
                      return state.maybeWhen(founded: (service) {
                        if (service.image == null) {
                          return Icon(Icons.article_outlined,
                              color: Theme.of(context).primaryColor);
                        }

                        return DMQImage.network(service.image!,
                            fit: BoxFit.cover);
                      }, orElse: () {
                        return Icon(Icons.article_outlined,
                            color: Theme.of(context).primaryColor);
                      });
                    }),
                    dimension: 90),
                kHSpaceM,
                Expanded(
                    child: Column(children: [
                  Row(children: [
                    // NAME
                    BlocBuilder<ServiceDetailCubit, ServiceDetailState>(
                        builder: (context, state) {
                      return state.maybeWhen(founded: (service) {
                        return Expanded(child: Text(service.name));
                      }, orElse: () {
                        return const Expanded(child: kSpaceZero);
                      });
                    }),
                    IconButton(
                      // iconSize: 12,
                      icon: const Icon(Icons.edit),
                      padding: const EdgeInsets.all(0.0),
                      onPressed: () {
                        context.router
                            .push(CartItemFormPageRoute(cartItem: widget.item));
                      },
                    ),
                    IconButton(
                      // iconSize: 12,
                      icon: const Icon(Icons.cancel),
                      padding: const EdgeInsets.all(0.0),
                      onPressed: () {
                        context.read<CartItemDeleteCubit>().deleted(id);
                      },
                    )
                  ]),

                  BlocBuilder<ServiceDetailCubit, ServiceDetailState>(
                      builder: (context, state) {
                    return state.maybeWhen(founded: (service) {
                      return Text('${service.priceApprox} VND');
                    }, orElse: () {
                      return kSpaceZero;
                    });
                  }),

                  // TIME
                  kVSpaceXS,
                  Row(children: [
                    const Icon(Icons.history_toggle_off_rounded, size: 14),
                    kHSpaceXXS,
                    Expanded(
                      child: Text('$timeStart - $timeEnd,  $dateStr',
                          maxLines: 1, overflow: TextOverflow.ellipsis),
                    ),
                  ]),

                  kVSpaceS,
                  bookingTime.failureOrUnit.fold((failure) {
                    return Text('Invalid booking time',
                        style: TextStyle(color: Theme.of(context).errorColor));
                  }, (_) => kSpaceZero),

                  // DESCRIPTION
                  if (noteStr != null) ...[
                    kVSpaceXS,
                    Row(children: [
                      const Icon(Icons.edit, size: 14),
                      kHSpaceXXS,
                      Text(noteStr),
                    ]),
                  ],

                  // IMAGES
                  if ((base64Images?.length ?? 0) != 0) ...[
                    kVSpaceXS,
                    Row(
                      children: base64Images!
                          .getOrCrash()
                          .asList()
                          .map((base64Str) => SizedBox.fromSize(
                              size: const Size.square(50),
                              child: Image.memory(
                                  const Base64Decoder().convert(base64Str))))
                          .toList(),
                    ),
                  ],
                ], crossAxisAlignment: CrossAxisAlignment.start)),
              ], crossAxisAlignment: CrossAxisAlignment.start),
              kVSpaceS,
            ]),
          ),
        ),
      ),
    );
  }
}
