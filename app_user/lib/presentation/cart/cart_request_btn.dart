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
    return BlocBuilder<CartCubit, CartState>(buildWhen: (prev, cur) {
      return prev.isSubmitAvailable != cur.isSubmitAvailable;
    }, builder: (context, state) {
      final isSubmitAvailable = state.isSubmitAvailable;
      final title = isSubmitAvailable ? 'SEND REQUEST' : '...';

      return BottomNav.submit(
          child: Text(title),
          onPressed: isSubmitAvailable ? _submitRequest : null);
    });
  }

  Future _submitRequest() async {
    final confirmResponse = await _confirm();
    if (confirmResponse != true) return;
    context.read<CartCubit>().submitBookingRequested();
  }

  Future<bool?> _confirm() {
    return showDialog<bool?>(
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
  }
}
