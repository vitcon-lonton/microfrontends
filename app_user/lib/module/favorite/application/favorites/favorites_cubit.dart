import 'package:dartz/dartz.dart' hide Order;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/favorite.dart';
import '../../domain/i_favorite_repository.dart';

part 'favorites_cubit.freezed.dart';

@freezed
class FavoritesState with _$FavoritesState {
  const FavoritesState._();

  factory FavoritesState({
    @Default(1) page,
    @Default(10) perPage,
    @Default(1) pageCount,
    @Default(0) totalCount,
    @Default(false) bool isSubmitting,
    @Default(true) bool showErrorMessages,
    required Option<List<Favorite>> favoritesOption,
    int? removingId,
  }) = _FavoritesState;

  bool get isLastPage => page == pageCount;

  List<Favorite> get favorites {
    return List.of(favoritesOption
        .foldRight(<Favorite>[], (favorites, prev) => favorites));
  }

  factory FavoritesState.init() => FavoritesState(favoritesOption: none());
}

class FavoritesCubit extends Cubit<FavoritesState> {
  final IFavoriteRepository _repository;

  FavoritesCubit(this._repository) : super(FavoritesState.init());

  refreshRequested() => emit(FavoritesState.init());

  pageNumberChanged(int value) => emit(state.copyWith(page: value));

  Future<void> getFavoritesRequested() async {
    emit(state.copyWith(isSubmitting: true));

    final page = state.page;
    final perPage = state.perPage;
    final resultOption = await _repository.all(page: page, perPage: perPage);

    resultOption.fold(() {}, (pagination) {
      final favoritesOption = state.favoritesOption;
      final currentFavorites = favoritesOption
          .foldRight(<Favorite>[], (favorites, previous) => favorites);
      final newFavorites = currentFavorites..addAll(pagination.data);

      emit(state.copyWith(
          page: pagination.page,
          perPage: pagination.perPage,
          pageCount: pagination.pageCount,
          totalCount: pagination.totalCount,
          favoritesOption: optionOf(newFavorites)));
    });

    emit(state.copyWith(isSubmitting: false));
  }

  Future<void> unlikeRequested(int id) async {
    emit(state.copyWith(removingId: id));

    await Future.delayed(const Duration(milliseconds: 1500));

    state.favoritesOption.fold(() {}, (favorites) {
      final newFavorites = List<Favorite>.from(favorites);

      newFavorites.removeWhere((favorite) {
        return favorite.id.compareTo(id) == 0;
      });

      emit(state.copyWith(favoritesOption: optionOf(newFavorites)));
    });

    emit(state.copyWith(removingId: null));
  }
}
