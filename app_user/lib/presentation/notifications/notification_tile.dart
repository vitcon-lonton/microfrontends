part of 'notifications.dart';

class NotificationTile extends StatelessWidget {
  final Order order;

  const NotificationTile({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final name = order.name;
    final status = order.status;
    final time = order.time.toIso8601String();
    final id = order.id.value.foldRight('', (id, previous) => '#$id');

    return InkWell(
      onTap: () {},
      child: Ink(
        child: DefaultTextStyle(
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.titleSmall!,
          child: Row(children: [
            kHSpaceS,
            Padding(
                child: Icon(Icons.article_outlined,
                    color: Theme.of(context).colorScheme.primary),
                padding: const EdgeInsets.only(top: 8.0)),
            kHSpaceM,
            Expanded(
              child: Column(children: [
                Row(children: [
                  const Text('Order: '),
                  Expanded(
                      child: Text(id,
                          style: TextStyle(
                              color: Theme.of(context).primaryColor))),
                  Text(time),
                ]),
                kVSpaceS,
                Text(name),
                kVSpaceS,
                Text(status.toString()),
              ], crossAxisAlignment: CrossAxisAlignment.start),
            ),
            kHSpaceS,
          ], crossAxisAlignment: CrossAxisAlignment.start),
        ),
        padding: const EdgeInsets.symmetric(vertical: kSpaceM),
      ),
    );
  }
}
