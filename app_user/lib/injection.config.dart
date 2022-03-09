// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:article/article.dart' as _i7;
import 'package:booking/booking.dart' as _i5;
import 'package:dio/dio.dart' as _i3;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:service/service.dart' as _i8;

import 'auth/auth.dart' as _i6;
import 'module/article_module.dart' as _i12;
import 'module/auth_module.dart' as _i11;
import 'module/booking_module.dart' as _i10;
import 'module/core_injectable_module.dart' as _i9;
import 'module/notification_module.dart' as _i14;
import 'module/service_module.dart'
    as _i13; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final coreInjectableModule = _$CoreInjectableModule();
  final bookingModule = _$BookingModule(get);
  final authModule = _$AuthModule(get);
  final articleModule = _$ArticleModule(get);
  final serviceModule = _$ServiceModule(get);
  final notificationModule = _$NotificationModule(get);
  gh.lazySingleton<_i3.Dio>(() => coreInjectableModule.dio);
  gh.lazySingleton<_i4.FlutterSecureStorage>(
      () => coreInjectableModule.storage);
  gh.lazySingleton<_i5.IBookingRepository>(
      () => bookingModule.bookingRepository);
  gh.factory<_i5.OrderDetailCubit>(() => bookingModule.orderDetailCubit);
  gh.factory<_i5.OrderHistoriesCubit>(() => bookingModule.orderHistoriesCubit);
  gh.factory<_i5.OrderRatingCubit>(() => bookingModule.orderRatingCubit);
  gh.lazySingleton<_i6.AccountApi>(() => authModule.api(get<_i3.Dio>()));
  gh.lazySingleton<_i7.ArticleApi>(() => articleModule.api(get<_i3.Dio>()));
  gh.factory<_i7.ArticlesCubit>(() => articleModule.articlesCubit);
  gh.factory<_i6.AuthInterceptors>(() => authModule.authInterceptors);
  gh.factory<_i5.CartCubit>(() => bookingModule.cartCubit);
  gh.lazySingleton<_i8.CatalogueApi>(() => serviceModule.api(get<_i3.Dio>()));
  gh.lazySingleton<_i6.IAuthFacade>(() => authModule.authFacade);
  gh.lazySingleton<_i8.IServiceRepository>(() => serviceModule.repository);
  gh.factory<_i6.NotificationsCubit>(
      () => notificationModule.notificationsCubit);
  gh.factory<_i6.OtpConfirmCubit>(() => authModule.otpConfirmCubit);
  gh.factory<_i6.PasswordChangeCubit>(() => authModule.passwordChangeCubit);
  gh.factory<_i6.PasswordForgetCubit>(() => authModule.passwordForgetCubit);
  gh.factory<_i6.PasswordUpdateCubit>(() => authModule.passwordUpdateCubit);
  gh.factory<_i6.RegisterCubit>(() => authModule.registerCubit);
  gh.factory<_i8.ServiceBookingFormCubit>(
      () => serviceModule.serviceBookingFormCubit);
  gh.factory<_i8.ServiceDetailCubit>(() => serviceModule.serviceDetailCubit);
  gh.factory<_i8.ServicesCubit>(() => serviceModule.servicesCubit);
  gh.factory<_i6.SignInFormBloc>(() => authModule.signInFormBloc);
  gh.factory<_i6.UserCubit>(() => authModule.userCubit);
  gh.factory<_i6.UserUpdateCubit>(() => authModule.userUpdateCubit);
  gh.factory<_i6.AuthBloc>(() => authModule.authBloc);
  gh.factory<_i8.CategoriesCubit>(() => serviceModule.categoriesCubit);
  gh.factory<_i6.FavoritesCubit>(() => authModule.favoritesCubit);
  return get;
}

class _$CoreInjectableModule extends _i9.CoreInjectableModule {}

