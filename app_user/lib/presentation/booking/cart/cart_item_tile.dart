part of 'cart.dart';

class CartItemTile extends StatelessWidget {
  final CartItem item;

  const CartItemTile({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final name = item.name;
    final price = '${item.price} VND';
    final time = item.time.toIso8601String();

    return InkWell(
      // onTap: () {},
      borderRadius: BorderRadius.circular(4),
      child: Ink(
        color: const Color(0xFFF7F8FA),
        child: DefaultTextStyle(
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.titleSmall!,
          child: Row(children: [
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
                    onPressed: () {},
                    iconSize: 12,
                    icon: const Icon(Icons.edit),
                    padding: const EdgeInsets.all(0.0),
                  ),
                  IconButton(
                    iconSize: 12,
                    padding: const EdgeInsets.all(0.0),
                    icon: const Icon(Icons.cancel),
                    onPressed: () {
                      context.read<CartCubit>().removeItemRequested(item.id);
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
        ),
      ),
    );
  }
}
// IconButton(
// icon: const Icon(Icons.close),
// onPressed: () =>
//     context.read<CartCubit>().removeItemRequested(item.id))