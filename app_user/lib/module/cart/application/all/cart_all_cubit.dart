import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/kt.dart';
import '../../domain/cart_item.dart';
import '../../domain/i_cart_repository.dart';
part 'cart_all_cubit.freezed.dart';

@freezed
class CartAllState with _$CartAllState {
  const CartAllState._();
  factory CartAllState.init() => CartAllState(itemsOption: none());
  factory CartAllState(
      {@Default(false) bool isLoading,
      required Option<KtList<CartItem>> itemsOption}) = _CartAllState;

  KtList<CartItem> get items => itemsOption.getOrElse(emptyList);
}

class CartAllCubit extends Cubit<CartAllState> {
  final ICartRepository _repository;

  CartAllCubit(this._repository) : super(CartAllState.init());

  void getAllRequested() async {
    emit(state.copyWith(isLoading: true));
    Option<KtList<CartItem>> possibleData = _repository.all();
    emit(state.copyWith(isLoading: false));
    emit(state.copyWith(itemsOption: possibleData));
  }

  void refreshRequested() => emit(CartAllState.init());
}
