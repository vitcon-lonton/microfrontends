// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i13;
import 'package:flutter/material.dart' as _i14;

import '../favorites/favorites.dart' as _i1;
import '../home/home.dart' as _i2;
import '../notifications/notifications.dart' as _i3;
import '../otp_confirm/otp_confirm.dart' as _i4;
import '../password_change/password_change.dart' as _i5;
import '../password_forget/password_forget.dart' as _i6;
import '../password_update/password_update.dart' as _i7;
import '../register/register.dart' as _i8;
import '../settings/settings_page.dart' as _i9;
import '../sign_in/sign_in_page.dart' as _i10;
import '../splash/splash_page.dart' as _i11;
import '../user_update/user_update.dart' as _i12;

class Router extends _i13.RootStackRouter {
  Router([_i14.GlobalKey<_i14.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i13.PageFactory> pagesMap = {
    FavoritesPageRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.FavoritesPage());
    },
    HomePageRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.HomePage());
    },
    NotificationsPageRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.NotificationsPage());
    },
    OtpConfirmPageRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.OtpConfirmPage());
    },
    PasswordChangePageRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.PasswordChangePage());
    },
    PasswordForgetPageRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.PasswordForgetPage());
    },
    PasswordUpdatePageRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.PasswordUpdatePage());
    },
    RegisterPageRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.RegisterPage());
    },
    SettingsPageRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.SettingsPage());
    },
    SignInPageRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i10.SignInPage());
    },
    SplashPageRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.SplashPage());
    },
    UserUpdatePageRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i12.UserUpdatePage());
    }
  };

  @override
  List<_i13.RouteConfig> get routes => [
        _i13.RouteConfig(FavoritesPageRoute.name, path: '/favorites-page'),
        _i13.RouteConfig(HomePageRoute.name, path: '/home-page'),
        _i13.RouteConfig(NotificationsPageRoute.name,
            path: '/notifications-page'),
        _i13.RouteConfig(OtpConfirmPageRoute.name, path: '/otp-confirm-page'),
        _i13.RouteConfig(PasswordChangePageRoute.name,
            path: '/password-change-page'),
        _i13.RouteConfig(PasswordForgetPageRoute.name,
            path: '/password-forget-page'),
        _i13.RouteConfig(PasswordUpdatePageRoute.name,
            path: '/password-update-page'),
        _i13.RouteConfig(RegisterPageRoute.name, path: '/register-page'),
        _i13.RouteConfig(SettingsPageRoute.name, path: '/settings-page'),
        _i13.RouteConfig(SignInPageRoute.name, path: '/sign-in-page'),
        _i13.RouteConfig(SplashPageRoute.name, path: '/'),
        _i13.RouteConfig(UserUpdatePageRoute.name, path: '/user-update-page')
      ];
}

/// generated route for
/// [_i1.FavoritesPage]
class FavoritesPageRoute extends _i13.PageRouteInfo<void> {
  const FavoritesPageRoute()
      : super(FavoritesPageRoute.name, path: '/favorites-page');

  static const String name = 'FavoritesPageRoute';
}

/// generated route for
/// [_i2.HomePage]
class HomePageRoute extends _i13.PageRouteInfo<void> {
  const HomePageRoute() : super(HomePageRoute.name, path: '/home-page');

  static const String name = 'HomePageRoute';
}

/// generated route for
/// [_i3.NotificationsPage]
class NotificationsPageRoute extends _i13.PageRouteInfo<void> {
  const NotificationsPageRoute()
      : super(NotificationsPageRoute.name, path: '/notifications-page');

  static const String name = 'NotificationsPageRoute';
}

/// generated route for
/// [_i4.OtpConfirmPage]
class OtpConfirmPageRoute extends _i13.PageRouteInfo<void> {
  const OtpConfirmPageRoute()
      : super(OtpConfirmPageRoute.name, path: '/otp-confirm-page');

  static const String name = 'OtpConfirmPageRoute';
}

/// generated route for
/// [_i5.PasswordChangePage]
class PasswordChangePageRoute extends _i13.PageRouteInfo<void> {
  const PasswordChangePageRoute()
      : super(PasswordChangePageRoute.name, path: '/password-change-page');

  static const String name = 'PasswordChangePageRoute';
}

/// generated route for
/// [_i6.PasswordForgetPage]
class PasswordForgetPageRoute extends _i13.PageRouteInfo<void> {
  const PasswordForgetPageRoute()
      : super(PasswordForgetPageRoute.name, path: '/password-forget-page');

  static const String name = 'PasswordForgetPageRoute';
}

/// generated route for
/// [_i7.PasswordUpdatePage]
class PasswordUpdatePageRoute extends _i13.PageRouteInfo<void> {
  const PasswordUpdatePageRoute()
      : super(PasswordUpdatePageRoute.name, path: '/password-update-page');

  static const String name = 'PasswordUpdatePageRoute';
}

/// generated route for
/// [_i8.RegisterPage]
class RegisterPageRoute extends _i13.PageRouteInfo<void> {
  const RegisterPageRoute()
      : super(RegisterPageRoute.name, path: '/register-page');

  static const String name = 'RegisterPageRoute';
}

/// generated route for
/// [_i9.SettingsPage]
class SettingsPageRoute extends _i13.PageRouteInfo<void> {
  const SettingsPageRoute()
      : super(SettingsPageRoute.name, path: '/settings-page');

  static const String name = 'SettingsPageRoute';
}

/// generated route for
/// [_i10.SignInPage]
class SignInPageRoute extends _i13.PageRouteInfo<void> {
  const SignInPageRoute() : super(SignInPageRoute.name, path: '/sign-in-page');

  static const String name = 'SignInPageRoute';
}

/// generated route for
/// [_i11.SplashPage]
class SplashPageRoute extends _i13.PageRouteInfo<void> {
  const SplashPageRoute() : super(SplashPageRoute.name, path: '/');

  static const String name = 'SplashPageRoute';
}

/// generated route for
/// [_i12.UserUpdatePage]
class UserUpdatePageRoute extends _i13.PageRouteInfo<void> {
  const UserUpdatePageRoute()
      : super(UserUpdatePageRoute.name, path: '/user-update-page');

  static const String name = 'UserUpdatePageRoute';
}
