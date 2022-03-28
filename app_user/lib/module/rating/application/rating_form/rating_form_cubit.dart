import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/i_rating_repository.dart';
import '../../domain/rating_failure.dart';
import '../../domain/value_objects.dart';
part 'rating_form_cubit.freezed.dart';

@freezed
class RatingFormState with _$RatingFormState {
  const RatingFormState._();

  factory RatingFormState.init() =>
      RatingFormState(failureOrSuccessOption: none());

  factory RatingFormState(
      {RatingContent? content,
      @Default(5.0) double point,
      @Default(false) bool isSubmitting,
      required Option<Either<RatingFailure, Unit>>
          failureOrSuccessOption}) = _RatingFormState;

  bool get isValid => isContentValid;
  bool get isContentValid => content?.isValid() ?? true;
}

class RatingFormCubit extends Cubit<RatingFormState> {
  RatingFormCubit(this._repository) : super(RatingFormState.init());

  final IRatingRepository _repository;

  Future<void> submitted() async {
    Either<RatingFailure, Unit> failureOrSuccess =
        const Right<RatingFailure, Unit>(unit);

    if (state.isValid) {
      emit(state.copyWith(isSubmitting: true, failureOrSuccessOption: none()));
      failureOrSuccess = await _performCreate();
    }

    emit(state.copyWith(
      isSubmitting: false,
      failureOrSuccessOption: optionOf(failureOrSuccess),
    ));
  }

  Future<Either<RatingFailure, Unit>> _performCreate() {
    return _repository.create(
        technicianId: 24, point: state.point, content: state.content);
  }

  void contentChanged(String value) {
    emit(state.copyWith(content: RatingContent(value)));
  }

  void pointChanged(double value) => emit(state.copyWith(point: value));
}
