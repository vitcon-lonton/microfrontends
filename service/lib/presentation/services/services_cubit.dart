import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:engine/engine.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:service/domain/entities.dart';
import 'package:service/domain/failure.dart';
import 'package:service/domain/i_repository.dart';

part 'services_cubit.freezed.dart';

@freezed
class ServicesState with _$ServicesState {
  const ServicesState._();

  factory ServicesState({
    @Default(false) bool isSubmitting,
    @Default(true) bool showErrorMessages,
    @Default(<Service>[]) List<Service> services,
    @Default(ProcessingStatus.idle()) ProcessingStatus status,
    required Option<Either<ServiceFailure, List<Service>>>
        getCategoriesFailureOrSuccessOption,
  }) = _ServicesState;

  factory ServicesState.init() {
    return ServicesState(getCategoriesFailureOrSuccessOption: none());
  }

  ServicesState busy() => copyWith(status: STATUS_BUSY);
  ServicesState idle() => copyWith(status: STATUS_IDLE);
  ServicesState failed() => copyWith(status: STATUS_FAILED);
  ServicesState complete() {
    return copyWith(status: STATUS_COMPLETE);
  }
}

class ServicesCubit extends Cubit<ServicesState> {
  final IServiceRepository _repository;

  ServicesCubit(this._repository) : super(ServicesState.init());

  getAllServices() async {
    emit(state.busy().copyWith(getCategoriesFailureOrSuccessOption: none()));

    final failureOrSuccess = await _repository.getServices();

    emit(failureOrSuccess.fold((failure) {
      return state.failed();
    }, (services) => state.idle().copyWith(services: services)));
  }
}
