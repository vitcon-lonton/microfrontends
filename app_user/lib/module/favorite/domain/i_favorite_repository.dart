import 'package:dartz/dartz.dart';
import 'package:app_user/core/core.dart';
import 'failure.dart';
import 'favorite.dart';

abstract class IFavoriteRepository {
  Future<Option<Pagination<Favorite>>> all(
      {required int page, required int perPage});
  Future<Either<FavoriteFailure, Unit>> create(UniqueId id);
  Future<Either<FavoriteFailure, Unit>> delete(UniqueId id);
}
