import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/booking_failure.dart';
import '../../domain/i_booking_repository.dart';
part 'booking_cancel_cubit.freezed.dart';

@freezed
class BookingCancelState with _$BookingCancelState {
  const factory BookingCancelState.initial() = _Initial;
  const factory BookingCancelState.inProgress() = _InProgress;
  const factory BookingCancelState.cancelSuccess() = _DeleteSuccess;
  const factory BookingCancelState.cancelFailure(BookingFailure failure) =
      _DeleteFailure;
}

class BookingCancelCubit extends Cubit<BookingCancelState> {
  BookingCancelCubit(this._repository)
      : super(const BookingCancelState.initial());

  final IBookingRepository _repository;

  Future<void> canceled(int id) async {
    emit(const BookingCancelState.inProgress());
    final possibleFailure = await _repository.cancel(id);
    emit(possibleFailure.fold((failure) {
      return BookingCancelState.cancelFailure(failure);
    }, (_) => const BookingCancelState.cancelSuccess()));
  }
}
