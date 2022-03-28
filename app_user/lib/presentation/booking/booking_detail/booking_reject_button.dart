part of 'booking_detail.dart';

class OrderRejectButton extends StatefulWidget {
  final int bookingId;

  const OrderRejectButton(this.bookingId, {Key? key}) : super(key: key);

  @override
  State<OrderRejectButton> createState() => _OrderRejectButtonState();
}

class _OrderRejectButtonState extends State<OrderRejectButton> {
  @override
  Widget build(BuildContext context) {
    final txtReject = tr(LocaleKeys.txt_reject);

    return BlocBuilder<BookingCancelCubit, BookingCancelState>(
      builder: (context, state) {
        String title =
            state.maybeWhen(orElse: () => txtReject, inProgress: () => '...');
        VoidCallback? onPressed =
            state.maybeWhen(orElse: () => _submitted, inProgress: () => null);

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
    if (response != false) return;
    return context.read<BookingCancelCubit>().canceled(widget.bookingId);
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
              Text(tr(LocaleKeys.msg_7)),
              kVSpaceXL,
              kVSpaceXL,
              Row(children: [
                Expanded(
                  child: SizedBox(
                    height: 40,
                    child: TextButton(
                        child: Text(tr(LocaleKeys.txt_reject)),
                        onPressed: () => Navigator.of(context).pop(false)),
                  ),
                ),
                kHSpaceL,
                Expanded(
                  child: SizedBox(
                    height: 40,
                    child: ElevatedButton(
                        child: Text(tr(LocaleKeys.txt_review)),
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
