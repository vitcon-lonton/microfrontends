part of 'cart_item.dart';

class CartItemTile extends StatelessWidget {
  final CartItem item;

  CartItemTile({required this.item}) : super(key: Key(item.id.getOrCrash()));

  @override
  Widget build(BuildContext context) {
    final id = item.id;
    final name = item.name;
    final price = '${item.price} VND';
    final time = item.time.toIso8601String();

    return InkWell(
      borderRadius: BorderRadius.circular(4),
      child: Ink(
        color: const Color(0xFFF7F8FA),
        child: DefaultTextStyle(
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.titleSmall!,
          child: Column(
            children: [
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
                        onPressed: () {},
                      ),
                      IconButton(
                        // iconSize: 12,
                        icon: const Icon(Icons.cancel),
                        padding: const EdgeInsets.all(0.0),
                        onPressed: () {
                          context.read<CartDeleteCubit>().deleted(id);
                        },
                      )
                      // Text(time),
                    ]),
                    Text(price),
                    kVSpaceXS,
                    Row(children: [
                      const Icon(Icons.history_toggle_off_rounded, size: 14),
                      kHSpaceXXS,
                      Text(time),
                    ]),
                    kVSpaceXS,
                  ], crossAxisAlignment: CrossAxisAlignment.start),
                ),
                // kHSpaceS,
              ], crossAxisAlignment: CrossAxisAlignment.start),
              // Row(
              //   children: const [],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
