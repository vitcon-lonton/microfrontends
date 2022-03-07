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
      buildWhen: (prev, cur) => prev.isCancelAvailable || cur.isCancelAvailable,
      builder: (context, state) {
        if (!state.isCancelAvailable) return kSpaceZero;

        return Column(children: [
          kVSpaceL,
          _horizontalPaddingM(BlocBuilder<OrderDetailCubit, OrderDetailState>(
              buildWhen: (prev, cur) => prev.isCanceling || cur.isCanceling,
              builder: (context, state) => WSubmitBtn(
                  child: Text(state.isCanceling ? '...' : 'CANCEL'),
                  onPressed: state.isCanceling ? null : _confirm)))
        ]);
      },
    );
  }

  Widget _horizontalPaddingM(Widget child) {
    return Padding(
        child: child, padding: const EdgeInsets.symmetric(horizontal: kSpaceM));
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
