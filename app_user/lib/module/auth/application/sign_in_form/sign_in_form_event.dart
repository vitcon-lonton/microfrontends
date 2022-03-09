part of 'sign_in_form_bloc.dart';

@freezed
class SignInFormEvent with _$SignInFormEvent {
  const factory SignInFormEvent.phoneChanged(String phoneStr) = PhoneChanged;
  const factory SignInFormEvent.showPasswordChanged(bool value) =
      ShowPasswordChanged;
  const factory SignInFormEvent.passwordChanged(String passwordStr) =
      PasswordChanged;
  const factory SignInFormEvent.signInWithPhoneAndPasswordPressed() =
      SignInWithPhoneAndPasswordPressed;
  const factory SignInFormEvent.signInWithGooglePressed() =
      SignInWithGooglePressed;
}
