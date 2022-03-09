import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../module/favorite/favorite.dart';

@module
abstract class FavoriteModule {
  @Injectable()
  FavoritesCubit get favoritesCubit;

  @LazySingleton(as: IFavoriteRepository)
  FavoriteRepository get repository;

  @LazySingleton()
  FavoriteApi api(Dio dio) => FavoriteApi(dio);
}
