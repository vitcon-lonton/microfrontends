import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/booking_failure.dart';
import '../../domain/i_booking_repository.dart';
part 'booking_delete_cubit.freezed.dart';

@freezed
class BookingDeleteState with _$BookingDeleteState {
  const factory BookingDeleteState.initial() = _Initial;
  const factory BookingDeleteState.inProgress() = _InProgress;
  const factory BookingDeleteState.deleteSuccess() = _DeleteSuccess;
  const factory BookingDeleteState.deleteFailure(BookingFailure failure) =
      _DeleteFailure;
}

class BookingDeleteCubit extends Cubit<BookingDeleteState> {
  BookingDeleteCubit(this._repository)
      : super(const BookingDeleteState.initial());

  final IBookingRepository _repository;

  Future<void> deleted(int id) async {
    emit(const BookingDeleteState.inProgress());
    final possibleFailure = await _repository.delete(id);
    emit(possibleFailure.fold((failure) {
      return BookingDeleteState.deleteFailure(failure);
    }, (_) => const BookingDeleteState.deleteSuccess()));
  }
}
