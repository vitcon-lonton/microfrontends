import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/cart_item.dart';
import '../../domain/i_cart_repository.dart';
part 'cart_all_cubit.freezed.dart';

@freezed
class CartAllState with _$CartAllState {
  const CartAllState._();
  factory CartAllState({
    @Default(false) bool isLoading,
    @Default(true) bool showErrorMessages,
    required Option<List<CartItem>> itemsOption,
  }) = _CartAllState;

  List<CartItem> get items {
    return List.of(itemsOption.foldRight(<CartItem>[], (items, prev) => items));
  }

  factory CartAllState.init() => CartAllState(itemsOption: none());
}

class CartAllCubit extends Cubit<CartAllState> {
  final ICartRepository _repository;

  CartAllCubit(this._repository) : super(CartAllState.init());

  void refreshRequested() => emit(CartAllState.init());

  Future<void> getAllRequested() async {
    emit(state.copyWith(isLoading: true));

    final cartOption = await _repository.all();

    emit(state.copyWith(isLoading: false));
    emit(state.copyWith(itemsOption: cartOption));
  }
}

// Future<void> addItemRequested() async {}
// Future<void> submitBookingRequested() async {}
// Future<void> removeItemRequested(UniqueId id) async {}