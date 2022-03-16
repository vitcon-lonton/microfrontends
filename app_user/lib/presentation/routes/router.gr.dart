// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i19;
import 'package:flutter/material.dart' as _i20;

import '../../module/article/article.dart' as _i21;
import '../article/article.dart' as _i18;
import '../booking/booking_histories/booking_histories.dart' as _i16;
import '../booking/order_detail/order_detail.dart' as _i15;
import '../cart/cart.dart' as _i17;
import '../favorites/favorites.dart' as _i11;
import '../home/home.dart' as _i2;
import '../image_selector/image_selector.dart' as _i1;
import '../notifications/notifications.dart' as _i13;
import '../service/service.dart' as _i14;
import '../setting/setting.dart' as _i12;
import '../splash/splash_page.dart' as _i9;
import '../user/otp_confirm/otp_confirm.dart' as _i3;
import '../user/password_change/password_change.dart' as _i4;
import '../user/password_forget/password_forget.dart' as _i5;
import '../user/password_update/password_update.dart' as _i6;
import '../user/register/register.dart' as _i7;
import '../user/sign_in/sign_in.dart' as _i8;
import '../user/user_update/user_update.dart' as _i10;

class Router extends _i19.RootStackRouter {
  Router([_i20.GlobalKey<_i20.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i19.PageFactory> pagesMap = {
    ImageSelectorRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.ImageSelector());
    },
    HomePageRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.HomePage());
    },
    OtpConfirmPageRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.OtpConfirmPage());
    },
    PasswordChangePageRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.PasswordChangePage());
    },
    PasswordForgetPageRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.PasswordForgetPage());
    },
    PasswordUpdatePageRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.PasswordUpdatePage());
    },
    RegisterPageRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.RegisterPage());
    },
    SignInPageRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.SignInPage());
    },
    SplashPageRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.SplashPage());
    },
    UserUpdatePageRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i10.UserUpdatePage());
    },
    FavoritesPageRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.FavoritesPage());
    },
    SettingsPageRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i12.SettingsPage());
    },
    NotificationsPageRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i13.NotificationsPage());
    },
    CategoriesPageRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i14.CategoriesPage());
    },
    ServicesPageRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i14.ServicesPage());
    },
    ServiceBookingPageRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i14.ServiceBookingPage());
    },
    OrderDetailPageRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i15.OrderDetailPage());
    },
    BookingHistoriesPageRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i16.BookingHistoriesPage());
    },
    CartPageRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i17.CartPage());
    },
    CartItemUpdatePageRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i17.CartItemUpdatePage());
    },
    ArticlesPageRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i18.ArticlesPage());
    },
    ArticleDetailPageRoute.name: (routeData) {
      final args = routeData.argsAs<ArticleDetailPageRouteArgs>();
      return _i19.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i18.ArticleDetailPage(key: args.key, article: args.article));
    }
  };

  @override
  List<_i19.RouteConfig> get routes => [
        _i19.RouteConfig(ImageSelectorRoute.name, path: '/image-selector'),
        _i19.RouteConfig(HomePageRoute.name, path: '/'),
        _i19.RouteConfig(OtpConfirmPageRoute.name, path: '/otp-confirm-page'),
        _i19.RouteConfig(PasswordChangePageRoute.name,
            path: '/password-change-page'),
        _i19.RouteConfig(PasswordForgetPageRoute.name,
            path: '/password-forget-page'),
        _i19.RouteConfig(PasswordUpdatePageRoute.name,
            path: '/password-update-page'),
        _i19.RouteConfig(RegisterPageRoute.name, path: '/register-page'),
        _i19.RouteConfig(SignInPageRoute.name, path: '/sign-in-page'),
        _i19.RouteConfig(SplashPageRoute.name, path: '/splash-page'),
        _i19.RouteConfig(UserUpdatePageRoute.name, path: '/user-update-page'),
        _i19.RouteConfig(FavoritesPageRoute.name, path: '/favorites-page'),
        _i19.RouteConfig(SettingsPageRoute.name, path: '/settings-page'),
        _i19.RouteConfig(NotificationsPageRoute.name,
            path: '/notifications-page'),
        _i19.RouteConfig(CategoriesPageRoute.name, path: '/categories-page'),
        _i19.RouteConfig(ServicesPageRoute.name, path: '/services-page'),
        _i19.RouteConfig(ServiceBookingPageRoute.name,
            path: '/service-booking-page'),
        _i19.RouteConfig(OrderDetailPageRoute.name, path: '/order-detail-page'),
        _i19.RouteConfig(BookingHistoriesPageRoute.name,
            path: '/booking-histories-page'),
        _i19.RouteConfig(CartPageRoute.name, path: '/cart-page'),
        _i19.RouteConfig(CartItemUpdatePageRoute.name,
            path: '/cart-item-update-page'),
        _i19.RouteConfig(ArticlesPageRoute.name, path: '/articles-page'),
        _i19.RouteConfig(ArticleDetailPageRoute.name,
            path: '/article-detail-page')
      ];
}

