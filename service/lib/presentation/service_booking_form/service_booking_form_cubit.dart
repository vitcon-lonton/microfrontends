import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:engine/engine.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:service/domain/entities.dart';
import 'package:service/domain/failure.dart';
import 'package:service/domain/i_repository.dart';

part 'service_booking_form_cubit.freezed.dart';

@freezed
class ServiceBookingFormState with _$ServiceBookingFormState {
  const ServiceBookingFormState._();

  factory ServiceBookingFormState({
    Service? service,
    required DateTime date,
    required DateTime time,
    @Default(false) bool isSubmitting,
    @Default(true) bool showErrorMessages,
    @Default(STATUS_IDLE) ProcessingStatus status,
    required Option<Either<ServiceFailure, Unit>> bookingFailureOrSuccessOption,
  }) = _ServiceBookingFormState;

  factory ServiceBookingFormState.init() {
    return ServiceBookingFormState(
      date: DateTime(2016, 10, 26),
      time: DateTime(2016, 5, 10, 22, 35),
      bookingFailureOrSuccessOption: none(),
    );
  }

  ServiceBookingFormState busy() => copyWith(status: STATUS_BUSY);
  ServiceBookingFormState idle() => copyWith(status: STATUS_IDLE);
  ServiceBookingFormState failed() => copyWith(status: STATUS_FAILED);
  ServiceBookingFormState complete() => copyWith(status: STATUS_COMPLETE);
}

class ServiceBookingFormCubit extends Cubit<ServiceBookingFormState> {
  final IServiceRepository _repository;

  ServiceBookingFormCubit(this._repository)
      : super(ServiceBookingFormState.init());

  void dateChanged(DateTime value) => emit(state.copyWith(date: value));

  void timeChanged(DateTime value) => emit(state.copyWith(time: value));

  void serviceChanged(Service? value) => emit(state.copyWith(service: value));

  Future<void> submitted() async {
    emit(state.copyWith(isSubmitting: true));
    emit(state.copyWith(bookingFailureOrSuccessOption: none()));

    if (state.service == null) {
      emit(state.copyWith(isSubmitting: false));
      return;
    }

    final failureOrSuccess = await _repository.book(state.service!);
    emit(state.copyWith(isSubmitting: false));
    emit(state.copyWith(
      bookingFailureOrSuccessOption: optionOf(failureOrSuccess),
    ));

    return;
  }
}
