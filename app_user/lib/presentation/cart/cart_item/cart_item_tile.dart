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
    final time = widget.item.time.toIso8601String();

    return BlocProvider.value(
      value: getIt<ServiceDetailCubit>()..getDetailRequested(serviceId),
      child: BlocBuilder<ServiceDetailCubit, ServiceDetailState>(
          builder: (context, state) {
        return state.maybeWhen(founded: (service) {
          final name = service.name;
          final price = '${service.priceApprox} VND';

          return InkWell(
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
                      dimension: 90,
                      child: Icon(Icons.article_outlined,
                          color: Theme.of(context).primaryColor),
                    ),
                    kHSpaceM,
                    Expanded(
                      child: Column(children: [
                        Row(children: [
                          Expanded(child: Text(name)),
                          IconButton(
                            // iconSize: 12,
                            icon: const Icon(Icons.edit),
                            padding: const EdgeInsets.all(0.0),
                            onPressed: () {
                              context.router.push(
                                  CartItemFormPageRoute(cartItem: widget.item));
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
                          // Text(time),
                        ]),
                        Text(price),

                        // TIME
                        kVSpaceXS,
                        Row(children: [
                          const Icon(Icons.history_toggle_off_rounded,
                              size: 14),
                          kHSpaceXXS,
                          Text(time),
                        ]),

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
                                    child: Image.memory(const Base64Decoder()
                                        .convert(base64Str))))
                                .toList(),
                          ),
                        ],
                      ], crossAxisAlignment: CrossAxisAlignment.start),
                    ),
                    // kHSpaceS,
                  ], crossAxisAlignment: CrossAxisAlignment.start),
                ]),
              ),
            ),
          );
        }, orElse: () {
          return kSpaceZero;
        });
      }),
    );
  }
}
