import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:app_user/core/core.dart';
import '../../domain/failure.dart';
import '../../domain/i_favorite_repository.dart';
part 'favorite_cubit.freezed.dart';

@freezed
class FavoriteState with _$FavoriteState {
  const FavoriteState._();

  factory FavoriteState({
    required UniqueId id,
    @Default(false) bool isLoading,
    required Option<bool> likedOption,
    required Option<FavoriteFailure> failureOption,
  }) = _FavoriteState;

  bool get isLiked => likedOption.fold(() => false, (value) => value);

  factory FavoriteState.init() {
    return FavoriteState(
        likedOption: none(), failureOption: none(), id: UniqueId());
  }
}

class FavoriteCubit extends Cubit<FavoriteState> {
  final IFavoriteRepository _repository;

  FavoriteCubit(this._repository) : super(FavoriteState.init());

  Future<void> _performAdd() async {
    emit(state.copyWith(isLoading: true));
    emit(state.copyWith(likedOption: none()));
    emit(state.copyWith(failureOption: none()));

    bool isLiked;
    Option<FavoriteFailure> failureOption;
    Either<FavoriteFailure, Unit> failureOrSuccess;

    failureOrSuccess = await _repository.create(state.id);
    failureOption = failureOrSuccess.fold(optionOf, (_) => none());
    isLiked = failureOrSuccess.fold((failure) => false, (_) => true);

    emit(state.copyWith(isLoading: false));
    emit(state.copyWith(failureOption: failureOption));
    emit(state.copyWith(likedOption: optionOf(isLiked)));
  }

  Future<void> _performRemove() async {
    emit(state.copyWith(isLoading: true));
    emit(state.copyWith(likedOption: none()));
    emit(state.copyWith(failureOption: none()));

    bool isLiked;
    Option<FavoriteFailure> failureOption;
    Either<FavoriteFailure, Unit> failureOrSuccess;

    failureOrSuccess = await _repository.delete(state.id);
    failureOption = failureOrSuccess.fold(optionOf, (_) => none());
    isLiked = failureOrSuccess.fold((failure) => true, (_) => false);

    emit(state.copyWith(isLoading: false));
    emit(state.copyWith(failureOption: failureOption));
    emit(state.copyWith(likedOption: optionOf(isLiked)));
  }

  Future<void> toggleFavoriteRequested() {
    if (state.isLiked) {
      return _performRemove();
    }

    return _performAdd();
  }
}


// likedOption = failureOrSuccess.foldRight(none(), (_, prev) {
//   return optionOf(true);
// });
// likedOption = failureOrSuccess.fold(optionOf, (_) => none());
// failureOption = failureOrSuccess.foldRight(none(), (_, prev) => prev);
// isLiked = failureOrSuccess.foldLeft(false, (dfValue, _) => !dfValue);