import 'package:auto_route/auto_route.dart';

import '../article/article.dart';
import '../booking/cart/cart.dart';
import '../booking/order_detail/order_detail.dart';
import '../booking/order_histories/order_histories.dart';
import '../home/home.dart';
import '../notifications/notifications.dart';
import '../service/service.dart';
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
  // HOME
  MaterialRoute(page: HomePage, initial: true),
  // MaterialRoute(page: HomePage),

  // AUTH
  MaterialRoute(page: FavoritesPage),
  MaterialRoute(page: OtpConfirmPage),
  MaterialRoute(page: PasswordChangePage),
  MaterialRoute(page: PasswordForgetPage),
  MaterialRoute(page: PasswordUpdatePage),
  MaterialRoute(page: RegisterPage),
  MaterialRoute(page: SignInPage),
  MaterialRoute(page: SplashPage),
  MaterialRoute(page: UserUpdatePage),
  // MaterialRoute(page: SplashPage, initial: true),

  // SETTING
  MaterialRoute(page: SettingsPage),

  // NOTIFICATION
  MaterialRoute(page: NotificationsPage),

  // SERVICE
  MaterialRoute(page: ServiceDetail),
  MaterialRoute(page: ServiceBookingPage),
  MaterialRoute(page: CategoriesPage),

  // BOOKING
  MaterialRoute(page: CartPage),
  MaterialRoute(page: OrderDetailPage),
  MaterialRoute(page: OrderHistoriesPage),

  // ARTICLES
  MaterialRoute(page: ArticlesPage),
  MaterialRoute(page: ArticleDetailPage),
])
class $Router {}
