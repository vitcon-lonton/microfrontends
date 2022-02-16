part of 'widgets.dart';

class WAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final Color? backgroundColor;
  final List<Widget>? actions;

  const WAppBar({
    Key? key,
    required this.title,
    this.backgroundColor,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ModalRoute<dynamic>? parentRoute = ModalRoute.of(context);
    final bool canPop = parentRoute?.canPop ?? false;

    return AppBar(
      elevation: 0,
      // centerTitle: false,
      // iconTheme: const IconThemeData(),
      backgroundColor: backgroundColor ?? Colors.transparent,
      bottom: PreferredSize(
        preferredSize: preferredSize,
        child: DefaultTextStyle(
          style: Theme.of(context)
              .textTheme
              .headline4!
              .copyWith(color: Theme.of(context).primaryColor),
          child: Row(children: [kHSpaceM, title, const Spacer()]),
        ),
      ),
      actions: actions,
      leading: !canPop
          ? null
          : IconButton(
              iconSize: 40,
              icon: kIcUnion,
              padding: const EdgeInsets.all(2.0),
              onPressed: () => Navigator.maybePop(context)),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 30);
}
