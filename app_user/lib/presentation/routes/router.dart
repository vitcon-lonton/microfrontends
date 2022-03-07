import 'package:app_user/presentation/favorites/favorites.dart';
import 'package:app_user/presentation/home/home.dart';
import 'package:app_user/presentation/notifications/notifications.dart';
import 'package:app_user/presentation/otp_confirm/otp_confirm.dart';
import 'package:app_user/presentation/password_change/password_change.dart';
import 'package:app_user/presentation/password_forget/password_forget.dart';
import 'package:app_user/presentation/password_update/password_update.dart';
import 'package:app_user/presentation/register/register.dart';
import 'package:app_user/presentation/settings/settings_page.dart';
import 'package:app_user/presentation/sign_in/sign_in_page.dart';
import 'package:app_user/presentation/splash/splash_page.dart';
import 'package:app_user/presentation/user_update/user_update.dart';
import 'package:auto_route/auto_route.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    // MaterialRoute(page: SplashPage, initial: true),
    // MaterialRoute(page: SignInPage),
    MaterialRoute(page: FavoritesPage),
    MaterialRoute(page: HomePage),
    MaterialRoute(page: NotificationsPage),
    MaterialRoute(page: OtpConfirmPage),
    MaterialRoute(page: PasswordChangePage),
    MaterialRoute(page: PasswordForgetPage),
    MaterialRoute(page: PasswordUpdatePage),
    MaterialRoute(page: RegisterPage),
    MaterialRoute(page: SettingsPage),
    MaterialRoute(page: SignInPage),
    MaterialRoute(page: SplashPage, initial: true),
    MaterialRoute(page: UserUpdatePage),
  ],
)
class $Router {}
