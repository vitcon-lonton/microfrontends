import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/collection.dart';
import 'package:app_user/module/cart/domain/value_objects.dart';
import '../../domain/cart_failure.dart';
import '../../domain/cart_item.dart';
import '../../domain/i_cart_repository.dart';
part 'cart_item_form_cubit.freezed.dart';

@freezed
class CartItemFormState with _$CartItemFormState {
  const CartItemFormState._();
  const factory CartItemFormState({
    required CartItem cartItem,
    @Default(false) bool isSaving,
    @Default(false) bool isEditing,
    @Default(true) bool showErrorMessages,
    required Option<Either<CartFailure, Unit>> saveFailureOrSuccessOption,
  }) = _CartItemFormState;

  bool get isValid => cartItem.failureOption.fold(() => true, (f) => false);

  List6<String>? get base64Images => cartItem.base64Images;

  factory CartItemFormState.initial() => CartItemFormState(
      cartItem: CartItem.random(), saveFailureOrSuccessOption: none());
}

class CartItemFormCubit extends Cubit<CartItemFormState> {
  final ICartRepository _cartRepository;

  CartItemFormCubit(this._cartRepository) : super(CartItemFormState.initial());

  void timeChanged(DateTime value) {
    emit(state.copyWith(
      saveFailureOrSuccessOption: none(),
      cartItem: state.cartItem.copyWith(time: value),
    ));
  }

  void imagesChanged(KtList<String>? value) {
    emit(state.copyWith(
      saveFailureOrSuccessOption: none(),
      cartItem: state.cartItem
          .copyWith(base64Images: value == null ? null : List6(value)),
    ));
  }

  void noteChanged(String value) {
    emit(state.copyWith(
      saveFailureOrSuccessOption: none(),
      cartItem: state.cartItem.copyWith(note: ItemNote(value)),
    ));
  }

  void initialized(Option<CartItem> initialItemOption) {
    emit(initialItemOption.fold(
      () => state,
      (initialItem) => state.copyWith(cartItem: initialItem, isEditing: true),
    ));
  }

  Future<void> saved() async {
    Either<CartFailure, Unit>? failureOrSuccess;

    emit(state.copyWith(isSaving: true, saveFailureOrSuccessOption: none()));

    if (state.isEditing) {
      failureOrSuccess = await _cartRepository.update(state.cartItem);
    } else {
      failureOrSuccess = await _cartRepository.create(state.cartItem);
    }

    emit(state.copyWith(
      isSaving: false,
      saveFailureOrSuccessOption: optionOf(failureOrSuccess),
    ));
  }
}

// if (state.note.failureOption.isNone()) {
// failureOrSuccess = state.isEditing
//     ? await _cartRepository.update(state.cartItem)
//     : await _cartRepository.create(state.cartItem);
// }
