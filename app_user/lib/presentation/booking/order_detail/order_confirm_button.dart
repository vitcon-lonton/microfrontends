part of 'order_detail.dart';

class OrderConfirmButton extends StatefulWidget {
  const OrderConfirmButton({Key? key}) : super(key: key);

  @override
  State<OrderConfirmButton> createState() => _OrderConfirmButtonState();
}

class _OrderConfirmButtonState extends State<OrderConfirmButton> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCreateCubit, CartCreateState>(
      builder: (context, state) {
        String title = 'Confirm';
        VoidCallback? onPressed = _submitted;

        state.whenOrNull(actionInProgress: () {
          title = '';
          onPressed = null;
        });

        return Expanded(
          child: SizedBox(
              height: 45,
              child: ElevatedButton(
                  child: Text(title),
                  onPressed: onPressed,
                  style: ElevatedButton.styleFrom(
                      elevation: 0, shadowColor: Colors.transparent))),
        );
      },
    );
  }

  Future<void> _submitted() async {
    final response = await _showConfirmDialog();
    if (response != true) return;
    return context.read<OrderDetailCubit>().deleteOrderRequested(UniqueId());
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
                  child: TextButton(
                      child: const Text('Cancel'),
                      onPressed: Navigator.of(context).pop),
                ),
                kHSpaceL,
                Expanded(
                  child: ElevatedButton(
                      child: const Text('Cancel'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                          elevation: 0, shadowColor: Colors.transparent)),
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
