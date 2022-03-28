import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/booking_failure.dart';
import '../../domain/i_booking_repository.dart';
part 'booking_confirm_cubit.freezed.dart';

@freezed
class BookingConfirmState with _$BookingConfirmState {
  const factory BookingConfirmState.initial() = _Initial;
  const factory BookingConfirmState.inProgress() = _InProgress;
  const factory BookingConfirmState.confirmSuccess() = _ConfirmSuccess;
  const factory BookingConfirmState.confirmFailure(BookingFailure failure) =
      _ConfirmFailure;
}

class BookingConfirmCubit extends Cubit<BookingConfirmState> {
  BookingConfirmCubit(this._repository)
      : super(const BookingConfirmState.initial());

  final IBookingRepository _repository;

  Future<void> confirmed() async {
    emit(const BookingConfirmState.inProgress());
    final possibleFailure = await _repository.update({});
    emit(possibleFailure.fold((failure) {
      return BookingConfirmState.confirmFailure(failure);
    }, (_) => const BookingConfirmState.confirmSuccess()));
  }
}
