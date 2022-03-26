import 'package:auto_route/auto_route.dart';
import '../article/article.dart';
import '../booking/booking_detail/booking_detail.dart';
import '../booking/booking_histories/booking_histories.dart';
import '../cart/cart.dart';
import '../category/category.dart';
import '../home/home.dart';
import '../image_selector/image_selector.dart';
import '../notifications/notifications.dart';
import '../service/service.dart';
import '../setting/setting.dart';
import '../splash/splash_page.dart';
import '../user/otp_confirm/otp_confirm.dart';
import '../user/password_change/password_change.dart';
import '../user/password_forget/password_forget.dart';
import '../user/password_update/password_update.dart';
import '../user/register/register.dart';
import '../user/sign_in/sign_in.dart';
import '../user/user_update/user_update.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    // HOME
    MaterialRoute(page: ImageSelector),
    MaterialRoute(page: HomePage, initial: true),
    // MaterialRoute(page: HomePage),

    // AUTH
    MaterialRoute(page: OtpConfirmPage),
    MaterialRoute(page: PasswordChangePage),
    MaterialRoute(page: PasswordForgetPage),
    MaterialRoute(page: PasswordUpdatePage),
    MaterialRoute(page: RegisterPage),
    MaterialRoute(page: SignInPage),
    MaterialRoute(page: SplashPage),
    MaterialRoute(page: UserUpdatePage),
    // MaterialRoute(page: SplashPage, initial: true),

    // FAVORITE
    MaterialRoute(page: FavoritesPage),

    // SETTING
    MaterialRoute(page: SettingsPage),

    // NOTIFICATION
    MaterialRoute(page: NotificationsPage),

    // SERVICE
    MaterialRoute(page: CategoriesPage),
    MaterialRoute(page: ServicesPage),
    MaterialRoute(page: ServiceBookingPage),
    // MaterialRoute(page: ServiceDetail),

    // BOOKING
    MaterialRoute(page: BookingDetailPage),
    MaterialRoute(page: BookingHistoriesPage),

    // CART
    MaterialRoute(page: CartPage),
    MaterialRoute(page: CartItemFormPage),

    // ARTICLES
    MaterialRoute(page: ArticlesPage),
    MaterialRoute(page: ArticleDetailPage),
  ],
)
class $Router {}
