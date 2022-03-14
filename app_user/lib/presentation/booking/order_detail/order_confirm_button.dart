part of 'order_detail.dart';

class OrderConfirmButton extends StatefulWidget {
  const OrderConfirmButton({Key? key}) : super(key: key);

  @override
  State<OrderConfirmButton> createState() => _OrderConfirmButtonState();
}

class _OrderConfirmButtonState extends State<OrderConfirmButton> {
  @override
  Widget build(BuildContext context) {
    final txtConfirm = tr(LocaleKeys.txt_confirm);

    return BlocBuilder<OrderConfirmCubit, OrderConfirmState>(
      builder: (context, state) {
        String title = state.maybeWhen(
            orElse: () => txtConfirm, actionInProgress: () => '...');
        VoidCallback? onPressed = state.maybeWhen(
            orElse: () => _submitted, actionInProgress: () => null);

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
    return context.read<OrderConfirmCubit>().confirmed();
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
              Text(tr(LocaleKeys.msg_8)),
              kVSpaceXL,
              kVSpaceXL,
              Row(children: [
                Expanded(
                  child: SizedBox(
                    height: 40,
                    child: TextButton(
                        child: Text(tr(LocaleKeys.txt_review)),
                        onPressed: () => Navigator.of(context).pop(false)),
                  ),
                ),
                kHSpaceL,
                Expanded(
                  child: SizedBox(
                    height: 40,
                    child: ElevatedButton(
                        child: Text(tr(LocaleKeys.txt_agree)),
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
