import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:engine/engine.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:service/domain/entities.dart';
import 'package:service/domain/failure.dart';
import 'package:service/domain/i_repository.dart';
import 'package:service/service.dart';

part 'service_booking_cubit.freezed.dart';

@freezed
class ServiceBookingState with _$ServiceBookingState {
  const ServiceBookingState._();

  factory ServiceBookingState({
    Service? service,
    required Note note,
    required Street street,
    required DateTime date,
    required DateTime time,
    @Default(false) bool isSubmitting,
    @Default(true) bool showErrorMessages,
    @Default(ProcessingStatus.idle()) ProcessingStatus status,
    required Option<Either<ServiceFailure, Unit>> bookingFailureOrSuccessOption,
  }) = _ServiceBookingState;

  //     DateTime date = ;
  // DateTime time = DateTime(2016, 5, 10, 22, 35);
  factory ServiceBookingState.init() {
    return ServiceBookingState(
      note: Note(''),
      street: Street(''),
      date: DateTime(2016, 10, 26),
      time: DateTime(2016, 5, 10, 22, 35),
      bookingFailureOrSuccessOption: none(),
    );
  }

  ServiceBookingState busy() => copyWith(status: const ProcessingStatus.busy());
  ServiceBookingState idle() => copyWith(status: const ProcessingStatus.idle());
  ServiceBookingState failed() =>
      copyWith(status: const ProcessingStatus.failed());
  ServiceBookingState complete() =>
      copyWith(status: const ProcessingStatus.complete());
}

class ServiceBookingCubit extends Cubit<ServiceBookingState> {
  final IServiceRepository _repository;

  ServiceBookingCubit(this._repository) : super(ServiceBookingState.init());

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
}
