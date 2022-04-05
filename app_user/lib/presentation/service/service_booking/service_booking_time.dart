import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:theme_manager/theme_manager.dart';
import 'package:time_interval_picker/time_interval_picker.dart';
import 'package:app_user/module/cart/cart.dart';

class ServiceBookingTime extends StatefulWidget {
  const ServiceBookingTime({Key? key, this.onChanged}) : super(key: key);

  final void Function(BookingTime)? onChanged;

  @override
  State<ServiceBookingTime> createState() => _ServiceBookingTimeState();
}

class _ServiceBookingTimeState extends State<ServiceBookingTime> {
  BookingTime bookingTime = BookingTime.now();

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
                        onDateTimeChanged: onDateTimeChanged));
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
              onChanged: onTimeIntervalChanged,
              startLimit: DateTime(date.year, date.month, date.day,
                  bookingTime.timeStart.hour, bookingTime.timeStart.minute)),
          kVSpaceM,
          DefaultTextStyle(
            textAlign: TextAlign.left,
            style: TextStyle(color: Theme.of(context).errorColor),
            child: bookingTime.failureOrUnit.swap().toOption().fold(() {
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

  void onDateTimeChanged(DateTime dateTime) {
    setState(() {
      bookingTime = bookingTime.copyWith(date: dateTime);
      if (widget.onChanged != null) {
        widget.onChanged!(bookingTime);
      }
    });
  }

  void onTimeIntervalChanged(
      DateTime? startTime, DateTime? endTime, bool isAllDay) {
    // if (kDebugMode) {
    //   print('--- startTime ---');
    //   print(startTime?.toIso8601String());
    //   print('--- endTime ---');
    //   print(endTime?.toIso8601String());
    // }

    if (startTime != null) {
      setState(() {
        final timeStart =
            TimeOfDay(hour: startTime.hour, minute: startTime.minute);
        bookingTime = bookingTime.copyWith(timeStart: timeStart);

        if (widget.onChanged != null) {
          widget.onChanged!(bookingTime);
        }
      });
    }

    if (endTime != null) {
      setState(() {
        final timeEnd = TimeOfDay(hour: endTime.hour, minute: endTime.minute);
        bookingTime = bookingTime.copyWith(timeEnd: timeEnd);
        if (widget.onChanged != null) {
          widget.onChanged!(bookingTime);
        }
      });
    }
  }

  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: SafeArea(top: false, child: child),
      ),
    );
  }
}
