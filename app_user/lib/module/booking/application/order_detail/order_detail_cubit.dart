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

  factory OrderDetailState({
    @Default(STATUS_IDLE) status,
    @Default(false) bool isCanceling,
    @Default(false) bool isSubmitting,
    @Default(true) bool showErrorMessages,
    required Option<Order> orderOption,
    required Option<Either<BookingFailure, Unit>> cancelFailureOrSuccessOption,
  }) = _OrderDetailState;

  bool get isCancelAvailable => order?.status == OrderStatus.created;

  Order? get order => orderOption.foldRight(null, (order, prev) => order);

  OrderDetailState busy() => copyWith(status: STATUS_BUSY);
  OrderDetailState idle() => copyWith(status: STATUS_IDLE);
  OrderDetailState failed() => copyWith(status: STATUS_FAILED);
  OrderDetailState complete() => copyWith(status: STATUS_COMPLETE);

  factory OrderDetailState.init() => OrderDetailState(
      orderOption: none(), cancelFailureOrSuccessOption: none());
}

class OrderDetailCubit extends Cubit<OrderDetailState> {
  final IBookingRepository _repository;

  OrderDetailCubit(this._repository) : super(OrderDetailState.init());

  void refreshRequested() => emit(OrderDetailState.init());

  Future<void> getDetailRequested(UniqueId id) async {
    emit(state.copyWith(isSubmitting: true));

    final orderOption = await _repository.detail(id);

    emit(state.copyWith(isSubmitting: false));
    emit(state.copyWith(orderOption: orderOption));
  }

  Future<void> deleteOrderRequested(UniqueId id) async {
    emit(state.copyWith(isCanceling: true));

    final orderOption = await _repository.delete(id);

    emit(state.copyWith(isCanceling: false));
    emit(state.copyWith(cancelFailureOrSuccessOption: optionOf(orderOption)));
    emit(state.copyWith(
      orderOption: optionOf(state.order!.copyWith(status: OrderStatus.cancel)),
    ));
  }
}
