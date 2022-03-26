/* spell-checker: disable */
part of 'booking_detail.dart';

class BookingStatusInfo extends StatelessWidget {
  final BookingStatus status;

  const BookingStatusInfo(this.status, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String note = tr(LocaleKeys.note_1);

    if (status == BookingStatus.pending) {
      note = tr(LocaleKeys.note_1);
    } else if (status == BookingStatus.process) {
      note = tr(LocaleKeys.note_2);
    } else if (status == BookingStatus.pending) {
      note = tr(LocaleKeys.note_1);
    } else if (status == BookingStatus.pending) {
      note = tr(LocaleKeys.note_1);
    } else if (status == BookingStatus.pending) {
      note = tr(LocaleKeys.note_1);
    } else if (status == BookingStatus.pending) {
      note = tr(LocaleKeys.note_1);
    }

    return Column(
        children: [
          ...[
            const Divider(height: 8.0, thickness: 8.0),
            kVSpaceM,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kSpaceM),
              child: RichText(
                maxLines: 5,
                text: TextSpan(children: [
                  TextSpan(
                      text: '${tr(LocaleKeys.txt_note)}: ',
                      style: const TextStyle(color: Color(0xFF009B19))),
                  TextSpan(text: note)
                ]),
              ),
            ),
            kVSpaceM,
          ],
        ],
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start);
  }
}
