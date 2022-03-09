// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:article/article.dart' as _i10;
import 'package:booking/booking.dart' as _i5;
import 'package:dio/dio.dart' as _i3;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i6;

import 'injectable/article_module.dart' as _i16;
import 'injectable/auth_module.dart' as _i15;
import 'injectable/booking_module.dart' as _i12;
import 'injectable/core_injectable_module.dart' as _i11;
import 'injectable/notification_module.dart' as _i13;
import 'injectable/service_module.dart' as _i14;
import 'module/auth/auth.dart' as _i9;
import 'module/notification/notification.dart' as _i7;
import 'module/service/service.dart'
    as _i8; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final coreInjectableModule = _$CoreInjectableModule();
  final bookingModule = _$BookingModule(get);
  final notificationModule = _$NotificationModule(get);
  final serviceModule = _$ServiceModule(get);
  final authModule = _$AuthModule(get);
  final articleModule = _$ArticleModule(get);
  gh.lazySingleton<_i3.Dio>(() => coreInjectableModule.dio);
  gh.lazySingleton<_i4.FlutterSecureStorage>(
      () => coreInjectableModule.storage);
  gh.lazySingleton<_i5.IBookingRepository>(
      () => bookingModule.bookingRepository);
  gh.lazySingleton<_i6.Logger>(() => coreInjectableModule.logger);
  gh.lazySingleton<_i7.NotificationApi>(
      () => notificationModule.api(get<_i3.Dio>()));
  gh.factory<_i5.OrderDetailCubit>(() => bookingModule.orderDetailCubit);
  gh.factory<_i5.OrderHistoriesCubit>(() => bookingModule.orderHistoriesCubit);
  gh.factory<_i5.OrderRatingCubit>(() => bookingModule.orderRatingCubit);
  gh.lazySingleton<_i8.ServiceApi>(
      () => serviceModule.serviceApi(get<_i3.Dio>()));
  gh.lazySingleton<_i9.AccountApi>(() => authModule.api(get<_i3.Dio>()));
  gh.lazySingleton<_i10.ArticleApi>(() => articleModule.api(get<_i3.Dio>()));
  gh.factory<_i10.ArticlesCubit>(() => articleModule.articlesCubit);
  gh.factory<_i9.AuthInterceptors>(() => authModule.authInterceptors);
  gh.factory<_i5.CartCubit>(() => bookingModule.cartCubit);
  gh.lazySingleton<_i8.CatalogueApi>(
      () => serviceModule.catalogueApi(get<_i3.Dio>()));
  gh.lazySingleton<_i9.IAuthFacade>(() => authModule.authFacade);
  gh.lazySingleton<_i7.INotificationRepository>(
      () => notificationModule.repository);
  gh.lazySingleton<_i8.IServiceRepository>(() => serviceModule.repository);
  gh.factory<_i7.NotificationsCubit>(
      () => notificationModule.notificationsCubit);
  gh.factory<_i9.OtpConfirmCubit>(() => authModule.otpConfirmCubit);
  gh.factory<_i9.PasswordChangeCubit>(() => authModule.passwordChangeCubit);
  gh.factory<_i9.PasswordForgetCubit>(() => authModule.passwordForgetCubit);
  gh.factory<_i9.PasswordUpdateCubit>(() => authModule.passwordUpdateCubit);
  gh.factory<_i9.RegisterCubit>(() => authModule.registerCubit);
  gh.factory<_i8.ServiceBookingFormCubit>(
      () => serviceModule.serviceBookingFormCubit);
  gh.factory<_i8.ServiceDetailCubit>(() => serviceModule.serviceDetailCubit);
  gh.factory<_i8.ServicesCubit>(() => serviceModule.servicesCubit);
  gh.factory<_i9.SignInBloc>(() => authModule.signInBloc);
  gh.factory<_i9.UserCubit>(() => authModule.userCubit);
  gh.factory<_i9.UserUpdateCubit>(() => authModule.userUpdateCubit);
  gh.factory<_i9.AuthBloc>(() => authModule.authBloc);
  gh.factory<_i8.CategoriesCubit>(() => serviceModule.categoriesCubit);
  gh.factory<_i9.FavoritesCubit>(() => authModule.favoritesCubit);
  return get;
}

class _$CoreInjectableModule extends _i11.CoreInjectableModule {}

class _$BookingModule extends _i12.BookingModule {
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

class _$NotificationModule extends _i13.NotificationModule {
  _$NotificationModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i7.NotificationRepository get repository =>
      _i7.NotificationRepository(_getIt<_i6.Logger>());
  @override
  _i7.NotificationsCubit get notificationsCubit =>
      _i7.NotificationsCubit(_getIt<_i7.INotificationRepository>());
}

class _$ServiceModule extends _i14.ServiceModule {
  _$ServiceModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i8.ServiceRepository get repository => _i8.ServiceRepository(
      _getIt<_i6.Logger>(),
      _getIt<_i8.ServiceApi>(),
      _getIt<_i8.CatalogueApi>());
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

class _$AuthModule extends _i15.AuthModule {
  _$AuthModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i9.AuthInterceptors get authInterceptors =>
      _i9.AuthInterceptors(_getIt<_i4.FlutterSecureStorage>());
  @override
  _i9.AuthFacade get authFacade => _i9.AuthFacade(
      _getIt<_i9.AccountApi>(), _getIt<_i4.FlutterSecureStorage>());
  @override
  _i9.OtpConfirmCubit get otpConfirmCubit =>
      _i9.OtpConfirmCubit(_getIt<_i9.IAuthFacade>());
  @override
  _i9.PasswordChangeCubit get passwordChangeCubit =>
      _i9.PasswordChangeCubit(_getIt<_i9.IAuthFacade>());
  @override
  _i9.PasswordForgetCubit get passwordForgetCubit =>
      _i9.PasswordForgetCubit(_getIt<_i9.IAuthFacade>());
  @override
  _i9.PasswordUpdateCubit get passwordUpdateCubit =>
      _i9.PasswordUpdateCubit(_getIt<_i9.IAuthFacade>());
  @override
  _i9.RegisterCubit get registerCubit =>
      _i9.RegisterCubit(_getIt<_i9.IAuthFacade>());
  @override
  _i9.SignInBloc get signInBloc => _i9.SignInBloc(_getIt<_i9.IAuthFacade>());
  @override
  _i9.UserCubit get userCubit => _i9.UserCubit(_getIt<_i9.IAuthFacade>());
  @override
  _i9.UserUpdateCubit get userUpdateCubit =>
      _i9.UserUpdateCubit(_getIt<_i9.IAuthFacade>());
  @override
  _i9.AuthBloc get authBloc => _i9.AuthBloc(_getIt<_i9.IAuthFacade>());
  @override
  _i9.FavoritesCubit get favoritesCubit =>
      _i9.FavoritesCubit(_getIt<_i9.IAuthFacade>());
}

class _$ArticleModule extends _i16.ArticleModule {
  _$ArticleModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i10.ArticlesCubit get articlesCubit =>
      _i10.ArticlesCubit(_getIt<_i10.ArticleApi>());
}
