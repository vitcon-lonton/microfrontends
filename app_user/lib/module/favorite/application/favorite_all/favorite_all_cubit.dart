import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/kt.dart';
import 'package:app_user/core/core.dart';
import '../../domain/favorite.dart';
import '../../domain/i_favorite_repository.dart';
part 'favorite_all_cubit.freezed.dart';

@freezed
class FavoriteAllState with _$FavoriteAllState {
  const FavoriteAllState._();

  factory FavoriteAllState({
    @Default(1) page,
    @Default(10) perPage,
    @Default(1) pageCount,
    @Default(0) totalCount,
    @Default(false) bool isSubmitting,
    @Default(true) bool showErrorMessages,
    required Option<KtList<Favorite>> favoritesOption,
    int? removingId,
  }) = _FavoriteAllState;

  bool get isLastPage => page == pageCount;

  KtList<Favorite> get favorites {
    return favoritesOption.foldRight(emptyList(), (items, prev) => items);
  }

  factory FavoriteAllState.init() => FavoriteAllState(favoritesOption: none());
}

class FavoriteAllCubit extends Cubit<FavoriteAllState> {
  FavoriteAllCubit(this._repository) : super(FavoriteAllState.init());

  final IFavoriteRepository _repository;

  void refreshRequested() => emit(FavoriteAllState.init());

  void pageNumberChanged(int value) => emit(state.copyWith(page: value));

  Future<void> getAllRequested() async {
    emit(state.copyWith(isSubmitting: true));

    Option<Pagination<Favorite>> dataPossible = await _performGetAll();

    dataPossible.fold(() {}, (pagination) {
      emit(state.copyWith(
          page: pagination.page,
          perPage: pagination.perPage,
          pageCount: pagination.pageCount,
          totalCount: pagination.totalCount,
          favoritesOption: optionOf(state.favorites.plus(pagination.data))));
    });

    emit(state.copyWith(isSubmitting: false));
  }

  Future<Option<Pagination<Favorite>>> _performGetAll() {
    return _repository.all(page: state.page, perPage: state.perPage);
  }
}
