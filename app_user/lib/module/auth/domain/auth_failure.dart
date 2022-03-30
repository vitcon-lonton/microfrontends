import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_failure.freezed.dart';

@freezed
class AuthFailure with _$AuthFailure {
  const factory AuthFailure.unexpected() = _Unexpected;
  const factory AuthFailure.serverError() = _ServerError;
  const factory AuthFailure.cancelledByUser() = _CancelledByUser;
  const factory AuthFailure.emailAlreadyInUse() = _EmailAlreadyInUse;
  const factory AuthFailure.unableSignIn(List<String> errors) = _UnableSignIn;
  const factory AuthFailure.unableRegister(List<String> errors) =
      _UnableRegister;
  const factory AuthFailure.unableUpdatePassword(List<String> errors) =
      _UnableUpdatePassword;
  const factory AuthFailure.unableUpdate(List<String> errors) = _UnableUpdate;
}
