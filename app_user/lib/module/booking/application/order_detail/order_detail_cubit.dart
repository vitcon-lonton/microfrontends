import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/booking.dart';
import '../../domain/i_booking_repository.dart';
part 'order_detail_cubit.freezed.dart';

@freezed
class OrderDetailState with _$OrderDetailState {
  const OrderDetailState._();
  const factory OrderDetailState.initial() = _Initial;
  const factory OrderDetailState.notFound() = _NotFound;
  const factory OrderDetailState.inProgress() = _InProgress;
  const factory OrderDetailState.founded(Booking booking) = _Founded;
}

class OrderDetailCubit extends Cubit<OrderDetailState> {
  OrderDetailCubit(this._repository) : super(const OrderDetailState.initial());

  final IBookingRepository _repository;

  Future<void> detailRequested(int id) async {
    emit(const OrderDetailState.inProgress());
    Option<Booking> possibleData = await _repository.detail(id);
    emit(possibleData.fold(() {
      return const OrderDetailState.notFound();
    }, (booking) => OrderDetailState.founded(booking)));
  }

  void refreshRequested() => emit(const OrderDetailState.initial());
}

// @freezed
// class OrderDetailState with _$OrderDetailState {
//   const OrderDetailState._();
//   factory OrderDetailState.init() => OrderDetailState(bookingOption: none());
//   factory OrderDetailState(
//       {@Default(false) bool isLoading,
//       required Option<Booking> bookingOption}) = _OrderDetailState;
//   Booking? get booking => bookingOption.toNullable();
//   BookingStatus? get status => booking?.status;
// }
// emit(state.copyWith(isLoading: true));
// Option<Booking> possibleData = await _repository.detail(id);
// emit(state.copyWith(isLoading: false));
// emit(state.copyWith(bookingOption: possibleData));
