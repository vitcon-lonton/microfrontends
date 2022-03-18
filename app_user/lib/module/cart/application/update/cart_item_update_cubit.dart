import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/cart_failure.dart';
import '../../domain/cart_item.dart';
import '../../domain/i_cart_repository.dart';
part 'cart_item_update_cubit.freezed.dart';

@freezed
class CartItemUpdateState with _$CartItemUpdateState {
  const factory CartItemUpdateState.initial() = _Initial;
  const factory CartItemUpdateState.updateSuccess() = _UpdateSuccess;
  const factory CartItemUpdateState.actionInProgress() = _ActionInProgress;
  const factory CartItemUpdateState.updateFailure(CartFailure failure) =
      _CreateFailure;
}

class CartItemUpdateCubit extends Cubit<CartItemUpdateState> {
  CartItemUpdateCubit(this._repository)
      : super(const CartItemUpdateState.initial());

  final ICartRepository _repository;

  Future<void> updated(CartItem item) async {
    emit(const CartItemUpdateState.actionInProgress());
    final possibleFailure = await _repository.update(item);
    emit(possibleFailure.fold(CartItemUpdateState.updateFailure,
        (_) => const CartItemUpdateState.updateSuccess()));
  }
}
