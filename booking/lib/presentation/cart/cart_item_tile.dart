part of 'cart.dart';

class CartItemTile extends StatelessWidget {
  final CartItem item;

  const CartItemTile({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final name = item.name;
    final price = '${item.price} VND';
    final time = item.time.toIso8601String();

    return DefaultTextStyle(
      child: Ink(
          padding:
              const EdgeInsets.symmetric(vertical: kSpaceM, horizontal: kSpaceM)
                  .copyWith(left: 0),
          child: Column(children: [
            Row(children: [
              Column(children: [
                IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () =>
                        context.read<CartCubit>().removeItemRequested(item.id))
              ]),
              kHSpaceM,
              Expanded(
                  child: Column(children: [
                Text(name,
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(fontSize: 16)),
                kVSpaceS,
                Text(time),
                kVSpaceS,
                Text(time),
              ], crossAxisAlignment: CrossAxisAlignment.start)),
              kHSpaceM,
              Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                Link(text: 'Change', onTap: () {}),
                kVSpaceS,
                Text(price,
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(color: Colors.green.shade900))
              ])
            ]),
            kVSpaceS,
          ], crossAxisAlignment: CrossAxisAlignment.start)),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: Theme.of(context).textTheme.titleSmall!,
    );
  }
}
