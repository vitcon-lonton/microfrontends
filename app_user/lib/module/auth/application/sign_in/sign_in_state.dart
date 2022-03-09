part of 'sign_in_bloc.dart';

@freezed
class SignInState with _$SignInState {
  const factory SignInState({
    required Phone phone,
    required Password password,
    @Default(false) bool showPassword,
    @Default(false) bool isSubmitting,
    @Default(true) bool showErrorMessages,
    required Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption,
  }) = _SignInState;

  factory SignInState.initial() {
    return SignInState(
      isSubmitting: false,
      showErrorMessages: true,
      phone: Phone('0909090909'),
      password: Password('123123'),
      authFailureOrSuccessOption: none(),
    );

    // ignore: dead_code
    return SignInState(
      phone: Phone(''),
      password: Password(''),
      showErrorMessages: true,
      isSubmitting: false,
      authFailureOrSuccessOption: none(),
    );
    // showErrorMessages: false,
  }
}
