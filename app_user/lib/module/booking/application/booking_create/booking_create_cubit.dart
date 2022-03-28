import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/booking_failure.dart';
import '../../domain/i_booking_repository.dart';
part 'booking_create_cubit.freezed.dart';

@freezed
class BookingCreateState with _$BookingCreateState {
  const factory BookingCreateState.initial() = _Initial;
  const factory BookingCreateState.inProgress() = _InProgress;
  const factory BookingCreateState.createSuccess() = _CreateSuccess;
  const factory BookingCreateState.createFailure(BookingFailure failure) =
      _CreateFailure;
}

class BookingCreateCubit extends Cubit<BookingCreateState> {
  BookingCreateCubit(this._repository)
      : super(const BookingCreateState.initial());

  final IBookingRepository _repository;

  Future<void> created(dynamic order) async {
    emit(const BookingCreateState.inProgress());
    final possibleFailure = await _repository.create(order);
    emit(possibleFailure.fold(BookingCreateState.createFailure,
        (_) => const BookingCreateState.createSuccess()));
  }
}
