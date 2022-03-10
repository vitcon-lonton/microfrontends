import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../module/favorite/favorite.dart';

@module
abstract class FavoriteModule {
  @Injectable()
  FavoriteCubit get favoriteCubit;

  @Injectable()
  FavoritesCubit get favoritesCubit;

  @LazySingleton()
  FavoriteApi api(Dio dio) => FavoriteApi(dio);

  @LazySingleton(as: IFavoriteRepository)
  FavoriteRepository get repository;
}
