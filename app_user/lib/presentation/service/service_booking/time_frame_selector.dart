import 'package:flutter/material.dart';
import 'package:theme_manager/theme_manager.dart';

class TimeFrameSelector extends StatefulWidget {
  const TimeFrameSelector({Key? key}) : super(key: key);

  @override
  State<TimeFrameSelector> createState() => _TimeFrameSelectorState();
}

class _TimeFrameSelectorState extends State<TimeFrameSelector> {
  var selectIndex = 0;
  final options = [
    '00:00 - 01:00',
    '01:00 - 02:00',
    '02:00 - 03:00',
    '03:00 - 04:00',
    '04:00 - 05:00',
    '05:00 - 06:00',
    '06:00 - 07:00',
    '07:00 - 08:00',
    '08:00 - 09:00',
    '09:00 - 10:00',
    '10:00 - 11:00',
    '11:00 - 12:00',
    '12:00 - 13:00',
    '13:00 - 14:00',
    '14:00 - 15:00',
    '15:00 - 16:00',
    '16:00 - 17:00',
    '17:00 - 18:00',
    '18:00 - 19:00',
    '19:00 - 20:00',
    '20:00 - 21:00',
    '21:00 - 22:00',
    '22:00 - 23:00',
    '23:00 - 00:00',
  ];

  // final options = List.generate(TimeOfDay.hoursPerDay, (index) => null);

  @override
  Widget build(BuildContext context) {
    final text = options[selectIndex];

    return ListTile(
      title: Text(text),
      onTap: () => _showRatingForm(context),
    );
  }

  void _showRatingForm(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Material(
        color: Colors.transparent,
        child: Column(children: [
          kVSpaceL,
          Expanded(
              child: Container(
            padding: const EdgeInsets.symmetric(vertical: kSpaceM),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
                color: Colors.white),
            child: ListView(
                children: options.asMap().entries.map((e) {
              return ListTile(
                  title: Text(e.value),
                  onTap: () {
                    setState(() {
                      selectIndex = e.key;
                      Navigator.of(context).pop();
                    });
                  });
            }).toList()),
          )),
        ]),
      ),
    );
  }
}
