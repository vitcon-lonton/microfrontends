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
    return BlocBuilder<CartAllCubit, CartAllState>(buildWhen: (prev, cur) {
      return prev.items != cur.items && cur.items.isEmpty() != true;
    }, builder: (context, state) {
      if (state.items.isEmpty()) {
        return BottomNav.submit(
            child: Text(tr(LocaleKeys.txt_send_request).toUpperCase()),
            onPressed: null);
      }

      return BlocBuilder<SyncCubit, SyncState>(
        builder: (context, state) => state.maybeWhen(inProgress: () {
          return BottomNav.submit(child: const Text('...'), onPressed: null);
        }, orElse: () {
          return BottomNav.submit(
              child: Text(tr(LocaleKeys.txt_send_request).toUpperCase()),
              onPressed: _submitted);
        }),
      );
    });
  }

  Future<bool> _confirm() async {
    await showDialog<bool?>(
      context: context,
      builder: (context) => Material(
        color: Colors.transparent,
        child: Column(children: [
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(
                vertical: kSpaceXL, horizontal: kSpaceXXL),
            margin: const EdgeInsets.symmetric(horizontal: kSpaceXXL * 2),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(4.0)),
            child: Column(children: [
              kVSpaceL,
              Icon(Icons.check_circle,
                  size: 82, color: Theme.of(context).primaryColor),
              kVSpaceL,
              Text(tr(LocaleKeys.msg_2)),
              kVSpaceXL,
              kVSpaceXL,
              Row(children: [
                Expanded(
                  child: SizedBox(
                      height: 40,
                      child: ElevatedButton(
                          child: Text(tr(LocaleKeys.txt_agree)),
                          style: ElevatedButton.styleFrom(
                              elevation: 0, shadowColor: Colors.transparent),
                          onPressed: () => Navigator.of(context).pop(true))),
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
    return context.read<SyncCubit>().synced();
  }
}
