part of 'notifications.dart';

class NotificationTile extends StatelessWidget {
  final Notification notification;

  const NotificationTile({Key? key, required this.notification})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final txtOrder = tr(LocaleKeys.txt_order);
    final name = notification.name;
    final status = notification.status;
    final time = notification.time.toIso8601String();
    final id = notification.id.value.foldRight('', (id, previous) => '#$id');

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
                    color: Theme.of(context).primaryColor),
                padding: const EdgeInsets.only(top: 8.0)),
            kHSpaceM,
            Expanded(
              child: Column(children: [
                Row(children: [
                  Text('$txtOrder: '),
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
