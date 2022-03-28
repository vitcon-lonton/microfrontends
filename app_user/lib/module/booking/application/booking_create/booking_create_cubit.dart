import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/collection.dart';
import 'package:app_user/module/auth/auth.dart';
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

  Future<void> created() async {
    emit(const BookingCreateState.inProgress());
    Either<BookingFailure, Unit> possibleFailure = await _performCreate();
    emit(possibleFailure.fold((failure) {
      return BookingCreateState.createFailure(failure);
    }, (_) => const BookingCreateState.createSuccess()));
  }

  Future<Either<BookingFailure, Unit>> _performCreate() {
    return _repository.create(
        fullName: Name('My Name'),
        servicesId: KtList.of(16, 15),
        phoneNumber: Phone('0372560987'),
        startTime: DateTime.now().add(const Duration(hours: 10)),
        address: 'My Address');
  }
}
