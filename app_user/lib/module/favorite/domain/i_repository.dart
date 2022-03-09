import 'package:dartz/dartz.dart';
import 'package:app_user/core/core.dart';
import 'favorite.dart';

abstract class IFavoriteRepository {
  Future<Option<Pagination<Favorite>>> getFavorites(
      {required int page, required int perPage});
}
