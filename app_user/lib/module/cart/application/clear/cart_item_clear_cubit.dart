import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/i_cart_repository.dart';
part 'cart_item_clear_cubit.freezed.dart';

@freezed
class CartItemClearState with _$CartItemClearState {
  const factory CartItemClearState.initial() = _Initial;
  const factory CartItemClearState.inProgress() = _InProgress;
  const factory CartItemClearState.clearSuccess() = _ClearSuccess;
  const factory CartItemClearState.clearFailure() = _ClearFailure;
}

class CartItemClearCubit extends Cubit<CartItemClearState> {
  CartItemClearCubit(this._repository)
      : super(const CartItemClearState.initial());

  final ICartRepository _repository;

  Future<void> cleared() async {
    emit(const CartItemClearState.inProgress());
    await _repository.clear();
    emit(const CartItemClearState.clearSuccess());
  }
}
