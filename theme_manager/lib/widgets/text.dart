part of 'widgets.dart';

class Link extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;

  const Link({Key? key, required this.text, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        child: Text(
          text,
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 0.5,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
