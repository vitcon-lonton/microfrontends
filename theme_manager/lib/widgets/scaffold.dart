part of 'widgets.dart';

class WScaffold extends StatelessWidget {
  final Key? key;
  final Widget body;
  final bool gradient;
  final bool background;
  final bool? scrollable;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;

  const WScaffold.raw({
    this.key,
    required this.body,
    this.appBar,
    this.scrollable,
    this.gradient = false,
    this.background = true,
    this.bottomNavigationBar,
  }) : super(key: key);

  factory WScaffold(
      {Key? key,
      bool? scrollable,
      required Widget body,
      PreferredSizeWidget? appBar,
      Widget? bottomNavigationBar}) {
    return WScaffold.raw(
      key: key,
      body: body,
      appBar: appBar,
      gradient: false,
      background: false,
      scrollable: scrollable,
      bottomNavigationBar: bottomNavigationBar,
    );
  }

  factory WScaffold.gradient(
      {Key? key,
      bool? scrollable,
      required Widget body,
      PreferredSizeWidget? appBar,
      Widget? bottomNavigationBar}) {
    return WScaffold.raw(
        key: key,
        body: body,
        appBar: appBar,
        gradient: true,
        background: false,
        scrollable: scrollable,
        bottomNavigationBar: bottomNavigationBar);
  }

  factory WScaffold.consumer(
      {Key? key,
      bool? scrollable,
      required Widget body,
      PreferredSizeWidget? appBar,
      Widget? bottomNavigationBar}) {
    return WScaffold.raw(
        key: key,
        body: body,
        appBar: appBar,
        gradient: true,
        background: true,
        scrollable: scrollable,
        bottomNavigationBar: bottomNavigationBar);
  }

  @override
  Widget build(BuildContext context) {
    final scaffold = Scaffold(
      appBar: appBar,
      backgroundColor: Colors.transparent,
      bottomNavigationBar: bottomNavigationBar,
      body: (scrollable ?? false) ? SingleChildScrollView(child: body) : body,
    );

    // if (gradient && background) {
    //   return Background.consumer(child: scaffold);
    // } else if (gradient) return Background(child: scaffold);

    // return Background.gradient(child: scaffold);

    return Material(
      // color: Colors.white,
      child: (gradient && background)
          ? Background.consumer(child: scaffold)
          : !gradient
              ? scaffold
              : Background.gradient(child: scaffold),
    );
  }
}
