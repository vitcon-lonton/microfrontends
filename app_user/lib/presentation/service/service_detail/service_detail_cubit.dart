import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:engine/engine.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:service/domain/entities.dart';
import 'package:service/domain/i_repository.dart';

part 'service_detail_cubit.freezed.dart';

@freezed
class ServiceDetailState with _$ServiceDetailState {
  const ServiceDetailState._();

  factory ServiceDetailState({
    @Default(false) bool isLiked,
    @Default(false) bool isSubmitting,
    @Default(false) bool isSubmittingLike,
    @Default(true) bool showErrorMessages,
    @Default(STATUS_IDLE) ProcessingStatus status,
    required Option<Service> detailOption,
  }) = _ServiceDetailState;

  Service? get service {
    return detailOption.foldRight(null, (detail, previous) => detail);
  }

  factory ServiceDetailState.init() => ServiceDetailState(detailOption: none());

  ServiceDetailState busy() => copyWith(status: STATUS_BUSY);
  ServiceDetailState idle() => copyWith(status: STATUS_IDLE);
  ServiceDetailState failed() => copyWith(status: STATUS_FAILED);
  ServiceDetailState complete() => copyWith(status: STATUS_COMPLETE);
}

class ServiceDetailCubit extends Cubit<ServiceDetailState> {
  final IServiceRepository _repository;

  ServiceDetailCubit(this._repository) : super(ServiceDetailState.init());

  Future<void> getDetailRequested() async {
    emit(state.copyWith(isSubmitting: true));

    final detailOption = await _repository.getServiceDetail();

    emit(state.copyWith(detailOption: detailOption));
    emit(state.copyWith(isSubmitting: false));
  }

  Future<void> unlikeRequested() async {
    emit(state.copyWith(isSubmittingLike: true));

    if (!state.isLiked) {
      emit(state.copyWith(isSubmittingLike: false));
      return;
    }

    await _repository.getServiceDetail();
    emit(state.copyWith(isLiked: false));
    emit(state.copyWith(isSubmittingLike: false));
    return;
  }

  Future<void> likeRequested() async {
    emit(state.copyWith(isSubmittingLike: true));

    if (state.isLiked) {
      emit(state.copyWith(isSubmittingLike: false));
      return;
    }

    await _repository.getServiceDetail();
    emit(state.copyWith(isLiked: true));
    emit(state.copyWith(isSubmittingLike: false));
    return;
  }
}
