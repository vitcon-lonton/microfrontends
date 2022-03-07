// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:article/article.dart' as _i3;
import 'package:auth/auth.dart' as _i6;
import 'package:booking/booking.dart' as _i7;
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:service/service.dart' as _i5;

import 'module/article_module.dart' as _i8;
import 'module/auth_module.dart' as _i10;
import 'module/booking_module.dart' as _i11;
import 'module/service_module.dart'
    as _i9; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final articleModule = _$ArticleModule(get);
  final serviceModule = _$ServiceModule(get);
  final authModule = _$AuthModule(get);
  final bookingModule = _$BookingModule(get);
  gh.lazySingleton<_i3.ArticleApi>(() => articleModule.api(get<_i4.Dio>()));
  gh.factory<_i3.ArticlesCubit>(() => articleModule.articlesCubit);
  gh.lazySingleton<_i5.CatalogueApi>(() => serviceModule.api(get<_i4.Dio>()));
  gh.lazySingleton<_i6.IAuthFacade>(() => authModule.authFacade);
  gh.lazySingleton<_i7.IBookingRepository>(
      () => bookingModule.bookingRepository);
  gh.lazySingleton<_i5.IServiceRepository>(() => serviceModule.repository);
  gh.factory<_i7.OrderDetailCubit>(() => bookingModule.orderDetailCubit);
  gh.factory<_i7.OrderHistoriesCubit>(() => bookingModule.orderHistoriesCubit);
  gh.factory<_i7.OrderRatingCubit>(() => bookingModule.orderRatingCubit);
  gh.factory<_i6.PasswordForgetCubit>(() => authModule.passwordChangeCubit);
  gh.factory<_i6.RegisterCubit>(() => authModule.registerCubit);
  gh.factory<_i5.ServiceBookingFormCubit>(
      () => serviceModule.serviceBookingFormCubit);
  gh.factory<_i5.ServiceDetailCubit>(() => serviceModule.serviceDetailCubit);
  gh.factory<_i5.ServicesCubit>(() => serviceModule.servicesCubit);
  gh.factory<_i6.SignInFormBloc>(() => authModule.signInFormBloc);
  gh.factory<_i6.AuthBloc>(() => authModule.authBloc);
  gh.factory<_i7.CartCubit>(() => bookingModule.cartCubit);
  gh.factory<_i5.CategoriesCubit>(() => serviceModule.categoriesCubit);
  return get;
}

class _$ArticleModule extends _i8.ArticleModule {
  _$ArticleModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i3.ArticlesCubit get articlesCubit =>
      _i3.ArticlesCubit(_getIt<_i3.ArticleApi>());
}

class _$ServiceModule extends _i9.ServiceModule {
  _$ServiceModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i5.ServiceRepository get repository =>
      _i5.ServiceRepository(_getIt<_i5.CatalogueApi>());
  @override
  _i5.ServiceBookingFormCubit get serviceBookingFormCubit =>
      _i5.ServiceBookingFormCubit(_getIt<_i5.IServiceRepository>());
  @override
  _i5.ServiceDetailCubit get serviceDetailCubit =>
      _i5.ServiceDetailCubit(_getIt<_i5.IServiceRepository>());
  @override
  _i5.ServicesCubit get servicesCubit =>
      _i5.ServicesCubit(_getIt<_i5.IServiceRepository>());
  @override
  _i5.CategoriesCubit get categoriesCubit =>
      _i5.CategoriesCubit(_getIt<_i5.IServiceRepository>());
}

class _$AuthModule extends _i10.AuthModule {
  _$AuthModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i6.AuthFacade get authFacade => _i6.AuthFacade();
  @override
  _i6.PasswordForgetCubit get passwordChangeCubit =>
      _i6.PasswordForgetCubit(_getIt<_i6.IAuthFacade>());
  @override
  _i6.RegisterCubit get registerCubit =>
      _i6.RegisterCubit(_getIt<_i6.IAuthFacade>());
  @override
  _i6.SignInFormBloc get signInFormBloc =>
      _i6.SignInFormBloc(_getIt<_i6.IAuthFacade>());
  @override
  _i6.AuthBloc get authBloc => _i6.AuthBloc(_getIt<_i6.IAuthFacade>());
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
