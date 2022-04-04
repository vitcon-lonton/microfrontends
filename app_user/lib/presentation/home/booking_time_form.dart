part of 'home.dart';

class BookingTimeForm extends StatefulWidget {
  const BookingTimeForm({Key? key}) : super(key: key);

  @override
  State<BookingTimeForm> createState() => _BookingTimeFormState();
}

class _BookingTimeFormState extends State<BookingTimeForm> {
  BookingTime bookingTime = BookingTime.empty();

  @override
  Widget build(BuildContext context) {
    final date = bookingTime.date;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kSpaceS),
      child: DefaultTextStyle(
        style: TextStyle(
            fontSize: 22.0, color: CupertinoColors.label.resolveFrom(context)),
        child: Column(children: [
          DecoratedBox(
            decoration: const BoxDecoration(
                border: Border.symmetric(
                    horizontal: BorderSide(
                        width: 0.0, color: CupertinoColors.inactiveGray))),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(children: [
                const Text('Select Date'),
                CupertinoButton(
                  onPressed: () {
                    _showDialog(CupertinoDatePicker(
                        use24hFormat: true,
                        initialDateTime: date,
                        mode: CupertinoDatePickerMode.date,
                        onDateTimeChanged: (dateTime) {
                          setState(() {
                            bookingTime = bookingTime.copyWith(date: dateTime);
                          });
                        }));
                  },
                  // In this example, the date value is formatted manually. You can use intl package
                  // to format the value based on user's locale settings.
                  child: Text(
                    '${date.month}-${date.day}-${date.year}',
                    style: const TextStyle(fontSize: 22.0),
                  ),
                ),
              ], mainAxisAlignment: MainAxisAlignment.spaceBetween),
            ),
          ),
          kVSpaceM,
          Row(children: const [kHSpaceM, Text('Select Time')]),
          kVSpaceM,
          TimeIntervalPicker(
            endLimit: null,
            startLimit: DateTime(date.year, date.month, date.day,
                bookingTime.timeStart.hour, bookingTime.timeStart.minute),
            onChanged: (DateTime? startTime, DateTime? endTime, bool isAllDay) {
              if (startTime != null) {
                setState(() {
                  final timeStart =
                      TimeOfDay(hour: startTime.hour, minute: startTime.minute);
                  bookingTime = bookingTime.copyWith(timeStart: timeStart);
                });
              }

              if (endTime != null) {
                setState(() {
                  final timeEnd =
                      TimeOfDay(hour: endTime.hour, minute: endTime.minute);
                  bookingTime = bookingTime.copyWith(timeEnd: timeEnd);
                });
              }

              if (kDebugMode) {
                print('--- startTime ---');
                print(startTime?.toIso8601String());
                print('--- endTime ---');
                print(endTime?.toIso8601String());
              }
            },
          ),
          kVSpaceM,
          DefaultTextStyle(
            textAlign: TextAlign.left,
            style: TextStyle(color: Theme.of(context).errorColor),
            child: bookingTime.failureOption.fold(() {
              return kSpaceZero;
            }, (failure) {
              return Row(children: const [Text('Invalid booking time')]);
            }),
          ),
          kVSpaceL,
        ], mainAxisAlignment: MainAxisAlignment.start),
      ),
    );
  }

  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        // The Bottom margin is provided to align the popup above the system navigation bar.
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        // Provide a background color for the popup.
        color: CupertinoColors.systemBackground.resolveFrom(context),
        // Use a SafeArea widget to avoid system overlaps.
        child: SafeArea(top: false, child: child),
      ),
    );
  }
}
