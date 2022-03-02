import 'package:dartz/dartz.dart' hide Order;
import 'package:engine/processing_status.dart';
import 'package:engine/value_objects/value_objects.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:booking/booking.dart';

part 'cart_cubit.freezed.dart';

@freezed
class CartState with _$CartState {
  const CartState._();

  factory CartState.init() =>
      CartState(itemsOption: none(), removeFailureOrSuccessOption: none());

  factory CartState({
    UniqueId? removingId,
    @Default(STATUS_IDLE) status,
    @Default(false) bool isLoading,
    @Default(true) bool showErrorMessages,
    required Option<List<CartItem>> itemsOption,
    required Option<Either<BookingFailure, Unit>> removeFailureOrSuccessOption,
  }) = _CartState;

  CartState busy() => copyWith(status: STATUS_BUSY);
  CartState idle() => copyWith(status: STATUS_IDLE);
  CartState failed() => copyWith(status: STATUS_FAILED);
  CartState complete() => copyWith(status: STATUS_COMPLETE);

  List<CartItem> get items =>
      itemsOption.foldRight(<CartItem>[], (items, prev) => items);
}

class CartCubit extends Cubit<CartState> {
  final IBookingRepository _repository;

  CartCubit(this._repository) : super(CartState.init());

  void refreshRequested() => emit(CartState.init());

  Future<void> getCartRequested() async {
    emit(state.copyWith(isLoading: true));

    final cartOption = await _repository.getCart();

    emit(state.copyWith(isLoading: false));
    emit(state.copyWith(itemsOption: cartOption));
  }

  Future<void> removeItemRequested(UniqueId id) async {
    emit(state.copyWith(removingId: id));
    emit(state.copyWith(isLoading: true));

    final failureOrSuccess = await _repository.removeItem(id);

    emit(state.copyWith(removingId: null));
    emit(state.copyWith(isLoading: false));
    emit(state.copyWith(
      removeFailureOrSuccessOption: optionOf(failureOrSuccess),
    ));
  }
}
