import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../module/favorite/favorite.dart';

@module
abstract class FavoriteInjectableModule {
  @Injectable()
  FavoriteAllCubit get all;

  @Injectable()
  FavoriteCreateCubit get create;

  @Injectable()
  FavoriteDeleteCubit get delete;

  @Injectable()
  FavoriteAlreadyExistCubit get alreadyExist;

  @LazySingleton()
  FavoriteApi api(Dio dio) => FavoriteApi(dio);

  @LazySingleton(as: IFavoriteRepository)
  FavoriteRepository get repository;
}
