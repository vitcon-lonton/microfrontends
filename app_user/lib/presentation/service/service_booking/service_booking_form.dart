import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme_manager/theme_manager.dart';

import 'package:service/service.dart';

class ServiceBookingForm extends StatefulWidget {
  const ServiceBookingForm({Key? key}) : super(key: key);

  @override
  State<ServiceBookingForm> createState() => _ServiceBookingFormState();
}

class _ServiceBookingFormState extends State<ServiceBookingForm> {
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
    final autovalidateMode =
        context.read<ServiceBookingFormCubit>().state.showErrorMessages
            ? AutovalidateMode.always
            : AutovalidateMode.disabled;

    return BlocProvider<ServiceBookingFormCubit>.value(
      value: context.read<ServiceBookingFormCubit>(),
      // value: context.read<ServiceBookingFormCubit>()..getDetailRequested(),
      child: BlocListener<ServiceBookingFormCubit, ServiceBookingFormState>(
        listenWhen: (prev, cur) {
          return prev.bookingFailureOrSuccessOption !=
              cur.bookingFailureOrSuccessOption;
        },
        listener: (context, state) {
          state.bookingFailureOrSuccessOption.fold(
            () {},
            (either) => either.fold(
              (failure) {
                final snackBar = SnackBar(
                  behavior: SnackBarBehavior.floating,
                  content: const Text('Server error'),
                  action: SnackBarAction(label: 'Action', onPressed: () {}),
                );

                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              (_) {
                // AutoRouter.of(context).replace(const NotesOverviewPageRoute());
                // Navigator.of(context).pushNamed('routeName');
                final snackBar = SnackBar(
                    content: const Text('Success'),
                    behavior: SnackBarBehavior.floating,
                    action: SnackBarAction(label: 'Action', onPressed: () {}));

                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kSpaceS),
          child: DefaultTextStyle(
            style: TextStyle(
                fontSize: 22.0,
                color: CupertinoColors.label.resolveFrom(context)),
            child: Form(
              autovalidateMode: autovalidateMode,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _DatePickerItem(
                      children: [
                        const Text('Select Date'),
                        BlocBuilder<ServiceBookingFormCubit,
                            ServiceBookingFormState>(
                          buildWhen: (prev, cur) => prev.date != cur.date,
                          builder: (context, state) {
                            final date = state.date;

                            return CupertinoButton(
                              // Display a CupertinoDatePicker in date picker mode.
                              onPressed: () => _showDialog(
                                CupertinoDatePicker(
                                  use24hFormat: true,
                                  initialDateTime: date,
                                  mode: CupertinoDatePickerMode.date,
                                  // This is called when the user changes the date.
                                  onDateTimeChanged: context
                                      .read<ServiceBookingFormCubit>()
                                      .dateChanged,
                                ),
                              ),
                              // In this example, the date value is formatted manually. You can use intl package
                              // to format the value based on user's locale settings.
                              child: Text(
                                '${date.month}-${date.day}-${date.year}',
                                style: const TextStyle(fontSize: 22.0),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    _DatePickerItem(
                      children: [
                        const Text('Select Time'),
                        BlocBuilder<ServiceBookingFormCubit,
                            ServiceBookingFormState>(
                          buildWhen: (prev, cur) => prev.time != cur.time,
                          builder: (context, state) {
                            final time = state.time;

                            return CupertinoButton(
                              // Display a CupertinoDatePicker in date picker mode.
                              onPressed: () => _showDialog(
                                CupertinoDatePicker(
                                  initialDateTime: time,
                                  mode: CupertinoDatePickerMode.time,
                                  use24hFormat: true,
                                  // This is called when the user changes the time.
                                  onDateTimeChanged: context
                                      .read<ServiceBookingFormCubit>()
                                      .timeChanged,
                                ),
                              ),
                              child: Text(
                                '${time.hour}:${time.minute}',
                                style: const TextStyle(fontSize: 22.0),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    kVSpaceL,
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
          top: BorderSide(width: 0.0, color: CupertinoColors.inactiveGray),
          bottom: BorderSide(width: 0.0, color: CupertinoColors.inactiveGray),
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
