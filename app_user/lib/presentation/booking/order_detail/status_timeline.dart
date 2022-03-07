part of 'order_detail.dart';

const kTileHeight = 50.0;
const todoColor = Color(0xffd1d2d7);
const completeColor = Color(0xff5e6172);
const inProgressColor = Color(0xff5ec792);
final _processes = [
  'Created',
  'Processing',
  'Waiting Confirm',
  'Doing',
  'Done',
  'Cancel'
];

class StatusTimeline extends StatelessWidget {
  const StatusTimeline({Key? key}) : super(key: key);

  String capitalize(String str) =>
      "${str[0].toUpperCase()}${str.substring(1).toLowerCase()}";

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
            children: _processes.map((status) {
              return Column(children: [
                Icon(Icons.check_circle_rounded,
                    color: status == _processes[3]
                        ? const Color(0xFF009B19)
                        : Colors.blueGrey.shade100,
                    size: 22),
                kVSpaceS,
                DefaultTextStyle(
                    style: TextStyle(
                        color: status == _processes[3]
                            ? const Color(0xFF009B19)
                            : Colors.blueGrey.shade100),
                    child: Text(capitalize(status))),
              ]);
            }).toList()),
      ],
    );
  }
}
