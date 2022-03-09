// ignore_for_file: unnecessary_import

import 'package:dartz/dartz.dart';
import 'package:engine/engine.dart';
import '../domain/i_repository.dart';
import '../domain/favorite.dart';

class FavoriteRepository implements IFavoriteRepository {
  @override
  Future<Option<Pagination<Favorite>>> getFavorites(
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
}
