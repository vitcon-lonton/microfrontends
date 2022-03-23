import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/i_rating_repository.dart';
import '../../domain/rating_failure.dart';
part 'rating_form_cubit.freezed.dart';

@freezed
class RatingFormState with _$RatingFormState {
  const RatingFormState._();

  factory RatingFormState(
      {@Default(5.0) double point,
      @Default(false) bool isSubmitting,
      @Default(true) bool showErrorMessages,
      required Option<Either<RatingFailure, Unit>>
          failureOrSuccessOption}) = _RatingFormState;

  factory RatingFormState.init() =>
      RatingFormState(failureOrSuccessOption: none());
}

class RatingFormCubit extends Cubit<RatingFormState> {
  final IRatingRepository _repository;

  RatingFormCubit(this._repository) : super(RatingFormState.init());

  void pointChanged(double value) => emit(state.copyWith(point: value));

  Future<void> submitted() async {
    emit(state.copyWith(isSubmitting: true));
    Either<RatingFailure, Unit> failureOrSuccess = await _performCreate();
    emit(state.copyWith(isSubmitting: false));
    emit(state.copyWith(failureOrSuccessOption: optionOf(failureOrSuccess)));
  }

  Future<Either<RatingFailure, Unit>> _performCreate() {
    return _repository.create(technicianId: 1, point: state.point);
  }
}
