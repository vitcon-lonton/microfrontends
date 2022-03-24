import 'package:dartz/dartz.dart';
import 'package:app_user/core/core.dart';
import 'favorite_failure.dart';
import 'favorite.dart';

abstract class IFavoriteRepository {
  Future<Option<Favorite>> find(int serviceId);
  Future<Either<FavoriteFailure, Unit>> create(int serviceId);
  Future<Either<FavoriteFailure, Unit>> delete(int serviceId);
  Future<Option<Pagination<Favorite>>> all({int? page, int? perPage});
}
