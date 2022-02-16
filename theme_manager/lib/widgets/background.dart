part of 'widgets.dart';

class Background extends StatelessWidget {
  final Widget child;
  final bool gradient;
  final bool background;
  final bool splash;

  const Background.raw({
    Key? key,
    required this.child,
    required this.gradient,
    required this.background,
    required this.splash,
  }) : super(key: key);

  factory Background({required Widget child}) {
    return Background.raw(
        child: child, gradient: false, splash: false, background: true);
  }

  factory Background.gradient({required Widget child}) {
    return Background.raw(
        child: child, splash: false, gradient: true, background: false);
  }

  factory Background.consumer({required Widget child}) {
    return Background.raw(
        child: child, splash: false, gradient: true, background: true);
  }

  factory Background.splash({required Widget child}) {
    return Background.raw(
      child: child,
      splash: true,
      gradient: false,
      background: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (gradient) Positioned(left: 0, top: 0, right: 0, child: kImgBGGRD),
        if (background) Positioned(left: 0, top: 0, right: 0, child: kImgBG),
        if (splash)
          Positioned(left: 0, top: 0, right: 0, child: kImgFlashBanner),
        child,
      ],
    );
  }
}
