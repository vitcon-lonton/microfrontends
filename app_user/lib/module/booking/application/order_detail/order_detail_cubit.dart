import 'package:dartz/dartz.dart' hide Order;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:app_user/core/core.dart';
import '../../domain/booking_failure.dart';
import '../../domain/i_booking_repository.dart';
import '../../domain/order.dart';
part 'order_detail_cubit.freezed.dart';

@freezed
class OrderDetailState with _$OrderDetailState {
  const OrderDetailState._();

  factory OrderDetailState(
      {@Default(false) bool isLoading,
      required Option<Order> orderOption}) = _OrderDetailState;

  bool get isCancelAvailable => order?.status == OrderStatus.created;

  Order? get order => orderOption.foldRight(null, (order, prev) => order);

  factory OrderDetailState.init() => OrderDetailState(orderOption: none());
}

class OrderDetailCubit extends Cubit<OrderDetailState> {
  final IBookingRepository _repository;

  OrderDetailCubit(this._repository) : super(OrderDetailState.init());

  void refreshRequested() => emit(OrderDetailState.init());

  Future<void> detailRequested(UniqueId id) async {
    emit(state.copyWith(isLoading: true));

    final orderOption = await _repository.detail(id);

    emit(state.copyWith(isLoading: false));
    emit(state.copyWith(orderOption: orderOption));
  }
}
