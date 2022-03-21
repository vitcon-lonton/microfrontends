import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/favorite_failure.dart';
import '../../domain/i_favorite_repository.dart';
part 'favorite_create_cubit.freezed.dart';

@freezed
class FavoriteCreateState with _$FavoriteCreateState {
  const factory FavoriteCreateState.initial() = _Initial;
  const factory FavoriteCreateState.createSuccess() = _CreateSuccess;
  const factory FavoriteCreateState.actionInProgress() = _ActionInProgress;
  const factory FavoriteCreateState.createFailure(FavoriteFailure failure) =
      _CreateFailure;
}

class FavoriteCreateCubit extends Cubit<FavoriteCreateState> {
  FavoriteCreateCubit(this._repository)
      : super(const FavoriteCreateState.initial());

  final IFavoriteRepository _repository;

  Future<void> created(int serviceId) async {
    emit(const FavoriteCreateState.actionInProgress());
    final possibleFailure = await _repository.create(serviceId);
    emit(possibleFailure.fold(FavoriteCreateState.createFailure,
        (_) => const FavoriteCreateState.createSuccess()));
  }
}
