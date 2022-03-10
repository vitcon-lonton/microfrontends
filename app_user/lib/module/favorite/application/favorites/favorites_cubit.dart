import 'package:dartz/dartz.dart' hide Order;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:app_user/core/core.dart';
import '../../domain/favorite.dart';
import '../../domain/i_repository.dart';

part 'favorites_cubit.freezed.dart';

@freezed
class FavoritesState with _$FavoritesState {
  const FavoritesState._();

  factory FavoritesState({
    @Default(1) page,
    @Default(10) perPage,
    @Default(1) pageCount,
    @Default(0) totalCount,
    @Default(STATUS_IDLE) status,
    @Default(false) bool isSubmitting,
    @Default(true) bool showErrorMessages,
    required Option<List<Favorite>> favoritesOption,
    UniqueId? removingId,
  }) = _FavoritesState;

  bool get isLastPage => page == pageCount;

  List<Favorite> get favorites =>
      favoritesOption.foldRight(<Favorite>[], (favorites, prev) => favorites);

  FavoritesState busy() => copyWith(status: STATUS_BUSY);
  FavoritesState idle() => copyWith(status: STATUS_IDLE);
  FavoritesState failed() => copyWith(status: STATUS_FAILED);
  FavoritesState complete() => copyWith(status: STATUS_COMPLETE);

  factory FavoritesState.init() {
    return FavoritesState(favoritesOption: none());
  }
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
    final resultOption = await _repository.get(page: page, perPage: perPage);

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

  Future<void> unlikeRequested(UniqueId id) async {
    emit(state.copyWith(removingId: id));

    await Future.delayed(const Duration(milliseconds: 1500));

    state.favoritesOption.fold(() {}, (favorites) {
      final newFavorites = List<Favorite>.from(favorites);

      newFavorites.removeWhere((favorite) {
        return favorite.id.getOrCrash().compareTo(id.getOrCrash()) == 0;
      });

      emit(state.copyWith(favoritesOption: optionOf(newFavorites)));
    });

    emit(state.copyWith(removingId: null));
  }
}
