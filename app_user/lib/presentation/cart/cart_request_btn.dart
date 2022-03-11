/* spell-checker: disable */
part of 'cart.dart';

class CartRequestBtn extends StatefulWidget {
  const CartRequestBtn({Key? key}) : super(key: key);

  @override
  State<CartRequestBtn> createState() => _CartRequestBtnState();
}

class _CartRequestBtnState extends State<CartRequestBtn> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderCreateCubit, OrderCreateState>(
      builder: (context, state) => state.maybeMap(
          actionInProgress: (state) {
            return BottomNav.submit(child: const Text('...'), onPressed: null);
          },
          orElse: () => BottomNav.submit(
              child: const Text('SEND REQUEST'), onPressed: _submitted)),
    );
  }

  Future<bool> _confirm() async {
    await showDialog<bool?>(
      context: context,
      builder: (context) => Material(
        color: Colors.transparent,
        child: Column(children: [
          const Spacer(),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4.0),
            ),
            margin: const EdgeInsets.symmetric(horizontal: kSpaceXXL * 2),
            padding: const EdgeInsets.symmetric(
                vertical: kSpaceXL, horizontal: kSpaceXXL),
            child: Column(children: [
              kVSpaceL,
              Icon(Icons.check_circle,
                  size: 82, color: Theme.of(context).primaryColor),
              kVSpaceL,
              const Text(
                'Nhân viên tư vấn sẽ liên hệ trong vòng 24h, vui lòng giữ máy.',
              ),
              kVSpaceXL,
              kVSpaceXL,
              Row(children: [
                Expanded(
                  child: SizedBox(
                    height: 40,
                    child: ElevatedButton(
                        child: const Text('Accept'),
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

    return true;
  }

  Future<void> _submitted() async {
    await _confirm();

    return context.read<OrderCreateCubit>().created({});
  }
}