/// generated route for
/// [_i1.ImageSelector]
class ImageSelectorRoute extends _i19.PageRouteInfo<void> {
  const ImageSelectorRoute()
      : super(ImageSelectorRoute.name, path: '/image-selector');

  static const String name = 'ImageSelectorRoute';
}

/// generated route for
/// [_i2.HomePage]
class HomePageRoute extends _i19.PageRouteInfo<void> {
  const HomePageRoute() : super(HomePageRoute.name, path: '/');

  static const String name = 'HomePageRoute';
}

/// generated route for
/// [_i3.OtpConfirmPage]
class OtpConfirmPageRoute extends _i19.PageRouteInfo<void> {
  const OtpConfirmPageRoute()
      : super(OtpConfirmPageRoute.name, path: '/otp-confirm-page');

  static const String name = 'OtpConfirmPageRoute';
}

/// generated route for
/// [_i4.PasswordChangePage]
class PasswordChangePageRoute extends _i19.PageRouteInfo<void> {
  const PasswordChangePageRoute()
      : super(PasswordChangePageRoute.name, path: '/password-change-page');

  static const String name = 'PasswordChangePageRoute';
}

/// generated route for
/// [_i5.PasswordForgetPage]
class PasswordForgetPageRoute extends _i19.PageRouteInfo<void> {
  const PasswordForgetPageRoute()
      : super(PasswordForgetPageRoute.name, path: '/password-forget-page');

  static const String name = 'PasswordForgetPageRoute';
}

/// generated route for
/// [_i6.PasswordUpdatePage]
class PasswordUpdatePageRoute extends _i19.PageRouteInfo<void> {
  const PasswordUpdatePageRoute()
      : super(PasswordUpdatePageRoute.name, path: '/password-update-page');

  static const String name = 'PasswordUpdatePageRoute';
}

/// generated route for
/// [_i7.RegisterPage]
class RegisterPageRoute extends _i19.PageRouteInfo<void> {
  const RegisterPageRoute()
      : super(RegisterPageRoute.name, path: '/register-page');

  static const String name = 'RegisterPageRoute';
}

/// generated route for
/// [_i8.SignInPage]
class SignInPageRoute extends _i19.PageRouteInfo<void> {
  const SignInPageRoute() : super(SignInPageRoute.name, path: '/sign-in-page');

  static const String name = 'SignInPageRoute';
}

/// generated route for
/// [_i9.SplashPage]
class SplashPageRoute extends _i19.PageRouteInfo<void> {
  const SplashPageRoute() : super(SplashPageRoute.name, path: '/splash-page');

  static const String name = 'SplashPageRoute';
}

/// generated route for
/// [_i10.UserUpdatePage]
class UserUpdatePageRoute extends _i19.PageRouteInfo<void> {
  const UserUpdatePageRoute()
      : super(UserUpdatePageRoute.name, path: '/user-update-page');

  static const String name = 'UserUpdatePageRoute';
}

