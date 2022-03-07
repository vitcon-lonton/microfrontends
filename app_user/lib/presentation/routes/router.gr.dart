// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i18;
import 'package:flutter/material.dart' as _i19;

import '../article/article.dart' as _i17;
import '../booking/cart/cart.dart' as _i14;
import '../booking/order_detail/order_detail.dart' as _i15;
import '../booking/order_histories/order_histories.dart' as _i16;
import '../home/home.dart' as _i1;
import '../notifications/notifications.dart' as _i12;
import '../service/service.dart' as _i13;
import '../settings/settings_page.dart' as _i11;
import '../user/favorites/favorites.dart' as _i2;
import '../user/otp_confirm/otp_confirm.dart' as _i3;
import '../user/password_change/password_change.dart' as _i4;
import '../user/password_forget/password_forget.dart' as _i5;
import '../user/password_update/password_update.dart' as _i6;
import '../user/register/register.dart' as _i7;
import '../user/sign_in/sign_in_page.dart' as _i8;
import '../user/splash/splash_page.dart' as _i9;
import '../user/user_update/user_update.dart' as _i10;

class Router extends _i18.RootStackRouter {
  Router([_i19.GlobalKey<_i19.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i18.PageFactory> pagesMap = {
    HomePageRoute.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.HomePage());
    },
    FavoritesPageRoute.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.FavoritesPage());
    },
    OtpConfirmPageRoute.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.OtpConfirmPage());
    },
    PasswordChangePageRoute.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.PasswordChangePage());
    },
    PasswordForgetPageRoute.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.PasswordForgetPage());
    },
    PasswordUpdatePageRoute.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.PasswordUpdatePage());
    },
    RegisterPageRoute.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.RegisterPage());
    },
    SignInPageRoute.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.SignInPage());
    },
    SplashPageRoute.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.SplashPage());
    },
    UserUpdatePageRoute.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i10.UserUpdatePage());
    },
    SettingsPageRoute.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.SettingsPage());
    },
    NotificationsPageRoute.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i12.NotificationsPage());
    },
    ServiceDetailRoute.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i13.ServiceDetail());
    },
    ServiceBookingPageRoute.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i13.ServiceBookingPage());
    },
    CategoriesPageRoute.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i13.CategoriesPage());
    },
    CartPageRoute.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i14.CartPage());
    },
    OrderDetailPageRoute.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i15.OrderDetailPage());
    },
    OrderHistoriesPageRoute.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i16.OrderHistoriesPage());
    },
    ArticlesPageRoute.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i17.ArticlesPage());
    },
    ArticleDetailPageRoute.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i17.ArticleDetailPage());
    }
  };

  @override
  List<_i18.RouteConfig> get routes => [
        _i18.RouteConfig(HomePageRoute.name, path: '/'),
        _i18.RouteConfig(FavoritesPageRoute.name, path: '/favorites-page'),
        _i18.RouteConfig(OtpConfirmPageRoute.name, path: '/otp-confirm-page'),
        _i18.RouteConfig(PasswordChangePageRoute.name,
            path: '/password-change-page'),
        _i18.RouteConfig(PasswordForgetPageRoute.name,
            path: '/password-forget-page'),
        _i18.RouteConfig(PasswordUpdatePageRoute.name,
            path: '/password-update-page'),
        _i18.RouteConfig(RegisterPageRoute.name, path: '/register-page'),
        _i18.RouteConfig(SignInPageRoute.name, path: '/sign-in-page'),
        _i18.RouteConfig(SplashPageRoute.name, path: '/splash-page'),
        _i18.RouteConfig(UserUpdatePageRoute.name, path: '/user-update-page'),
        _i18.RouteConfig(SettingsPageRoute.name, path: '/settings-page'),
        _i18.RouteConfig(NotificationsPageRoute.name,
            path: '/notifications-page'),
        _i18.RouteConfig(ServiceDetailRoute.name, path: '/service-detail'),
        _i18.RouteConfig(ServiceBookingPageRoute.name,
            path: '/service-booking-page'),
        _i18.RouteConfig(CategoriesPageRoute.name, path: '/categories-page'),
        _i18.RouteConfig(CartPageRoute.name, path: '/cart-page'),
        _i18.RouteConfig(OrderDetailPageRoute.name, path: '/order-detail-page'),
        _i18.RouteConfig(OrderHistoriesPageRoute.name,
            path: '/order-histories-page'),
        _i18.RouteConfig(ArticlesPageRoute.name, path: '/articles-page'),
        _i18.RouteConfig(ArticleDetailPageRoute.name,
            path: '/article-detail-page')
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomePageRoute extends _i18.PageRouteInfo<void> {
  const HomePageRoute() : super(HomePageRoute.name, path: '/');

  static const String name = 'HomePageRoute';
}

/// generated route for
/// [_i2.FavoritesPage]
class FavoritesPageRoute extends _i18.PageRouteInfo<void> {
  const FavoritesPageRoute()
      : super(FavoritesPageRoute.name, path: '/favorites-page');

  static const String name = 'FavoritesPageRoute';
}

/// generated route for
/// [_i3.OtpConfirmPage]
class OtpConfirmPageRoute extends _i18.PageRouteInfo<void> {
  const OtpConfirmPageRoute()
      : super(OtpConfirmPageRoute.name, path: '/otp-confirm-page');

  static const String name = 'OtpConfirmPageRoute';
}

/// generated route for
/// [_i4.PasswordChangePage]
class PasswordChangePageRoute extends _i18.PageRouteInfo<void> {
  const PasswordChangePageRoute()
      : super(PasswordChangePageRoute.name, path: '/password-change-page');

  static const String name = 'PasswordChangePageRoute';
}

/// generated route for
/// [_i5.PasswordForgetPage]
class PasswordForgetPageRoute extends _i18.PageRouteInfo<void> {
  const PasswordForgetPageRoute()
      : super(PasswordForgetPageRoute.name, path: '/password-forget-page');

  static const String name = 'PasswordForgetPageRoute';
}

/// generated route for
/// [_i6.PasswordUpdatePage]
class PasswordUpdatePageRoute extends _i18.PageRouteInfo<void> {
  const PasswordUpdatePageRoute()
      : super(PasswordUpdatePageRoute.name, path: '/password-update-page');

  static const String name = 'PasswordUpdatePageRoute';
}

/// generated route for
/// [_i7.RegisterPage]
class RegisterPageRoute extends _i18.PageRouteInfo<void> {
  const RegisterPageRoute()
      : super(RegisterPageRoute.name, path: '/register-page');

  static const String name = 'RegisterPageRoute';
}

/// generated route for
/// [_i8.SignInPage]
class SignInPageRoute extends _i18.PageRouteInfo<void> {
  const SignInPageRoute() : super(SignInPageRoute.name, path: '/sign-in-page');

  static const String name = 'SignInPageRoute';
}

/// generated route for
/// [_i9.SplashPage]
class SplashPageRoute extends _i18.PageRouteInfo<void> {
  const SplashPageRoute() : super(SplashPageRoute.name, path: '/splash-page');

  static const String name = 'SplashPageRoute';
}

/// generated route for
/// [_i10.UserUpdatePage]
class UserUpdatePageRoute extends _i18.PageRouteInfo<void> {
  const UserUpdatePageRoute()
      : super(UserUpdatePageRoute.name, path: '/user-update-page');

  static const String name = 'UserUpdatePageRoute';
}

/// generated route for
/// [_i11.SettingsPage]
class SettingsPageRoute extends _i18.PageRouteInfo<void> {
  const SettingsPageRoute()
      : super(SettingsPageRoute.name, path: '/settings-page');

  static const String name = 'SettingsPageRoute';
}

/// generated route for
/// [_i12.NotificationsPage]
class NotificationsPageRoute extends _i18.PageRouteInfo<void> {
  const NotificationsPageRoute()
      : super(NotificationsPageRoute.name, path: '/notifications-page');

  static const String name = 'NotificationsPageRoute';
}

/// generated route for
/// [_i13.ServiceDetail]
class ServiceDetailRoute extends _i18.PageRouteInfo<void> {
  const ServiceDetailRoute()
      : super(ServiceDetailRoute.name, path: '/service-detail');

  static const String name = 'ServiceDetailRoute';
}

/// generated route for
/// [_i13.ServiceBookingPage]
class ServiceBookingPageRoute extends _i18.PageRouteInfo<void> {
  const ServiceBookingPageRoute()
      : super(ServiceBookingPageRoute.name, path: '/service-booking-page');

  static const String name = 'ServiceBookingPageRoute';
}

/// generated route for
/// [_i13.CategoriesPage]
class CategoriesPageRoute extends _i18.PageRouteInfo<void> {
  const CategoriesPageRoute()
      : super(CategoriesPageRoute.name, path: '/categories-page');

  static const String name = 'CategoriesPageRoute';
}

/// generated route for
/// [_i14.CartPage]
class CartPageRoute extends _i18.PageRouteInfo<void> {
  const CartPageRoute() : super(CartPageRoute.name, path: '/cart-page');

  static const String name = 'CartPageRoute';
}

/// generated route for
/// [_i15.OrderDetailPage]
class OrderDetailPageRoute extends _i18.PageRouteInfo<void> {
  const OrderDetailPageRoute()
      : super(OrderDetailPageRoute.name, path: '/order-detail-page');

  static const String name = 'OrderDetailPageRoute';
}

/// generated route for
/// [_i16.OrderHistoriesPage]
class OrderHistoriesPageRoute extends _i18.PageRouteInfo<void> {
  const OrderHistoriesPageRoute()
      : super(OrderHistoriesPageRoute.name, path: '/order-histories-page');

  static const String name = 'OrderHistoriesPageRoute';
}

/// generated route for
/// [_i17.ArticlesPage]
class ArticlesPageRoute extends _i18.PageRouteInfo<void> {
  const ArticlesPageRoute()
      : super(ArticlesPageRoute.name, path: '/articles-page');

  static const String name = 'ArticlesPageRoute';
}

/// generated route for
/// [_i17.ArticleDetailPage]
class ArticleDetailPageRoute extends _i18.PageRouteInfo<void> {
  const ArticleDetailPageRoute()
      : super(ArticleDetailPageRoute.name, path: '/article-detail-page');

  static const String name = 'ArticleDetailPageRoute';
}
