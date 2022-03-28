import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/booking.dart';
import '../../domain/i_booking_repository.dart';
part 'booking_detail_cubit.freezed.dart';

@freezed
class BookingDetailState with _$BookingDetailState {
  const factory BookingDetailState.initial() = _Initial;
  const factory BookingDetailState.notFound() = _NotFound;
  const factory BookingDetailState.inProgress() = _InProgress;
  const factory BookingDetailState.founded(Booking booking) = _Founded;
}

class BookingDetailCubit extends Cubit<BookingDetailState> {
  BookingDetailCubit(this._repository)
      : super(const BookingDetailState.initial());

  final IBookingRepository _repository;

  Future<void> detailRequested(int id) async {
    emit(const BookingDetailState.inProgress());
    Option<Booking> possibleData = await _repository.detail(id);
    emit(possibleData.fold(() {
      return const BookingDetailState.notFound();
    }, (booking) => BookingDetailState.founded(booking)));
  }

  void refreshRequested() => emit(const BookingDetailState.initial());
}

// @freezed
// class BookingDetailState with _$BookingDetailState {
//   const BookingDetailState._();
//   factory BookingDetailState.init() => BookingDetailState(bookingOption: none());
//   factory BookingDetailState(
//       {@Default(false) bool isLoading,
//       required Option<Booking> bookingOption}) = _BookingDetailState;
//   Booking? get booking => bookingOption.toNullable();
//   BookingStatus? get status => booking?.status;
// }
// emit(state.copyWith(isLoading: true));
// Option<Booking> possibleData = await _repository.detail(id);
// emit(state.copyWith(isLoading: false));
// emit(state.copyWith(bookingOption: possibleData));
