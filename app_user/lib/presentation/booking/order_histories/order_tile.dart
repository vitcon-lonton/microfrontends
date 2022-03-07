part of 'order_histories.dart';

class OrderTile extends StatelessWidget {
  final Order order;

  const OrderTile({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final name = order.name;
    final status = order.status;
    final time = order.time.toIso8601String();
    final id = order.id.value.foldRight('', (id, previous) => '#$id');
    final price = '${order.price} VND';

    return InkWell(
      onTap: () => _showRatingForm(context),
      borderRadius: BorderRadius.circular(8),
      child: Ink(
        color: const Color(0xFFF7F8FA),
        child: DefaultTextStyle(
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.titleSmall!,
          child: Row(children: [
            kHSpaceM,
            Expanded(
              child: Column(children: [
                // ID, PRICE
                Row(children: [
                  const Text('Order ID: '),
                  Expanded(child: Text(id)),
                  Text(price),
                ]),

                // NAME, TIME
                kVSpaceXS,
                Row(children: [
                  Expanded(child: Text(name)),
                  Text(time),
                ]),

                // STATUS
                kVSpaceXS,
                Row(children: [
                  const Text('Status'),
                  const Spacer(),
                  Text(status.toString()),
                ])
              ], crossAxisAlignment: CrossAxisAlignment.start),
            ),
            kHSpaceM,
          ], crossAxisAlignment: CrossAxisAlignment.start),
        ),
        padding: const EdgeInsets.symmetric(vertical: kSpaceM),
      ),
    );
  }

  void _showRatingForm(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => BlocProvider(
        create: (_) => getIt<OrderRatingCubit>(),
        child: Material(
          color: Colors.transparent,
          child: Column(children: [
            const Spacer(),
            Container(
              child: const OrderRatingForm(),
              padding: const EdgeInsets.symmetric(
                  horizontal: kSpaceXXL, vertical: kSpaceM),
              decoration: const BoxDecoration(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(16.0)),
                  color: Colors.white),
            ),
          ]),
        ),
      ),
    );
  }
}
