import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities.dart';
import '../../domain/failure.dart';
import '../../domain/i_service_repository.dart';
part 'service_checking_cubit.freezed.dart';

@freezed
class ServiceCheckingState with _$ServiceCheckingState {
  const ServiceCheckingState._();

  factory ServiceCheckingState({
    Service? service,
    required DateTime date,
    required DateTime time,
    @Default(false) bool isSubmitting,
    @Default(true) bool showErrorMessages,
    required Option<Either<ServiceFailure, Unit>> failureOrSuccessOption,
  }) = _ServiceCheckingState;

  factory ServiceCheckingState.init() {
    return ServiceCheckingState(
      date: DateTime(2016, 10, 26),
      time: DateTime(2016, 5, 10, 22, 35),
      failureOrSuccessOption: none(),
    );
  }
}

class ServiceCheckingCubit extends Cubit<ServiceCheckingState> {
  final IServiceRepository _repository;

  ServiceCheckingCubit(this._repository) : super(ServiceCheckingState.init());

  void dateChanged(DateTime value) => emit(state.copyWith(date: value));

  void timeChanged(DateTime value) => emit(state.copyWith(time: value));

  void serviceChanged(Service? value) => emit(state.copyWith(service: value));

  Future<void> checkingRequested() async {
    emit(state.copyWith(isSubmitting: true));
    emit(state.copyWith(failureOrSuccessOption: none()));

    if (state.service == null) {
      emit(state.copyWith(isSubmitting: false));
      return;
    }

    final failureOrSuccess = await _repository.check(state.service!);
    emit(state.copyWith(isSubmitting: false));
    emit(state.copyWith(failureOrSuccessOption: optionOf(failureOrSuccess)));

    return;
  }
}
