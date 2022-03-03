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
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _processes.map((status) {
          return Padding(
              child: Row(children: [
                Icon(Icons.check_circle_rounded,
                    color: status == _processes[3]
                        ? Colors.green.shade400
                        : Colors.blueGrey.shade100,
                    size: 20),
                kHSpaceS,
                DefaultTextStyle(
                    style: TextStyle(
                        color: status == _processes[3]
                            ? Colors.green.shade400
                            : Colors.blueGrey.shade100),
                    child: Text(capitalize(status))),
              ]),
              padding: const EdgeInsets.symmetric(vertical: 2.0));
        }).toList());
  }
}
