/* spell-checker: disable */
part of 'booking_detail.dart';

class BookingStatusInfo extends StatelessWidget {
  final BookingStatus status;

  const BookingStatusInfo(this.status, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kSpaceM),
      child: RichText(
        maxLines: 5,
        text: TextSpan(children: [
          TextSpan(
              text: '${tr(LocaleKeys.txt_note)}: ',
              style: const TextStyle(color: Color(0xFF009B19))),
          TextSpan(
              text: status.when(
                  pending: () => tr(LocaleKeys.note_1),
                  process: () => tr(LocaleKeys.note_2),
                  confirm: () => tr(LocaleKeys.note_3),
                  doing: () => tr(LocaleKeys.note_4),
                  cancelled: () => tr(LocaleKeys.note_5),
                  complete: () => tr(LocaleKeys.note_6)))
        ]),
      ),
    );
  }
}
