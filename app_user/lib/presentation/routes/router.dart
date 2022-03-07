import 'package:auto_route/auto_route.dart';

import '../booking/cart/cart.dart';
import '../booking/order_detail/order_detail.dart';
import '../booking/order_histories/order_histories.dart';
import '../home/home.dart';
import '../notifications/notifications.dart';
import '../service/service_booking/service_booking_page.dart';
import '../service/service_detail/service_detail.dart';
import '../settings/settings_page.dart';
import '../user/favorites/favorites.dart';
import '../user/otp_confirm/otp_confirm.dart';
import '../user/password_change/password_change.dart';
import '../user/password_forget/password_forget.dart';
import '../user/password_update/password_update.dart';
import '../user/register/register.dart';
import '../user/sign_in/sign_in_page.dart';
import '../user/splash/splash_page.dart';
import '../user/user_update/user_update.dart';

@MaterialAutoRouter(routes: <AutoRoute>[
  // MaterialRoute(page: SplashPage, initial: true),
  // MaterialRoute(page: HomePage),
  // HOME
  MaterialRoute(page: HomePage, initial: true),

  // AUTH
  MaterialRoute(page: FavoritesPage),
  MaterialRoute(page: OtpConfirmPage),
  MaterialRoute(page: PasswordChangePage),
  MaterialRoute(page: PasswordForgetPage),
  MaterialRoute(page: PasswordUpdatePage),
  MaterialRoute(page: RegisterPage),
  MaterialRoute(page: SignInPage),
  MaterialRoute(page: SplashPage),
  // MaterialRoute(page: SplashPage, initial: true),
  MaterialRoute(page: UserUpdatePage),

  // SETTING
  MaterialRoute(page: SettingsPage),

  // NOTIFICATION
  MaterialRoute(page: NotificationsPage),

  // SERVICE
  MaterialRoute(page: ServiceDetail),
  MaterialRoute(page: ServiceBookingPage),

  // BOOKING
  MaterialRoute(page: CartPage),
  MaterialRoute(page: OrderDetailPage),
  MaterialRoute(page: OrderHistoriesPage),
])
class $Router {}
