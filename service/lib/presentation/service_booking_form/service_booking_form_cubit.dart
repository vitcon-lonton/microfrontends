import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:engine/engine.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:service/domain/entities.dart';
import 'package:service/domain/failure.dart';
import 'package:service/domain/i_repository.dart';
import 'package:service/domain/value_objects.dart';

part 'service_booking_form_cubit.freezed.dart';

@freezed
class ServiceBookingFormState with _$ServiceBookingFormState {
  const ServiceBookingFormState._();

  factory ServiceBookingFormState({
    Service? service,
    required Note note,
    required Street street,
    required DateTime date,
    required DateTime time,
    @Default(false) bool isSubmitting,
    @Default(true) bool showErrorMessages,
    @Default(ProcessingStatus.idle()) ProcessingStatus status,
    required Option<Either<ServiceFailure, Unit>> bookingFailureOrSuccessOption,
  }) = _ServiceBookingFormState;

  factory ServiceBookingFormState.init() {
    return ServiceBookingFormState(
      note: Note(''),
      street: Street(''),
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

  dateChanged(DateTime value) => emit(state.copyWith(date: value));

  timeChanged(DateTime value) => emit(state.copyWith(time: value));

  noteChanged(String value) => emit(state.copyWith(note: Note(value)));

  streetChanged(String value) => emit(state.copyWith(street: Street(value)));

  getDetailRequested() async {
    emit(state.busy().copyWith(bookingFailureOrSuccessOption: none()));

    final failureOrSuccess = await _repository.getServiceDetail();

    emit(failureOrSuccess.fold((failure) {
      return state.failed();
    }, (service) => state.idle().copyWith(service: service)));
  }

  submitted() async {
    emit(state.busy().copyWith(bookingFailureOrSuccessOption: none()));

    final failureOrSuccess = await _repository.book(state.service!);

    emit(failureOrSuccess.fold((failure) {
      return state.failed();
    }, (success) => state.idle()));

    emit(state.copyWith(
      bookingFailureOrSuccessOption: optionOf(failureOrSuccess),
    ));
  }
}
