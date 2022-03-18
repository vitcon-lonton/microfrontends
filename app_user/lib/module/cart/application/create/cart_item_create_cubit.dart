import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/cart_failure.dart';
import '../../domain/cart_item.dart';
import '../../domain/i_cart_repository.dart';
part 'cart_item_create_cubit.freezed.dart';

@freezed
class CartItemCreateState with _$CartItemCreateState {
  const factory CartItemCreateState.initial() = _Initial;
  const factory CartItemCreateState.createSuccess() = _CreateSuccess;
  const factory CartItemCreateState.actionInProgress() = _ActionInProgress;
  const factory CartItemCreateState.createFailure(CartFailure failure) =
      _CreateFailure;
}

class CartItemCreateCubit extends Cubit<CartItemCreateState> {
  CartItemCreateCubit(this._repository)
      : super(const CartItemCreateState.initial());

  final ICartRepository _repository;

  Future<void> created(CartItem item) async {
    emit(const CartItemCreateState.actionInProgress());
    final possibleFailure = await _repository.create(item);
    emit(possibleFailure.fold(CartItemCreateState.createFailure,
        (_) => const CartItemCreateState.createSuccess()));
  }
}
