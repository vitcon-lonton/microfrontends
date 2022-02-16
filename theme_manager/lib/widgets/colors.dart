part of 'widgets.dart';

/// The height of the toolbar component of the [AppBar].
const kColorGrey = Colors.grey;
const kColorGrey1 = Color(0xffC4C4C4);
const kColorGrey2 = Color(0xffD9D9D9);
const kColorGrey3 = Color(0xffF0EEEE);
const kColorGrey4 = Color(0xff92929D);
const kColorGrey5 = Color(0xff979797);
const kColorGrey6 = Color(0xff6e6e6e);
const kColorGrey7 = Color(0xffFAFAFA);

const kColorBlack = Colors.black;
const kColorPrimary = kColorBlack;
// const kColorSecondary = Colors.red;
const kColorAccentBlue = Color(0xff244495);
const kColorBlue2 = Color.fromRGBO(194, 214, 232, 0.5);
const kColorBlue3 = Color.fromRGBO(224, 224, 224, 0.5);

const kColorError = Color(0xffed1C24);
const kColorRed2 = Color(0xffF66268);

const kColorGreen = Color(0xff27AE60);
const kColorOrange = Color(0xffF2994A);

extension ColorsExt on Widget {
  Color get onPrimary => Colors.white;
  Color get primaryColor => kColorPrimary;
}
