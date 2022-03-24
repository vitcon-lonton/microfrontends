import 'package:dartz/dartz.dart';
import 'package:kt_dart/collection.dart';
import 'package:logger/logger.dart';
import 'package:app_user/core/core.dart';
import '../domain/favorite.dart';
import '../domain/favorite_failure.dart';
import '../domain/i_favorite_repository.dart';
import 'api/favorite_api.dart';

class FavoriteRepository implements IFavoriteRepository {
  final Logger _logger;
  final FavoriteApi _favoriteApi;

  FavoriteRepository(this._logger, this._favoriteApi);

  @override
  Future<Option<Pagination<Favorite>>> all({int? page, int? perPage}) async {
    try {
      final response = await _favoriteApi.all();
      final totalPages = response.data!.meta.totalPages;
      final currentPage = response.data!.meta.currentPage;
      final favorites = KtList.from(response.data!.favorites);

      return optionOf(Pagination<Favorite>(
          data: favorites,
          page: currentPage,
          pageCount: totalPages,
          totalCount: favorites.size,
          perPage: perPage ?? favorites.size));
    } catch (e) {
      _logger.e(e);
    }

    return none();
  }

  @override
  Future<Either<FavoriteFailure, Unit>> create(int serviceId) async {
    try {
      await _favoriteApi.create(serviceId);
      return right(unit);
    } catch (e) {
      _logger.e(e);
    }

    return left(const FavoriteFailure.unableCreate());
  }

  @override
  Future<Either<FavoriteFailure, Unit>> delete(int serviceId) async {
    try {
      await _favoriteApi.delete(serviceId);
      return right(unit);
    } catch (e) {
      _logger.e(e);
    }

    return left(const FavoriteFailure.unableDelete());
  }

  @override
  Future<Option<Favorite>> find(int serviceId) async {
    try {
      final response = await _favoriteApi.check(serviceId);
      return optionOf(response.data);
    } catch (e) {
      _logger.e(e);
    }

    return none();
  }
}