class _$BookingModule extends _i10.BookingModule {
  _$BookingModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i5.BookingRepository get bookingRepository => _i5.BookingRepository();
  @override
  _i5.OrderDetailCubit get orderDetailCubit =>
      _i5.OrderDetailCubit(_getIt<_i5.IBookingRepository>());
  @override
  _i5.OrderHistoriesCubit get orderHistoriesCubit =>
      _i5.OrderHistoriesCubit(_getIt<_i5.IBookingRepository>());
  @override
  _i5.OrderRatingCubit get orderRatingCubit =>
      _i5.OrderRatingCubit(_getIt<_i5.IBookingRepository>());
  @override
  _i5.CartCubit get cartCubit =>
      _i5.CartCubit(_getIt<_i5.IBookingRepository>());
}

class _$AuthModule extends _i11.AuthModule {
  _$AuthModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i6.AuthInterceptors get authInterceptors =>
      _i6.AuthInterceptors(_getIt<_i4.FlutterSecureStorage>());
  @override
  _i6.AuthFacade get authFacade => _i6.AuthFacade(
      _getIt<_i6.AccountApi>(), _getIt<_i4.FlutterSecureStorage>());
  @override
  _i6.OtpConfirmCubit get otpConfirmCubit =>
      _i6.OtpConfirmCubit(_getIt<_i6.IAuthFacade>());
  @override
  _i6.PasswordChangeCubit get passwordChangeCubit =>
      _i6.PasswordChangeCubit(_getIt<_i6.IAuthFacade>());
  @override
  _i6.PasswordForgetCubit get passwordForgetCubit =>
      _i6.PasswordForgetCubit(_getIt<_i6.IAuthFacade>());
  @override
  _i6.PasswordUpdateCubit get passwordUpdateCubit =>
      _i6.PasswordUpdateCubit(_getIt<_i6.IAuthFacade>());
  @override
  _i6.RegisterCubit get registerCubit =>
      _i6.RegisterCubit(_getIt<_i6.IAuthFacade>());
  @override
  _i6.SignInFormBloc get signInFormBloc =>
      _i6.SignInFormBloc(_getIt<_i6.IAuthFacade>());
  @override
  _i6.UserCubit get userCubit => _i6.UserCubit(_getIt<_i6.IAuthFacade>());
  @override
  _i6.UserUpdateCubit get userUpdateCubit =>
      _i6.UserUpdateCubit(_getIt<_i6.IAuthFacade>());
  @override
  _i6.AuthBloc get authBloc => _i6.AuthBloc(_getIt<_i6.IAuthFacade>());
  @override
  _i6.FavoritesCubit get favoritesCubit =>
      _i6.FavoritesCubit(_getIt<_i6.IAuthFacade>());
}

class _$ArticleModule extends _i12.ArticleModule {
  _$ArticleModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i7.ArticlesCubit get articlesCubit =>
      _i7.ArticlesCubit(_getIt<_i7.ArticleApi>());
}

class _$ServiceModule extends _i13.ServiceModule {
  _$ServiceModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i8.ServiceRepository get repository =>
      _i8.ServiceRepository(_getIt<_i8.CatalogueApi>());
  @override
  _i8.ServiceBookingFormCubit get serviceBookingFormCubit =>
      _i8.ServiceBookingFormCubit(_getIt<_i8.IServiceRepository>());
  @override
  _i8.ServiceDetailCubit get serviceDetailCubit =>
      _i8.ServiceDetailCubit(_getIt<_i8.IServiceRepository>());
  @override
  _i8.ServicesCubit get servicesCubit =>
      _i8.ServicesCubit(_getIt<_i8.IServiceRepository>());
  @override
  _i8.CategoriesCubit get categoriesCubit =>
      _i8.CategoriesCubit(_getIt<_i8.IServiceRepository>());
}

class _$NotificationModule extends _i14.NotificationModule {
  _$NotificationModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i6.NotificationsCubit get notificationsCubit =>
      _i6.NotificationsCubit(_getIt<_i6.IAuthFacade>());
}
