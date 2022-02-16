part of 'widgets.dart';

const kFontName = 'Roboto';
const kRbtFont = TextStyle(fontFamily: kFontName);
const kComfortaaFont = TextStyle(fontFamily: 'Comfortaa');

final kHeadline1 = kRbtFont.copyWith(fontSize: 22, fontWeight: FontWeight.w500);
// [Bold or w700]
final kHeadline2 =
    kComfortaaFont.copyWith(fontSize: 36, fontWeight: FontWeight.w400);

final kTitle1 = kRbtFont.copyWith(fontSize: 28, fontWeight: FontWeight.w900);
final kTitleBold = kRbtFont.copyWith(fontSize: 16, fontWeight: FontWeight.bold);

final kBodyRegular = kRbtFont.copyWith(fontSize: 14);
final kBodyRegular12 = kRbtFont.copyWith(fontSize: 12);
final kBodyRegular16 = kRbtFont.copyWith(fontSize: 16);
final kBodyBold = kRbtFont.copyWith(fontSize: 14, fontWeight: FontWeight.bold);
final kBodyMedium =
    kRbtFont.copyWith(fontSize: 12, fontWeight: FontWeight.w500);

/// Body
final kBody1 = kRbtFont.copyWith(fontSize: 16, fontWeight: FontWeight.bold);
final kBody2 = kRbtFont.copyWith(fontSize: 16);
final kBody3 = kRbtFont.copyWith(fontSize: 12);

final kCaption1 = kRbtFont.copyWith(fontSize: 14, fontWeight: FontWeight.bold);
final kCaption2 = kRbtFont.copyWith(fontSize: 14);

// Button
final kBTNTitle = kRbtFont.copyWith(fontSize: 13, fontWeight: FontWeight.w900);

/// Form
/// [TextInput]
final kTextInput = kRbtFont.copyWith(fontSize: 15, fontWeight: FontWeight.w400);
final kTextInputHint = kTextInput.copyWith(color: kColorGrey6);
final kTextInputLabel =
    kRbtFont.copyWith(fontSize: 16, fontWeight: FontWeight.w500);
final kTextInputError =
    kTextInputHint.copyWith(fontSize: 14, color: kColorError);

final kBorderRadius = BorderRadius.circular(12);
const kBorderSide = BorderSide(width: 1, color: kColorGrey3);

final kTabBarTheme = TabBarTheme(
  labelColor: kTitleBold.color,
  unselectedLabelColor: kColorGrey2,
  labelStyle: kTitleBold.copyWith(fontSize: 18),
  unselectedLabelStyle: kTitleBold.copyWith(fontSize: 18),
  indicator: const BoxDecoration(
    border: Border(
      bottom: BorderSide(color: kColorPrimary, width: 2),
    ),
  ),
);

final textTheme = TextTheme(
  headline4: kComfortaaFont.copyWith(fontSize: 36, fontWeight: FontWeight.w400),
  subtitle1: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13),
  subtitle2: const TextStyle(fontWeight: FontWeight.w400, fontSize: 11),
  overline: const TextStyle(fontWeight: FontWeight.w900, fontSize: 13),
);

const appBarTheme = AppBarTheme(elevation: 0, centerTitle: false);

final elevatedButtonTheme = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    elevation: 0,
    textStyle: kBTNTitle,
    shadowColor: Colors.transparent,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(6.0)),
    ),
  ),
);

final outlinedButtonTheme = OutlinedButtonThemeData(
  style: OutlinedButton.styleFrom(
    elevation: 0,
    textStyle: kBTNTitle,
    shadowColor: Colors.transparent,
    side: const BorderSide(width: 2),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(6.0)),
    ),
  ),
);

final lightTheme = ThemeData(
  fontFamily: kFontName,
  appBarTheme: appBarTheme,
  tabBarTheme: kTabBarTheme,
  dividerColor: kColorGrey3,
  primaryColor: kColorPrimary,
  outlinedButtonTheme: outlinedButtonTheme,
  elevatedButtonTheme: elevatedButtonTheme,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  colorScheme: const ColorScheme.light(primary: kColorPrimary),
  textTheme: textTheme.copyWith(
      subtitle2: const TextStyle(
          fontWeight: FontWeight.w400, fontSize: 11, color: Colors.black54)),
);

final darkTheme = ThemeData(
  fontFamily: kFontName,
  appBarTheme: appBarTheme,
  tabBarTheme: kTabBarTheme,
  dividerColor: kColorGrey3,
  primaryColor: kColorGrey3,
  outlinedButtonTheme: outlinedButtonTheme,
  elevatedButtonTheme: elevatedButtonTheme,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  colorScheme: const ColorScheme.dark(primary: kColorGrey3),
  textTheme: textTheme.copyWith(
      subtitle2: const TextStyle(
          fontWeight: FontWeight.w400, fontSize: 11, color: Colors.white60)),
);
