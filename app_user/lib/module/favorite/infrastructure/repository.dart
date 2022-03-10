import 'package:dartz/dartz.dart';
import 'package:app_user/core/core.dart';
import '../domain/failure.dart';
import '../domain/favorite.dart';
import '../domain/i_repository.dart';

class FavoriteRepository implements IFavoriteRepository {
  @override
  Future<Option<Pagination<Favorite>>> get(
      {required int page, required int perPage}) async {
    await Future.delayed(const Duration(milliseconds: 400));

    const pageCount = 5;
    final totalCount = perPage * 5;
    final data = List.generate(perPage, (index) => Favorite.random());

    final result = Pagination<Favorite>(
        data: data,
        page: page,
        perPage: perPage,
        pageCount: pageCount,
        totalCount: totalCount);

    return optionOf(result);
  }

  @override
  Future<Either<FavoriteFailure, Unit>> create(UniqueId id) async {
    await Future.delayed(const Duration(milliseconds: 400));
    return right(unit);
  }

  @override
  Future<Either<FavoriteFailure, Unit>> delete(UniqueId id) async {
    // return right(unit);
    await Future.delayed(const Duration(milliseconds: 400));
    return left(const FavoriteFailure.serverError());
  }
}
