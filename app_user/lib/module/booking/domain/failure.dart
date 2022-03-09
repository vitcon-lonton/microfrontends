import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
class BookingFailure with _$BookingFailure {
  const factory BookingFailure.serverError() = _ServerError;
  const factory BookingFailure.cancelledByUser() = _CancelledByUser;
}
