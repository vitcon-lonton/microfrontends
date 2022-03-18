import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:app_user/core/core.dart';
import '../../domain/cart_failure.dart';
import '../../domain/i_cart_repository.dart';
part 'cart_item_delete_cubit.freezed.dart';

@freezed
class CartItemDeleteState with _$CartItemDeleteState {
  const factory CartItemDeleteState.initial() = _Initial;
  const factory CartItemDeleteState.deleteSuccess() = _DeleteSuccess;
  const factory CartItemDeleteState.actionInProgress() = _ActionInProgress;
  const factory CartItemDeleteState.deleteFailure(CartFailure failure) =
      _DeleteFailure;
}

class CartItemDeleteCubit extends Cubit<CartItemDeleteState> {
  CartItemDeleteCubit(this._repository)
      : super(const CartItemDeleteState.initial());

  final ICartRepository _repository;

  Future<void> deleted(UniqueId id) async {
    emit(const CartItemDeleteState.actionInProgress());
    final possibleFailure = await _repository.delete(id);
    emit(possibleFailure.fold(CartItemDeleteState.deleteFailure,
        (_) => const CartItemDeleteState.deleteSuccess()));
  }
}
