part of 'order_detail.dart';

class OrderConfirmButton extends StatefulWidget {
  const OrderConfirmButton({Key? key}) : super(key: key);

  @override
  State<OrderConfirmButton> createState() => _OrderConfirmButtonState();
}

class _OrderConfirmButtonState extends State<OrderConfirmButton> {
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
              onPressed: state.isCanceling ? null : _confirm,
              child: Text(state.isCanceling ? '...' : 'Confirm'),
              style: ElevatedButton.styleFrom(
                  elevation: 0, shadowColor: Colors.transparent),
            ),
          ),
        );
      },
    );
  }

  void _confirm() {
    showDialog(
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
                        context.read<OrderDetailCubit>().cancelOrderRequested();
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
