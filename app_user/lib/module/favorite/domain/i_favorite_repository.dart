import 'package:dartz/dartz.dart';
import 'package:app_user/core/core.dart';
import 'favorite_failure.dart';
import 'favorite.dart';

abstract class IFavoriteRepository {
  Future<Option<Pagination<Favorite>>> all(
      {required int page, required int perPage});
  Future<Either<FavoriteFailure, Unit>> create(int serviceId);
  Future<Either<FavoriteFailure, Unit>> delete(int serviceId);
  Future<Option<Favorite>> findByServiceId(int serviceId);
}
