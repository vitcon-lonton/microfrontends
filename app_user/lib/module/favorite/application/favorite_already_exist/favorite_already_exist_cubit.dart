import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/favorite.dart';
import '../../domain/i_favorite_repository.dart';
part 'favorite_already_exist_cubit.freezed.dart';

@freezed
class FavoriteAlreadyExistState with _$FavoriteAlreadyExistState {
  const FavoriteAlreadyExistState._();

  factory FavoriteAlreadyExistState.init() {
    return FavoriteAlreadyExistState(itemOption: none());
  }

  factory FavoriteAlreadyExistState(
      {@Default(1) int serviceId,
      @Default(false) bool isLoading,
      required Option<Favorite> itemOption}) = _FavoriteAlreadyExistState;

  bool get isAlreadyExist => itemOption.fold(() => false, (item) => true);
}

class FavoriteAlreadyExistCubit extends Cubit<FavoriteAlreadyExistState> {
  FavoriteAlreadyExistCubit(this._repository)
      : super(FavoriteAlreadyExistState.init());

  final IFavoriteRepository _repository;

  void initialized(Option<int> initialServiceIdOption) {
    emit(initialServiceIdOption.fold(() => state, (initialServiceId) {
      return state.copyWith(serviceId: initialServiceId);
    }));
  }

  Future<void> findItemRequested() async {
    Option<Favorite> possibleData;
    emit(state.copyWith(isLoading: true));
    possibleData = await _repository.findByServiceId(state.serviceId);
    emit(state.copyWith(isLoading: false, itemOption: possibleData));
  }
}
