import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/cart_failure.dart';
import '../../domain/cart_item.dart';
import '../../domain/i_cart_repository.dart';
part 'cart_update_cubit.freezed.dart';

@freezed
class CartUpdateState with _$CartUpdateState {
  const factory CartUpdateState.initial() = _Initial;
  const factory CartUpdateState.updateSuccess() = _UpdateSuccess;
  const factory CartUpdateState.actionInProgress() = _ActionInProgress;
  const factory CartUpdateState.updateFailure(CartFailure failure) =
      _CreateFailure;
}

class CartUpdateCubit extends Cubit<CartUpdateState> {
  CartUpdateCubit(this._repository) : super(const CartUpdateState.initial());

  final ICartRepository _repository;

  Future<void> updated(CartItem item) async {
    emit(const CartUpdateState.actionInProgress());
    final possibleFailure = await _repository.create(item: item);
    emit(possibleFailure.fold(CartUpdateState.updateFailure,
        (_) => const CartUpdateState.updateSuccess()));
  }
}
