import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/booking.dart';
import '../../domain/i_booking_repository.dart';
part 'order_detail_cubit.freezed.dart';

@freezed
class OrderDetailState with _$OrderDetailState {
  const OrderDetailState._();

  factory OrderDetailState.init() => OrderDetailState(bookingOption: none());

  factory OrderDetailState(
      {@Default(false) bool isLoading,
      required Option<Booking> bookingOption}) = _OrderDetailState;

  bool get isCancelAvailable => booking?.status == 'created';

  Booking? get booking => bookingOption.fold(() => null, (item) => item);

  // bool get isCancelAvailable => booking?.status == OrderStatus.created;

}

class OrderDetailCubit extends Cubit<OrderDetailState> {
  final IBookingRepository _repository;

  OrderDetailCubit(this._repository) : super(OrderDetailState.init());

  Future<void> detailRequested(int id) async {
    emit(state.copyWith(isLoading: true));

    Option<Booking> possibleData = await _repository.detail(id);

    emit(state.copyWith(isLoading: false));
    emit(state.copyWith(bookingOption: possibleData));
  }

  void refreshRequested() => emit(OrderDetailState.init());
}
