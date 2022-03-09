part of 'sign_in_bloc.dart';

@freezed
class SignInEvent with _$SignInEvent {
  const factory SignInEvent.phoneChanged(String phoneStr) = PhoneChanged;
  const factory SignInEvent.showPasswordChanged(bool value) =
      ShowPasswordChanged;
  const factory SignInEvent.passwordChanged(String passwordStr) =
      PasswordChanged;
  const factory SignInEvent.signInWithPhoneAndPasswordPressed() =
      SignInWithPhoneAndPasswordPressed;
  const factory SignInEvent.signInWithGooglePressed() = SignInWithGooglePressed;
}
