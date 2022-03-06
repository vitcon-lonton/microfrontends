import 'package:dartz/dartz.dart' hide Order;
import 'package:engine/value_objects/value_objects.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:booking/booking.dart';

part 'cart_cubit.freezed.dart';

@freezed
class CartState with _$CartState {
  const CartState._();

  factory CartState({
    UniqueId? removingId,
    @Default(false) bool isAdding,
    @Default(false) bool isLoading,
    @Default(false) bool isRemoving,
    @Default(false) bool isSubmitting,
    @Default(true) bool showErrorMessages,
    required Option<List<CartItem>> itemsOption,
    required Option<Either<BookingFailure, Unit>> addFailureOrSuccessOption,
    required Option<Either<BookingFailure, Unit>> removeFailureOrSuccessOption,
    required Option<Either<BookingFailure, Unit>> submitFailureOrSuccessOption,
  }) = _CartState;

  List<CartItem> get items {
    return itemsOption.foldRight(<CartItem>[], (items, prev) => items);
  }

  bool get isSubmitAvailable {
    if (isLoading ||
        isRemoving ||
        isSubmitting ||
        items.isEmpty ||
        removingId != null) return false;

    return true;
  }

  factory CartState.init() {
    return CartState(
        itemsOption: none(),
        addFailureOrSuccessOption: none(),
        removeFailureOrSuccessOption: none(),
        submitFailureOrSuccessOption: none());
  }
}

class CartCubit extends Cubit<CartState> {
  final IBookingRepository _repository;

  CartCubit(this._repository) : super(CartState.init());

  @override
  void onChange(Change<CartState> change) {
    super.onChange(change);
    // ignore: avoid_print
    // print(change.nextState.items.length);
  }

  Future<void> getCartRequested() async {
    emit(state.copyWith(isLoading: true));

    final cartOption = await _repository.getCart();

    emit(state.copyWith(isLoading: false));
    emit(state.copyWith(itemsOption: cartOption));
  }

  Future<void> removeItemRequested(UniqueId id) async {
    emit(state.copyWith(removingId: id));
    emit(state.copyWith(isRemoving: true));
    emit(state.copyWith(removeFailureOrSuccessOption: none()));

    final failureOrSuccess = await _repository.removeItem(id);

    emit(state.copyWith(removingId: null));
    emit(state.copyWith(isRemoving: false));
    emit(state.copyWith(
      removeFailureOrSuccessOption: optionOf(failureOrSuccess),
    ));
  }

  Future<void> addItemRequested() async {
    emit(state.copyWith(isAdding: true));
    emit(state.copyWith(addFailureOrSuccessOption: none()));

    final failureOrSuccess = await _repository.addItem(item: CartItem.random());

    emit(state.copyWith(isAdding: false));
    emit(state.copyWith(addFailureOrSuccessOption: optionOf(failureOrSuccess)));
  }

  Future<void> submitBookingRequested() async {
    emit(state.copyWith(isSubmitting: true));
    emit(state.copyWith(submitFailureOrSuccessOption: none()));

    final failureOrSuccess = await _repository.submitBooking();

    emit(state.copyWith(isSubmitting: false));
    emit(state.copyWith(itemsOption: optionOf(null)));
    emit(state.copyWith(
      submitFailureOrSuccessOption: optionOf(failureOrSuccess),
    ));
  }

  void refreshRequested() => emit(CartState.init());
}
