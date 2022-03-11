part of 'order_detail.dart';

class OrderCancelButton extends StatefulWidget {
  const OrderCancelButton({Key? key}) : super(key: key);

  @override
  State<OrderCancelButton> createState() => _OrderCancelButtonState();
}

class _OrderCancelButtonState extends State<OrderCancelButton> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderDeleteCubit, OrderDeleteState>(
      builder: (context, state) {
        String title = state.maybeWhen(
            orElse: () => 'Cancel', actionInProgress: () => '...');
        VoidCallback? onPressed = state.maybeWhen(
            orElse: () => _submitted, actionInProgress: () => null);

        return Expanded(
          child: SizedBox(
            height: 45,
            child: ElevatedButton(
              child: Text(title),
              onPressed: onPressed,
              style: TextButton.styleFrom(
                  elevation: 0,
                  shadowColor: Colors.transparent,
                  backgroundColor: const Color(0xFFB5B5B5)),
            ),
          ),
        );
      },
    );
  }

  Future<void> _submitted() async {
    final response = await _showConfirmDialog();
    if (response != true) return;
    return context.read<OrderDeleteCubit>().deleted(UniqueId());
  }

  Future<bool?> _showConfirmDialog() {
    return showDialog<bool>(
      context: context,
      builder: (context) => Material(
        color: Colors.transparent,
        child: Column(children: [
          const Spacer(),
          Container(
            color: Colors.white,
            margin: const EdgeInsets.symmetric(horizontal: kSpaceXXL),
            padding: const EdgeInsets.symmetric(
                vertical: kSpaceXL, horizontal: kSpaceXXL),
            child: Column(children: [
              kVSpaceL,
              const Text('Are you want cancel?'),
              kVSpaceXL,
              kVSpaceXL,
              Row(children: [
                Expanded(
                  child: SizedBox(
                    height: 40,
                    child: TextButton(
                        child: const Text('Cancel'),
                        onPressed: () => Navigator.of(context).pop(false)),
                  ),
                ),
                kHSpaceL,
                Expanded(
                  child: SizedBox(
                    height: 40,
                    child: ElevatedButton(
                        child: const Text('Confirm'),
                        onPressed: () => Navigator.of(context).pop(true),
                        style: ElevatedButton.styleFrom(
                            elevation: 0, shadowColor: Colors.transparent)),
                  ),
                ),
              ]),
              kVSpaceL,
            ]),
          ),
          const Spacer(),
        ]),
      ),
    );
  }
}
