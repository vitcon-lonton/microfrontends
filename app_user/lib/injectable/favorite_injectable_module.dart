import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../module/favorite/favorite.dart';

@module
abstract class FavoriteInjectableModule {
  @Injectable()
  FavoriteCubit get favorite;

  @Injectable()
  FavoritesCubit get favorites;

  @LazySingleton(as: IFavoriteRepository)
  FavoriteRepository get repository;

  @LazySingleton()
  FavoriteApi api(Dio dio) => FavoriteApi(dio);
}
