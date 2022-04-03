import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/kt.dart';
part 'favorite_storage_cubit.freezed.dart';

@freezed
class FavoriteStorageState with _$FavoriteStorageState {
  const FavoriteStorageState._();

  factory FavoriteStorageState(
      {@Default(KtList<int>.empty()) KtList<int> ids}) = _FavoriteStorageState;

  factory FavoriteStorageState.init() => FavoriteStorageState();
}

class FavoriteStorageCubit extends Cubit<FavoriteStorageState> {
  FavoriteStorageCubit() : super(FavoriteStorageState.init());

  void push(int serviceId) {
    emit(state.copyWith(
      ids: state.ids.filterNot((id) => id == serviceId).plusElement(serviceId),
    ));
  }

  void remove(int serviceId) {
    emit(state.copyWith(
      ids: state.ids.filterNot((id) => id == serviceId).minusElement(serviceId),
    ));
  }
}
