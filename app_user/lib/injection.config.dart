// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:article/article.dart' as _i5;
import 'package:booking/booking.dart' as _i7;
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:service/service.dart' as _i6;

import 'auth/auth.dart' as _i3;
import 'module/article_module.dart' as _i9;
import 'module/auth_module.dart' as _i8;
import 'module/booking_module.dart' as _i11;
import 'module/notification_module.dart' as _i12;
import 'module/service_module.dart'
    as _i10; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final authModule = _$AuthModule(get);
  final articleModule = _$ArticleModule(get);
  final serviceModule = _$ServiceModule(get);
  final bookingModule = _$BookingModule(get);
  final notificationModule = _$NotificationModule(get);
  gh.lazySingleton<_i3.AccountApi>(() => authModule.api(get<_i4.Dio>()));
  gh.lazySingleton<_i5.ArticleApi>(() => articleModule.api(get<_i4.Dio>()));
  gh.factory<_i5.ArticlesCubit>(() => articleModule.articlesCubit);
  gh.lazySingleton<_i6.CatalogueApi>(() => serviceModule.api(get<_i4.Dio>()));
  gh.lazySingleton<_i3.IAuthFacade>(() => authModule.authFacade);
  gh.lazySingleton<_i7.IBookingRepository>(
      () => bookingModule.bookingRepository);
  gh.lazySingleton<_i6.IServiceRepository>(() => serviceModule.repository);
  gh.factory<_i3.NotificationsCubit>(
      () => notificationModule.notificationsCubit);
  gh.factory<_i7.OrderDetailCubit>(() => bookingModule.orderDetailCubit);
  gh.factory<_i7.OrderHistoriesCubit>(() => bookingModule.orderHistoriesCubit);
  gh.factory<_i7.OrderRatingCubit>(() => bookingModule.orderRatingCubit);
  gh.factory<_i3.OtpConfirmCubit>(() => authModule.otpConfirmCubit);
  gh.factory<_i3.PasswordChangeCubit>(() => authModule.passwordChangeCubit);
  gh.factory<_i3.PasswordForgetCubit>(() => authModule.passwordForgetCubit);
  gh.factory<_i3.PasswordUpdateCubit>(() => authModule.passwordUpdateCubit);
  gh.factory<_i3.RegisterCubit>(() => authModule.registerCubit);
  gh.factory<_i6.ServiceBookingFormCubit>(
      () => serviceModule.serviceBookingFormCubit);
  gh.factory<_i6.ServiceDetailCubit>(() => serviceModule.serviceDetailCubit);
  gh.factory<_i6.ServicesCubit>(() => serviceModule.servicesCubit);
  gh.factory<_i3.SignInFormBloc>(() => authModule.signInFormBloc);
  gh.factory<_i3.UserUpdateCubit>(() => authModule.userUpdateCubit);
  gh.factory<_i3.AuthBloc>(() => authModule.authBloc);
  gh.factory<_i7.CartCubit>(() => bookingModule.cartCubit);
  gh.factory<_i6.CategoriesCubit>(() => serviceModule.categoriesCubit);
  gh.factory<_i3.FavoritesCubit>(() => authModule.favoritesCubit);
  return get;
}

class _$AuthModule extends _i8.AuthModule {
  _$AuthModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i3.AuthFacade get authFacade => _i3.AuthFacade(_getIt<_i3.AccountApi>());
  @override
  _i3.OtpConfirmCubit get otpConfirmCubit =>
      _i3.OtpConfirmCubit(_getIt<_i3.IAuthFacade>());
  @override
  _i3.PasswordChangeCubit get passwordChangeCubit =>
      _i3.PasswordChangeCubit(_getIt<_i3.IAuthFacade>());
  @override
  _i3.PasswordForgetCubit get passwordForgetCubit =>
      _i3.PasswordForgetCubit(_getIt<_i3.IAuthFacade>());
  @override
  _i3.PasswordUpdateCubit get passwordUpdateCubit =>
      _i3.PasswordUpdateCubit(_getIt<_i3.IAuthFacade>());
  @override
  _i3.RegisterCubit get registerCubit =>
      _i3.RegisterCubit(_getIt<_i3.IAuthFacade>());
  @override
  _i3.SignInFormBloc get signInFormBloc =>
      _i3.SignInFormBloc(_getIt<_i3.IAuthFacade>());
  @override
  _i3.UserUpdateCubit get userUpdateCubit =>
      _i3.UserUpdateCubit(_getIt<_i3.IAuthFacade>());
  @override
  _i3.AuthBloc get authBloc => _i3.AuthBloc(_getIt<_i3.IAuthFacade>());
  @override
  _i3.FavoritesCubit get favoritesCubit =>
      _i3.FavoritesCubit(_getIt<_i3.IAuthFacade>());
}

class _$ArticleModule extends _i9.ArticleModule {
  _$ArticleModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i5.ArticlesCubit get articlesCubit =>
      _i5.ArticlesCubit(_getIt<_i5.ArticleApi>());
}

class _$ServiceModule extends _i10.ServiceModule {
  _$ServiceModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i6.ServiceRepository get repository =>
      _i6.ServiceRepository(_getIt<_i6.CatalogueApi>());
  @override
  _i6.ServiceBookingFormCubit get serviceBookingFormCubit =>
      _i6.ServiceBookingFormCubit(_getIt<_i6.IServiceRepository>());
  @override
  _i6.ServiceDetailCubit get serviceDetailCubit =>
      _i6.ServiceDetailCubit(_getIt<_i6.IServiceRepository>());
  @override
  _i6.ServicesCubit get servicesCubit =>
      _i6.ServicesCubit(_getIt<_i6.IServiceRepository>());
  @override
  _i6.CategoriesCubit get categoriesCubit =>
      _i6.CategoriesCubit(_getIt<_i6.IServiceRepository>());
}

class _$BookingModule extends _i11.BookingModule {
  _$BookingModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i7.BookingRepository get bookingRepository => _i7.BookingRepository();
  @override
  _i7.OrderDetailCubit get orderDetailCubit =>
      _i7.OrderDetailCubit(_getIt<_i7.IBookingRepository>());
  @override
  _i7.OrderHistoriesCubit get orderHistoriesCubit =>
      _i7.OrderHistoriesCubit(_getIt<_i7.IBookingRepository>());
  @override
  _i7.OrderRatingCubit get orderRatingCubit =>
      _i7.OrderRatingCubit(_getIt<_i7.IBookingRepository>());
  @override
  _i7.CartCubit get cartCubit =>
      _i7.CartCubit(_getIt<_i7.IBookingRepository>());
}

class _$NotificationModule extends _i12.NotificationModule {
  _$NotificationModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i3.NotificationsCubit get notificationsCubit =>
      _i3.NotificationsCubit(_getIt<_i3.IAuthFacade>());
}
