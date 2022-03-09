// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:article/article.dart' as _i11;
import 'package:dio/dio.dart' as _i3;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i7;

import 'injectable/article_module.dart' as _i18;
import 'injectable/auth_module.dart' as _i17;
import 'injectable/booking_module.dart' as _i14;
import 'injectable/core_injectable_module.dart' as _i12;
import 'injectable/favorite_module.dart' as _i13;
import 'injectable/notification_module.dart' as _i15;
import 'injectable/service_module.dart' as _i16;
import 'module/auth/auth.dart' as _i10;
import 'module/booking/booking.dart' as _i6;
import 'module/favorite/favorite.dart' as _i4;
import 'module/notification/notification.dart' as _i8;
import 'module/service/service.dart'
    as _i9; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final coreInjectableModule = _$CoreInjectableModule();
  final favoriteModule = _$FavoriteModule(get);
  final bookingModule = _$BookingModule(get);
  final notificationModule = _$NotificationModule(get);
  final serviceModule = _$ServiceModule(get);
  final authModule = _$AuthModule(get);
  final articleModule = _$ArticleModule(get);
  gh.lazySingleton<_i3.Dio>(() => coreInjectableModule.dio);
  gh.lazySingleton<_i4.FavoriteApi>(() => favoriteModule.api(get<_i3.Dio>()));
  gh.lazySingleton<_i5.FlutterSecureStorage>(
      () => coreInjectableModule.storage);
  gh.lazySingleton<_i6.IBookingRepository>(
      () => bookingModule.bookingRepository);
  gh.lazySingleton<_i4.IFavoriteRepository>(() => favoriteModule.repository);
  gh.lazySingleton<_i7.Logger>(() => coreInjectableModule.logger);
  gh.lazySingleton<_i8.NotificationApi>(
      () => notificationModule.api(get<_i3.Dio>()));
  gh.factory<_i6.OrderDetailCubit>(() => bookingModule.orderDetailCubit);
  gh.factory<_i6.OrderHistoriesCubit>(() => bookingModule.orderHistoriesCubit);
  gh.factory<_i6.OrderRatingCubit>(() => bookingModule.orderRatingCubit);
  gh.lazySingleton<_i9.ServiceApi>(
      () => serviceModule.serviceApi(get<_i3.Dio>()));
  gh.lazySingleton<_i10.AccountApi>(() => authModule.api(get<_i3.Dio>()));
  gh.lazySingleton<_i11.ArticleApi>(() => articleModule.api(get<_i3.Dio>()));
  gh.factory<_i11.ArticlesCubit>(() => articleModule.articlesCubit);
  gh.factory<_i10.AuthInterceptors>(() => authModule.authInterceptors);
  gh.factory<_i6.CartCubit>(() => bookingModule.cartCubit);
  gh.lazySingleton<_i9.CatalogueApi>(
      () => serviceModule.catalogueApi(get<_i3.Dio>()));
  gh.factory<_i4.FavoritesCubit>(() => favoriteModule.favoritesCubit);
  gh.lazySingleton<_i10.IAuthFacade>(() => authModule.authFacade);
  gh.lazySingleton<_i8.INotificationRepository>(
      () => notificationModule.repository);
  gh.lazySingleton<_i9.IServiceRepository>(() => serviceModule.repository);
  gh.factory<_i8.NotificationsCubit>(
      () => notificationModule.notificationsCubit);
  gh.factory<_i10.OtpConfirmCubit>(() => authModule.otpConfirmCubit);
  gh.factory<_i10.PasswordChangeCubit>(() => authModule.passwordChangeCubit);
  gh.factory<_i10.PasswordForgetCubit>(() => authModule.passwordForgetCubit);
  gh.factory<_i10.PasswordUpdateCubit>(() => authModule.passwordUpdateCubit);
  gh.factory<_i10.RegisterCubit>(() => authModule.registerCubit);
  gh.factory<_i9.ServiceBookingFormCubit>(
      () => serviceModule.serviceBookingFormCubit);
  gh.factory<_i9.ServiceDetailCubit>(() => serviceModule.serviceDetailCubit);
  gh.factory<_i9.ServicesCubit>(() => serviceModule.servicesCubit);
  gh.factory<_i10.SignInBloc>(() => authModule.signInBloc);
  gh.factory<_i10.UserCubit>(() => authModule.userCubit);
  gh.factory<_i10.UserUpdateCubit>(() => authModule.userUpdateCubit);
  gh.factory<_i10.AuthBloc>(() => authModule.authBloc);
  gh.factory<_i9.CategoriesCubit>(() => serviceModule.categoriesCubit);
  return get;
}

