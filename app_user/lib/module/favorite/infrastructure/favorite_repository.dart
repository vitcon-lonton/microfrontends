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
  Future<Option<Pagination<Favorite>>> all(
      {required int page, required int perPage}) async {
    try {
      final response = await _favoriteApi.all();
      final responseData = response.data!;

      final result = Pagination<Favorite>(
          page: 1,
          pageCount: 1,
          perPage: responseData.length,
          totalCount: responseData.length,
          data: KtList.from(responseData));

      return optionOf(result);
    } catch (e) {
      _logger.e(e);
    }

    return none();
  }

  @override
  Future<Either<FavoriteFailure, Unit>> create(int serviceId) async {
    try {
      final response = await _favoriteApi.create(serviceId);

      if (response.success == true) {
        return right(unit);
      }
    } catch (e) {
      _logger.e(e);
    }

    return left(const FavoriteFailure.unableCreate());
  }

  @override
  Future<Either<FavoriteFailure, Unit>> delete(int serviceId) async {
    try {
      final response = await _favoriteApi.delete(serviceId);

      if (response.success == true) {
        return right(unit);
      }
    } catch (e) {
      _logger.e(e);
    }

    return left(const FavoriteFailure.unableDelete());
  }
}
