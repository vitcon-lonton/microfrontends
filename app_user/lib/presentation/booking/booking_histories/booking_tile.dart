part of 'booking_histories.dart';

class BookingTile extends StatelessWidget {
  final Booking item;

  const BookingTile({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final id = item.id;
    final name = item.fullName;
    final code = '#${item.sku}';
    final status = item.status;
    final time = item.timeBoxingEnd?.toIso8601String() ?? '';

    return InkWell(
      onTap: () {
        context.router.push(BookingDetailPageRoute(id: id));
      },
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
                  Text('${tr(LocaleKeys.txt_order)}: '),
                  Expanded(child: Text(code)),
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
                  Text(statusLabels[status]!),
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
}

// void _showRatingForm(BuildContext context) {
//   showDialog(
//     context: context,
//     builder: (context) => BlocProvider(
//       create: (_) => getIt<RatingFormCubit>(),
//       child: Material(
//         color: Colors.transparent,
//         child: Column(children: [
//           const Spacer(),
//           Container(
//             child: const RatingForm(),
//             padding: const EdgeInsets.symmetric(
//                 horizontal: kSpaceXXL, vertical: kSpaceM),
//             decoration: const BoxDecoration(
//                 borderRadius:
//                     BorderRadius.vertical(top: Radius.circular(16.0)),
//                 color: Colors.white),
//           ),
//         ]),
//       ),
//     ),
//   );
// }