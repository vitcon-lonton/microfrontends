import 'package:freezed_annotation/freezed_annotation.dart';

part 'rating_failure.freezed.dart';

@freezed
class RatingFailure with _$RatingFailure {
  const factory RatingFailure.unexpected() = _Unexpected;
  const factory RatingFailure.unableCreate() = _UnableCreate;
  const factory RatingFailure.unableDelete() = _UnableDelete;
  const factory RatingFailure.unableUpdate() = _UnableUpdate;
}
