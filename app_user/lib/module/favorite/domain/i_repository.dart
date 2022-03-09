import 'package:dartz/dartz.dart';
import 'package:engine/engine.dart';
import 'favorite.dart';

abstract class IFavoriteRepository {
  Future<Option<Pagination<Favorite>>> getFavorites(
      {required int page, required int perPage});
}
