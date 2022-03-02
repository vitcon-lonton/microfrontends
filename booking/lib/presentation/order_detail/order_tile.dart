part of 'order_detail.dart';

class OrderStatusView extends StatelessWidget {
  final OrderStatus status;

  const OrderStatusView({Key? key, required this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(children: const [
        Icon(Icons.check_circle_outlined),
        Divider(height: 0),
        Icon(Icons.check_circle_outlined),
        Divider(height: 0),
        Icon(Icons.check_circle_outlined),
      ]),
      Row(children: const [
        Text('data'),
        Spacer(),
        Text('data'),
        Spacer(),
        Text('data'),
      ]),
    ]);
  }
}

// class OrderTile extends StatelessWidget {
//   final Order order;

//   const OrderTile({Key? key, required this.order}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final name = order.name;
//     final status = order.status;
//     final price = '${order.price} vnd';
//     final time = order.time.toIso8601String();
//     final id = order.id.value.foldRight('', (id, previous) => id);

//     return InkWell(
//       onTap: () {},
//       child: Ink(
//         padding: const EdgeInsets.symmetric(
//           vertical: kSpaceM,
//           horizontal: kSpaceL,
//         ),
//         child: DefaultTextStyle(
//           maxLines: 1,
//           overflow: TextOverflow.ellipsis,
//           style: Theme.of(context).textTheme.titleSmall!,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text('Order ID: $id'),
//                         kVSpaceXXS,
//                         Text(name),
//                         Text(time),
//                       ],
//                     ),
//                   ),
//                   kHSpaceM,
//                   Text(price, maxLines: 1)
//                 ],
//               ),
//               kVSpaceS,
//               Text(status.toString()),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
