import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/favorite_failure.dart';
import '../../domain/i_favorite_repository.dart';
part 'favorite_delete_cubit.freezed.dart';

@freezed
class FavoriteDeleteState with _$FavoriteDeleteState {
  const factory FavoriteDeleteState.initial() = _Initial;
  const factory FavoriteDeleteState.deleteSuccess() = _DeleteSuccess;
  const factory FavoriteDeleteState.actionInProgress() = _ActionInProgress;
  const factory FavoriteDeleteState.deleteFailure(FavoriteFailure failure) =
      _DeleteFailure;
}

class FavoriteDeleteCubit extends Cubit<FavoriteDeleteState> {
  FavoriteDeleteCubit(this._repository)
      : super(const FavoriteDeleteState.initial());

  final IFavoriteRepository _repository;

  Future<void> deleted(int serviceId) async {
    emit(const FavoriteDeleteState.actionInProgress());
    final possibleFailure = await _repository.delete(serviceId);
    emit(possibleFailure.fold(FavoriteDeleteState.deleteFailure,
        (_) => const FavoriteDeleteState.deleteSuccess()));
  }
}
