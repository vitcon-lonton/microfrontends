import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:engine/engine.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:service/domain/entities.dart';
import 'package:service/domain/failure.dart';
import 'package:service/domain/i_repository.dart';

part 'service_detail_cubit.freezed.dart';

@freezed
class ServiceDetailState with _$ServiceDetailState {
  const ServiceDetailState._();

  factory ServiceDetailState({
    Service? service,
    @Default(false) bool isSubmitting,
    @Default(true) bool showErrorMessages,
    @Default(ProcessingStatus.idle()) ProcessingStatus status,
    required Option<Either<ServiceFailure, Service>>
        getDetailFailureOrSuccessOption,
  }) = _ServiceDetailState;

  factory ServiceDetailState.init() {
    return ServiceDetailState(getDetailFailureOrSuccessOption: none());
  }

  ServiceDetailState busy() => copyWith(status: STATUS_BUSY);

  ServiceDetailState idle() => copyWith(status: STATUS_IDLE);

  ServiceDetailState failed() {
    return copyWith(status: STATUS_FAILED);
  }

  ServiceDetailState complete() {
    return copyWith(status: STATUS_COMPLETE);
  }
}

class ServiceDetailCubit extends Cubit<ServiceDetailState> {
  final IServiceRepository _repository;

  ServiceDetailCubit(this._repository) : super(ServiceDetailState.init());

  getDetailRequested() async {
    emit(state.busy().copyWith(getDetailFailureOrSuccessOption: none()));

    final failureOrSuccess = await _repository.getServiceDetail();

    emit(failureOrSuccess.fold((failure) => state.failed(), (service) {
      return state.idle().copyWith(service: service);
    }));
  }
}
