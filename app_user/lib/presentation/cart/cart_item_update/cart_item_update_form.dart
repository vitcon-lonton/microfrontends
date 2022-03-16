part of 'cart_item_update.dart';

class CartItemUpdateForm extends StatefulWidget {
  const CartItemUpdateForm({Key? key}) : super(key: key);

  @override
  State<CartItemUpdateForm> createState() => _CartItemUpdateFormState();
}

class _CartItemUpdateFormState extends State<CartItemUpdateForm> {
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
    final AutovalidateMode autovalidateMode;
    if (context.read<ServiceCheckingCubit>().state.showErrorMessages) {
      autovalidateMode = AutovalidateMode.always;
    } else {
      autovalidateMode = AutovalidateMode.disabled;
    }

    return BlocProvider<ServiceCheckingCubit>.value(
      value: context.read<ServiceCheckingCubit>(),
      // value: context.read<ServiceCheckingCubit>()..getDetailRequested(),
      child: BlocListener<ServiceCheckingCubit, ServiceCheckingState>(
        listenWhen: (prev, cur) {
          return prev.time != cur.time || prev.date != cur.date;
        },
        listener: (context, state) {
          // context.read<ServiceCheckingCubit>().checkingRequested();
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(children: [
                      DefaultTextStyle(
                        style: TextStyle(color: Theme.of(context).primaryColor),
                        child: BlocBuilder<ServiceCheckingCubit,
                            ServiceCheckingState>(
                          buildWhen: (prev, cur) => prev.date != cur.date,
                          builder: (context, state) {
                            return state.failureOrSuccessOption
                                .fold(() => kSpaceZero, (either) {
                              return either.fold(
                                  (failure) => const Text('Unable booking'),
                                  (_) => kSpaceZero);
                            });
                          },
                        ),
                      ),
                    ]),
                    BlocBuilder<ServiceCheckingCubit, ServiceCheckingState>(
                      buildWhen: (prev, cur) =>
                          prev.isSubmitting != cur.isSubmitting,
                      builder: (context, state) {
                        if (state.isSubmitting) {
                          return const LinearProgressIndicator();
                        }

                        return kSpaceZero;
                      },
                    ),
                    kVSpaceM,
                    _DatePickerItem(
                      children: [
                        const Text('Select Date'),
                        BlocBuilder<ServiceCheckingCubit, ServiceCheckingState>(
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
                                      .read<ServiceCheckingCubit>()
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
                    const Text('Select Time'),
                    kVSpaceM,
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
