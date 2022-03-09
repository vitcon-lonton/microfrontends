import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
class ServiceFailure with _$ServiceFailure {
  const factory ServiceFailure.serverError() = ServerError;
  const factory ServiceFailure.cancelledByUser() = CancelledByUser;
  // const factory ServiceFailure.emailAlreadyInUse() = EmailAlreadyInUse;
  // const factory ServiceFailure.invalidEmailAndPasswordCombination() =
  //     InvalidEmailAndPasswordCombination;
}
