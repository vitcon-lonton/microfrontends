part of 'order_detail.dart';

class OrderCancelButton extends StatefulWidget {
  const OrderCancelButton({Key? key}) : super(key: key);

  @override
  State<OrderCancelButton> createState() => _OrderCancelButtonState();
}

class _OrderCancelButtonState extends State<OrderCancelButton> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderDetailCubit, OrderDetailState>(
      buildWhen: (prev, cur) =>
          prev.isCanceling != cur.isCanceling ||
          prev.isCancelAvailable != cur.isCancelAvailable,
      builder: (context, state) {
        if (!state.isCancelAvailable) return kSpaceZero;

        return Expanded(
          child: SizedBox(
            height: 45,
            child: ElevatedButton(
              onPressed: state.isCanceling ? null : _onPressed,
              child: Text(state.isCanceling ? '...' : 'Reject'),
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

  Future _onPressed() async {
    final confirmResponse = await _confirm();
    if (confirmResponse != true) return;
    context.read<OrderDetailCubit>().deleteOrderRequested(UniqueId());
  }

  Future<bool?> _confirm() {
    return showDialog<bool?>(
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
                        Navigator.of(context).pop(true);
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
