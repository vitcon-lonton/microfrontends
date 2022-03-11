import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/cart_failure.dart';
import '../../domain/cart_item.dart';
import '../../domain/i_cart_repository.dart';
part 'cart_create_cubit.freezed.dart';

@freezed
class CartCreateState with _$CartCreateState {
  const factory CartCreateState.initial() = _Initial;
  const factory CartCreateState.createSuccess() = _CreateSuccess;
  const factory CartCreateState.actionInProgress() = _ActionInProgress;
  const factory CartCreateState.createFailure(CartFailure failure) =
      _CreateFailure;
}

class CartCreateCubit extends Cubit<CartCreateState> {
  CartCreateCubit(this._repository) : super(const CartCreateState.initial());

  final ICartRepository _repository;

  Future<void> created(CartItem item) async {
    emit(const CartCreateState.actionInProgress());
    final possibleFailure = await _repository.create(item: item);
    emit(possibleFailure.fold(CartCreateState.createFailure,
        (_) => const CartCreateState.createSuccess()));
  }
}
