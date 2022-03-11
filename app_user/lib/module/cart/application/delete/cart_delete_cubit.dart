import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:app_user/core/core.dart';
import '../../domain/cart_failure.dart';
import '../../domain/i_cart_repository.dart';
part 'cart_delete_cubit.freezed.dart';

@freezed
class CartDeleteState with _$CartDeleteState {
  const factory CartDeleteState.initial() = _Initial;
  const factory CartDeleteState.deleteSuccess() = _DeleteSuccess;
  const factory CartDeleteState.actionInProgress() = _ActionInProgress;
  const factory CartDeleteState.deleteFailure(CartFailure failure) =
      _DeleteFailure;
}

class CartDeleteCubit extends Cubit<CartDeleteState> {
  CartDeleteCubit(this._repository) : super(const CartDeleteState.initial());

  final ICartRepository _repository;

  Future<void> deleted(UniqueId id) async {
    emit(const CartDeleteState.actionInProgress());
    final possibleFailure = await _repository.delete(id);
    emit(possibleFailure.fold(CartDeleteState.deleteFailure,
        (_) => const CartDeleteState.deleteSuccess()));
  }
}
