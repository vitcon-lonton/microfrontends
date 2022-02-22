// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:article/article.dart' as _i3;
import 'package:auth/auth.dart' as _i5;
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'article_module.dart' as _i6;
import 'auth_module.dart' as _i7; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final articleModule = _$ArticleModule(get);
  final authModule = _$AuthModule(get);
  gh.lazySingleton<_i3.ArticleApi>(() => articleModule.api(get<_i4.Dio>()));
  gh.factory<_i3.ArticlesCubit>(() => articleModule.articlesCubit);
  gh.lazySingleton<_i5.IAuthFacade>(() => authModule.authFacade);
  gh.factory<_i5.RegisterCubit>(() => authModule.registerCubit);
  gh.factory<_i5.SignInFormBloc>(() => authModule.signInFormBloc);
  gh.factory<_i5.AuthBloc>(() => authModule.authBloc);
  gh.factory<_i5.ForgetPasswordCubit>(() => authModule.forgetPasswordCubit);
  return get;
}

class _$ArticleModule extends _i6.ArticleModule {
  _$ArticleModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i3.ArticlesCubit get articlesCubit =>
      _i3.ArticlesCubit(_getIt<_i3.ArticleApi>());
}

class _$AuthModule extends _i7.AuthModule {
  _$AuthModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i5.FirebaseAuthFacade get authFacade => _i5.FirebaseAuthFacade();
  @override
  _i5.RegisterCubit get registerCubit =>
      _i5.RegisterCubit(_getIt<_i5.IAuthFacade>());
  @override
  _i5.SignInFormBloc get signInFormBloc =>
      _i5.SignInFormBloc(_getIt<_i5.IAuthFacade>());
  @override
  _i5.AuthBloc get authBloc => _i5.AuthBloc(_getIt<_i5.IAuthFacade>());
  @override
  _i5.ForgetPasswordCubit get forgetPasswordCubit =>
      _i5.ForgetPasswordCubit(_getIt<_i5.IAuthFacade>());
}
