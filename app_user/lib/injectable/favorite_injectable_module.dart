import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../module/favorite/favorite.dart';

@module
abstract class FavoriteInjectableModule {
  @Injectable()
  FavoriteAllCubit get all;

  @Injectable()
  FavoriteFindCubit get find;

  @Injectable()
  FavoriteCreateCubit get create;

  @Injectable()
  FavoriteDeleteCubit get delete;

  @LazySingleton(as: IFavoriteRepository)
  FavoriteRepository get repository;

  @LazySingleton()
  FavoriteApi api(Dio dio) => FavoriteApi(dio);
}
