import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';
import 'package:app_user/core/core.dart';
import '../domain/failure.dart';
import '../domain/favorite.dart';
import '../domain/i_favorite_repository.dart';
import 'api/favorite_api.dart';

class FavoriteRepository implements IFavoriteRepository {
  final Logger _logger;
  final FavoriteApi _favoriteApi;

  FavoriteRepository(this._logger, this._favoriteApi);

  @override
  Future<Option<Pagination<Favorite>>> all(
      {required int page, required int perPage}) async {
    try {
      // final response = await _favoriteApi.all(page: page, limit: 1000);
      final response = await _favoriteApi.all();
      final responseData = response.data!;

      final result = Pagination<Favorite>(
          page: 1,
          pageCount: 1,
          data: responseData,
          perPage: responseData.length,
          totalCount: responseData.length);

      return optionOf(result);
    } catch (e) {
      _logger.e(e);
      return none();
    }

    // return none();
  }

  @override
  Future<Either<FavoriteFailure, Unit>> create(int serviceId) async {
    try {
      await _favoriteApi.create(serviceId);
      return right(unit);
    } catch (e) {
      _logger.e(e);
      return left(const FavoriteFailure.serverError());
    }

    // return left(const FavoriteFailure.serverError());
  }

  @override
  Future<Either<FavoriteFailure, Unit>> delete(int serviceId) async {
    try {
      await _favoriteApi.delete(serviceId);
      return right(unit);
    } catch (e) {
      _logger.e(e);
    }

    return left(const FavoriteFailure.serverError());
  }
}
