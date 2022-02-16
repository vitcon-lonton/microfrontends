part of 'widgets.dart';

class WHeader1 extends StatelessWidget {
  final String data;

  const WHeader1(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(children: [Text(data, style: kTitle1), const Spacer()]),
    );
  }
}