class _$CoreInjectableModule extends _i12.CoreInjectableModule {}

class _$FavoriteModule extends _i13.FavoriteModule {
  _$FavoriteModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i4.FavoriteRepository get repository => _i4.FavoriteRepository();
  @override
  _i4.FavoritesCubit get favoritesCubit =>
      _i4.FavoritesCubit(_getIt<_i4.IFavoriteRepository>());
}

class _$BookingModule extends _i14.BookingModule {
  _$BookingModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i6.BookingRepository get bookingRepository => _i6.BookingRepository();
  @override
  _i6.OrderDetailCubit get orderDetailCubit =>
      _i6.OrderDetailCubit(_getIt<_i6.IBookingRepository>());
  @override
  _i6.OrderHistoriesCubit get orderHistoriesCubit =>
      _i6.OrderHistoriesCubit(_getIt<_i6.IBookingRepository>());
  @override
  _i6.OrderRatingCubit get orderRatingCubit =>
      _i6.OrderRatingCubit(_getIt<_i6.IBookingRepository>());
  @override
  _i6.CartCubit get cartCubit =>
      _i6.CartCubit(_getIt<_i6.IBookingRepository>());
}

class _$NotificationModule extends _i15.NotificationModule {
  _$NotificationModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i8.NotificationRepository get repository =>
      _i8.NotificationRepository(_getIt<_i7.Logger>());
  @override
  _i8.NotificationsCubit get notificationsCubit =>
      _i8.NotificationsCubit(_getIt<_i8.INotificationRepository>());
}

class _$ServiceModule extends _i16.ServiceModule {
  _$ServiceModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i9.ServiceRepository get repository => _i9.ServiceRepository(
      _getIt<_i7.Logger>(),
      _getIt<_i9.ServiceApi>(),
      _getIt<_i9.CatalogueApi>());
  @override
  _i9.ServiceBookingFormCubit get serviceBookingFormCubit =>
      _i9.ServiceBookingFormCubit(_getIt<_i9.IServiceRepository>());
  @override
  _i9.ServiceDetailCubit get serviceDetailCubit =>
      _i9.ServiceDetailCubit(_getIt<_i9.IServiceRepository>());
  @override
  _i9.ServicesCubit get servicesCubit =>
      _i9.ServicesCubit(_getIt<_i9.IServiceRepository>());
  @override
  _i9.CategoriesCubit get categoriesCubit =>
      _i9.CategoriesCubit(_getIt<_i9.IServiceRepository>());
}

class _$AuthModule extends _i17.AuthModule {
  _$AuthModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i10.AuthInterceptors get authInterceptors =>
      _i10.AuthInterceptors(_getIt<_i5.FlutterSecureStorage>());
  @override
  _i10.AuthFacade get authFacade => _i10.AuthFacade(
      _getIt<_i10.AccountApi>(), _getIt<_i5.FlutterSecureStorage>());
  @override
  _i10.OtpConfirmCubit get otpConfirmCubit =>
      _i10.OtpConfirmCubit(_getIt<_i10.IAuthFacade>());
  @override
  _i10.PasswordChangeCubit get passwordChangeCubit =>
      _i10.PasswordChangeCubit(_getIt<_i10.IAuthFacade>());
  @override
  _i10.PasswordForgetCubit get passwordForgetCubit =>
      _i10.PasswordForgetCubit(_getIt<_i10.IAuthFacade>());
  @override
  _i10.PasswordUpdateCubit get passwordUpdateCubit =>
      _i10.PasswordUpdateCubit(_getIt<_i10.IAuthFacade>());
  @override
  _i10.RegisterCubit get registerCubit =>
      _i10.RegisterCubit(_getIt<_i10.IAuthFacade>());
  @override
  _i10.SignInBloc get signInBloc => _i10.SignInBloc(_getIt<_i10.IAuthFacade>());
  @override
  _i10.UserCubit get userCubit => _i10.UserCubit(_getIt<_i10.IAuthFacade>());
  @override
  _i10.UserUpdateCubit get userUpdateCubit =>
      _i10.UserUpdateCubit(_getIt<_i10.IAuthFacade>());
  @override
  _i10.AuthBloc get authBloc => _i10.AuthBloc(_getIt<_i10.IAuthFacade>());
}

class _$ArticleModule extends _i18.ArticleModule {
  _$ArticleModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i11.ArticlesCubit get articlesCubit =>
      _i11.ArticlesCubit(_getIt<_i11.ArticleApi>());
}
