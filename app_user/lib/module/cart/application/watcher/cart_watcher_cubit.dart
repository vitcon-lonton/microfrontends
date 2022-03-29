import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/kt.dart';
import '../../domain/cart_failure.dart';
import '../../domain/cart_item.dart';
import '../../domain/i_cart_repository.dart';
part 'cart_watcher_cubit.freezed.dart';

@freezed
class CartWatcherState with _$CartWatcherState {
  const factory CartWatcherState.initial() = _Initial;
  const factory CartWatcherState.loadInProgress() = _LoadInProgress;
  const factory CartWatcherState.loadSuccess(KtList<CartItem> items) =
      _LoadSuccess;
  const factory CartWatcherState.loadFailure(CartFailure failure) =
      _LoadFailure;
}

class CartWatcherCubit extends Cubit<CartWatcherState> {
  final ICartRepository _repository;

  CartWatcherCubit(this._repository) : super(const CartWatcherState.initial());

  StreamSubscription<Either<CartFailure, KtList<CartItem>>>?
      _cartStreamSubscription;

  @override
  Future<void> close() async {
    await _cartStreamSubscription?.cancel();
    return super.close();
  }

  Future<void> watchAllStarted() async {
    emit(const CartWatcherState.loadInProgress());

    await _cartStreamSubscription?.cancel();

    _cartStreamSubscription = _repository.watchAll().listen((failureOrCart) {
      emit(failureOrCart.fold((failure) {
        return CartWatcherState.loadFailure(failure);
      }, (items) => CartWatcherState.loadSuccess(items)));
    });
  }

  void cartReceived(Either<CartFailure, KtList<CartItem>> failureOrCart) async {
    emit(failureOrCart.fold((failure) {
      return CartWatcherState.loadFailure(failure);
    }, (items) => CartWatcherState.loadSuccess(items)));
  }
}
