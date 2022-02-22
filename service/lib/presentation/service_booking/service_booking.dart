import 'package:engine/engine.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme_manager/theme_manager.dart';

import 'service_booking_cubit.dart';

class ServiceBooking extends StatefulWidget {
  const ServiceBooking({Key? key}) : super(key: key);

  @override
  State<ServiceBooking> createState() => _ServiceBookingState();
}

class _ServiceBookingState extends State<ServiceBooking> {
  DateTime date = DateTime(2016, 10, 26);
  DateTime time = DateTime(2016, 5, 10, 22, 35);

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

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ServiceBookingCubit>.value(
      value: context.read<ServiceBookingCubit>()..getDetailRequested(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Book the service')),
        bottomNavigationBar: BottomNav.submit(
          onPressed: () {},
          child: const Text('Continue booking'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kSpaceS),
          child: DefaultTextStyle(
            style: TextStyle(
                fontSize: 22.0,
                color: CupertinoColors.label.resolveFrom(context)),
            child: Form(
              autovalidateMode:
                  context.read<ServiceBookingCubit>().state.showErrorMessages
                      ? AutovalidateMode.always
                      : AutovalidateMode.disabled,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _DatePickerItem(
                      children: [
                        const Text('Select Date'),
                        CupertinoButton(
                          // Display a CupertinoDatePicker in date picker mode.
                          onPressed: () => _showDialog(
                            CupertinoDatePicker(
                              initialDateTime: date,
                              mode: CupertinoDatePickerMode.date,
                              use24hFormat: true,
                              // This is called when the user changes the date.
                              onDateTimeChanged: (DateTime newDate) {
                                setState(() => date = newDate);
                              },
                            ),
                          ),
                          // In this example, the date value is formatted manually. You can use intl package
                          // to format the value based on user's locale settings.
                          child: Text(
                            '${date.month}-${date.day}-${date.year}',
                            style: const TextStyle(fontSize: 22.0),
                          ),
                        ),
                      ],
                    ),
                    _DatePickerItem(
                      children: [
                        const Text('Select Time'),
                        CupertinoButton(
                          // Display a CupertinoDatePicker in time picker mode.
                          onPressed: () => _showDialog(
                            CupertinoDatePicker(
                              initialDateTime: time,
                              mode: CupertinoDatePickerMode.time,
                              use24hFormat: true,
                              // This is called when the user changes the time.
                              onDateTimeChanged: (DateTime newTime) {
                                setState(() => time = newTime);
                              },
                            ),
                          ),
                          // In this example, the time value is formatted manually. You can use intl package to
                          // format the value based on the user's locale settings.
                          child: Text(
                            '${time.hour}:${time.minute}',
                            style: const TextStyle(fontSize: 22.0),
                          ),
                        ),
                      ],
                    ),
                    kVSpaceL,
                    BlocBuilder<ServiceBookingCubit, ServiceBookingState>(
                      buildWhen: (prev, cur) => prev.street != cur.street,
                      builder: (context, state) => WTextInput(
                        height: 100,
                        maxLines: 10,
                        label: 'Your Address',
                        contentPadding: const EdgeInsets.all(kSpaceXS),
                        validator: (_) => context
                            .read<ServiceBookingCubit>()
                            .state
                            .street
                            .value
                            .fold((failure) => 'Invalid Address', (_) => null),
                        // errorText: context
                        //     .read<ServiceBookingCubit>()
                        //     .state
                        //     .street
                        //     .value
                        //     .fold((failure) {
                        //   return 'Invalid Address';
                        // }, (_) => null),
                        // errorText: context
                        //     .read<ServiceBookingCubit>()
                        //     .state
                        //     .street
                        //     .value
                        //     .fold(
                        //         (f) => f.maybeMap(
                        //             orElse: () => null,
                        //             invalidEmail: (_) => 'Invalid Email'),
                        //         (_) => null),
                        onChanged:
                            context.read<ServiceBookingCubit>().streetChanged,
                      ),
                    ),
                    kVSpaceL,
                    BlocBuilder<ServiceBookingCubit, ServiceBookingState>(
                      buildWhen: (prev, cur) => prev.note != cur.note,
                      builder: (context, state) => WTextInput(
                        height: 100,
                        maxLines: 10,
                        label: 'Hint',
                        contentPadding: const EdgeInsets.all(kSpaceXS),
                        // validator: (_) => context
                        //     .read<ServiceBookingCubit>()
                        //     .state
                        //     .street
                        //     .value
                        //     .fold((failure) => 'Invalid Address', (_) => null),
                        // errorText: context
                        //     .read<ServiceBookingCubit>()
                        //     .state
                        //     .street
                        //     .value
                        //     .fold((failure) {
                        //   return 'Invalid Address';
                        // }, (_) => null),
                        errorText: context
                            .read<ServiceBookingCubit>()
                            .state
                            .note
                            .value
                            .fold((failure) => 'Invalid Hint', (_) => null),
                        onChanged:
                            context.read<ServiceBookingCubit>().noteChanged,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// This class simply decorates a row of widgets.
class _DatePickerItem extends StatelessWidget {
  final List<Widget> children;

  const _DatePickerItem({required this.children});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: CupertinoColors.inactiveGray,
            width: 0.0,
          ),
          bottom: BorderSide(
            color: CupertinoColors.inactiveGray,
            width: 0.0,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: children,
        ),
      ),
    );
  }
}
