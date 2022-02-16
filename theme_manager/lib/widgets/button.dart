part of 'widgets.dart';

class WSubmitBtn extends StatelessWidget {
  final Widget child;
  final BorderRadius? radius;
  final VoidCallback? onPressed;

  const WSubmitBtn({
    Key? key,
    this.radius,
    this.onPressed,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      width: double.infinity,
      child: ElevatedButton(child: child, onPressed: onPressed),
    );
  }
}

class WOutlineBtn extends StatelessWidget {
  final Widget child;
  final BorderRadius? radius;
  final VoidCallback? onPressed;

  const WOutlineBtn({
    Key? key,
    this.radius,
    this.onPressed,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      width: double.infinity,
      child: OutlinedButton(
        child: child,
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.onPrimary),
      ),
    );
  }
}

class BottomNav extends StatelessWidget {
  final bool submit;
  final Widget child;
  final VoidCallback? onPressed;

  const BottomNav._({
    Key? key,
    this.onPressed,
    required this.child,
    required this.submit,
  }) : super(key: key);

  factory BottomNav.raw({Key? key, required Widget child}) {
    return BottomNav._(key: key, child: child, submit: true, onPressed: null);
  }

  factory BottomNav.submit({
    Key? key,
    required Widget child,
    VoidCallback? onPressed,
  }) {
    return BottomNav._(
      key: key,
      child: child,
      submit: false,
      onPressed: onPressed,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: submit ? child : WSubmitBtn(child: child, onPressed: onPressed),
      minimum: const EdgeInsets.symmetric(
        horizontal: kSpaceM,
      ).copyWith(bottom: kSpaceS),
    );
  }
}
