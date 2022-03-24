import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/favorite.dart';
import '../../domain/i_favorite_repository.dart';
part 'favorite_find_cubit.freezed.dart';

@freezed
class FavoriteFindState with _$FavoriteFindState {
  const factory FavoriteFindState.initial() = _Initial;
  const factory FavoriteFindState.notFound() = _NotFound;
  const factory FavoriteFindState.founded(int serviceId) = _Founded;
  const factory FavoriteFindState.actionInProgress() = _ActionInProgress;
}

class FavoriteFindCubit extends Cubit<FavoriteFindState> {
  final IFavoriteRepository _repository;

  FavoriteFindCubit(this._repository)
      : super(const FavoriteFindState.initial());

  Future<void> findRequested(int serviceId) async {
    emit(const FavoriteFindState.actionInProgress());
    Option<Favorite> possibleData = await _repository.find(serviceId);
    emit(possibleData.fold(() => const FavoriteFindState.notFound(),
        (_) => FavoriteFindState.founded(serviceId)));
  }
}
