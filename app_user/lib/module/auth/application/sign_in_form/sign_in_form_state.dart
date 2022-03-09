part of 'sign_in_form_bloc.dart';

@freezed
class SignInFormState with _$SignInFormState {
  const factory SignInFormState({
    required Phone phone,
    required Password password,
    @Default(false) bool showPassword,
    @Default(false) bool isSubmitting,
    @Default(true) bool showErrorMessages,
    required Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption,
  }) = _SignInFormState;

  factory SignInFormState.initial() {
    return SignInFormState(
      isSubmitting: false,
      showErrorMessages: true,
      phone: Phone('0909090909'),
      password: Password('123123'),
      authFailureOrSuccessOption: none(),
    );

    // ignore: dead_code
    return SignInFormState(
      phone: Phone(''),
      password: Password(''),
      showErrorMessages: true,
      isSubmitting: false,
      authFailureOrSuccessOption: none(),
    );
    // showErrorMessages: false,
  }
}
