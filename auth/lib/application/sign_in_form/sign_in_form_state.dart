part of 'sign_in_form_bloc.dart';

@freezed
class SignInFormState with _$SignInFormState {
  const factory SignInFormState({
    required Phone phone,
    required Password password,
    required EmailAddress emailAddress,
    @Default(false) bool showPassword,
    @Default(false) bool isSubmitting,
    @Default(true) bool showErrorMessages,
    required Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption,
  }) = _SignInFormState;

  factory SignInFormState.initial() {
    return SignInFormState(
      phone: Phone(''),
      password: Password(''),
      emailAddress: EmailAddress(''),
      showErrorMessages: true,
      isSubmitting: false,
      authFailureOrSuccessOption: none(),
    );
    // showErrorMessages: false,
  }
}