/// generated route for
/// [_i11.FavoritesPage]
class FavoritesPageRoute extends _i19.PageRouteInfo<void> {
  const FavoritesPageRoute()
      : super(FavoritesPageRoute.name, path: '/favorites-page');

  static const String name = 'FavoritesPageRoute';
}

/// generated route for
/// [_i12.SettingsPage]
class SettingsPageRoute extends _i19.PageRouteInfo<void> {
  const SettingsPageRoute()
      : super(SettingsPageRoute.name, path: '/settings-page');

  static const String name = 'SettingsPageRoute';
}

/// generated route for
/// [_i13.NotificationsPage]
class NotificationsPageRoute extends _i19.PageRouteInfo<void> {
  const NotificationsPageRoute()
      : super(NotificationsPageRoute.name, path: '/notifications-page');

  static const String name = 'NotificationsPageRoute';
}

/// generated route for
/// [_i14.CategoriesPage]
class CategoriesPageRoute extends _i19.PageRouteInfo<void> {
  const CategoriesPageRoute()
      : super(CategoriesPageRoute.name, path: '/categories-page');

  static const String name = 'CategoriesPageRoute';
}

/// generated route for
/// [_i14.ServicesPage]
class ServicesPageRoute extends _i19.PageRouteInfo<void> {
  const ServicesPageRoute()
      : super(ServicesPageRoute.name, path: '/services-page');

  static const String name = 'ServicesPageRoute';
}

/// generated route for
/// [_i14.ServiceBookingPage]
class ServiceBookingPageRoute extends _i19.PageRouteInfo<void> {
  const ServiceBookingPageRoute()
      : super(ServiceBookingPageRoute.name, path: '/service-booking-page');

  static const String name = 'ServiceBookingPageRoute';
}

/// generated route for
/// [_i15.OrderDetailPage]
class OrderDetailPageRoute extends _i19.PageRouteInfo<void> {
  const OrderDetailPageRoute()
      : super(OrderDetailPageRoute.name, path: '/order-detail-page');

  static const String name = 'OrderDetailPageRoute';
}

/// generated route for
/// [_i16.BookingHistoriesPage]
class BookingHistoriesPageRoute extends _i19.PageRouteInfo<void> {
  const BookingHistoriesPageRoute()
      : super(BookingHistoriesPageRoute.name, path: '/booking-histories-page');

  static const String name = 'BookingHistoriesPageRoute';
}

/// generated route for
/// [_i17.CartPage]
class CartPageRoute extends _i19.PageRouteInfo<void> {
  const CartPageRoute() : super(CartPageRoute.name, path: '/cart-page');

  static const String name = 'CartPageRoute';
}

/// generated route for
/// [_i17.CartItemUpdatePage]
class CartItemUpdatePageRoute extends _i19.PageRouteInfo<void> {
  const CartItemUpdatePageRoute()
      : super(CartItemUpdatePageRoute.name, path: '/cart-item-update-page');

  static const String name = 'CartItemUpdatePageRoute';
}

/// generated route for
/// [_i18.ArticlesPage]
class ArticlesPageRoute extends _i19.PageRouteInfo<void> {
  const ArticlesPageRoute()
      : super(ArticlesPageRoute.name, path: '/articles-page');

  static const String name = 'ArticlesPageRoute';
}

/// generated route for
/// [_i18.ArticleDetailPage]
class ArticleDetailPageRoute
    extends _i19.PageRouteInfo<ArticleDetailPageRouteArgs> {
  ArticleDetailPageRoute({_i20.Key? key, required _i21.Article article})
      : super(ArticleDetailPageRoute.name,
            path: '/article-detail-page',
            args: ArticleDetailPageRouteArgs(key: key, article: article));

  static const String name = 'ArticleDetailPageRoute';
}

class ArticleDetailPageRouteArgs {
  const ArticleDetailPageRouteArgs({this.key, required this.article});

  final _i20.Key? key;

  final _i21.Article article;

  @override
  String toString() {
    return 'ArticleDetailPageRouteArgs{key: $key, article: $article}';
  }
}
