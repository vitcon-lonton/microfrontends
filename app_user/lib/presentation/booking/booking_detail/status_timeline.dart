part of 'booking_detail.dart';

const kTileHeight = 50.0;

class StatusTimeline extends StatelessWidget {
  final BookingStatus status;

  const StatusTimeline(this.status, {Key? key, required}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            children: const [
              kHSpaceM,
              Expanded(child: Divider(height: 0)),
              kHSpaceM,
            ],
          ),
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: BookingStatus.values.map((item) {
              return Column(children: [
                Icon(Icons.check_circle_rounded,
                    color: status == item
                        ? const Color(0xFF009B19)
                        : Colors.blueGrey.shade100,
                    size: 22),
                kVSpaceS,
                DefaultTextStyle(
                    style: TextStyle(
                        color: status == item
                            ? const Color(0xFF009B19)
                            : Colors.blueGrey.shade100),
                    child: Text(statusLabels[item]!)),
              ]);
            }).toList()),
      ],
    );
  }
}
