import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking_failure.freezed.dart';

@freezed
class BookingFailure with _$BookingFailure {
  const factory BookingFailure.unexpected() = _Unexpected;
  const factory BookingFailure.unableCreate() = _UnableCreate;
  const factory BookingFailure.unableDelete() = _UnableDelete;
  const factory BookingFailure.unableUpdate() = _UnableUpdate;
}
