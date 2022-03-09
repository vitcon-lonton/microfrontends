import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:app_user/core/core.dart';
import '../../domain/auth_failure.dart';
import '../../domain/i_auth_facade.dart';
import '../../domain/value_objects.dart';

part 'password_update_cubit.freezed.dart';

@freezed
class PasswordUpdateState with _$PasswordUpdateState {
  const PasswordUpdateState._();

  factory PasswordUpdateState({
    required Password password,
    required Password newPassword,
    required Password confirmPassword,
    @Default(false) bool isSubmitting,
    @Default(true) bool showErrorMessages,
    @Default(false) bool displayPassword,
    @Default(false) bool displayNewPassword,
    @Default(false) bool displayConfirmPassword,
    @Default(STATUS_IDLE) ProcessingStatus status,
    required Option<Either<AuthFailure, Unit>> failureOrSuccessOption,
  }) = _PasswordUpdateState;

  bool get valid {
    final isPasswordValid = password.isValid();
    final isNewPasswordValid = newPassword.isValid();
    final isConfirmPasswordValid = confirmPassword.isValid();
    if (!isPasswordValid || !isNewPasswordValid || !isConfirmPasswordValid) {
      return false;
    }

    final newPasswordStr = newPassword.getOrCrash();
    final confirmPasswordStr = confirmPassword.getOrCrash();
    final isMatch = newPasswordStr.compareTo(confirmPasswordStr) == 0;
    if (!isMatch) return false;

    return true;
  }

  factory PasswordUpdateState.init() {
    // return PasswordUpdateState(
    //   password: Password(''),
    //   newPassword: Password(''),
    //   confirmPassword: Password(''),
    //   failureOrSuccessOption: none(),
    // );
    return PasswordUpdateState(
      password: Password('123456789'),
      newPassword: Password('123456789'),
      confirmPassword: Password('123456789'),
      failureOrSuccessOption: none(),
    );
  }

  PasswordUpdateState busy() => copyWith(status: STATUS_BUSY);
  PasswordUpdateState idle() => copyWith(status: STATUS_IDLE);
  PasswordUpdateState failed() => copyWith(status: STATUS_FAILED);
  PasswordUpdateState complete() => copyWith(status: STATUS_COMPLETE);
}

class PasswordUpdateCubit extends Cubit<PasswordUpdateState> {
  final IAuthFacade _authFacade;

  PasswordUpdateCubit(this._authFacade) : super(PasswordUpdateState.init());

  submitted() async {
    Either<AuthFailure, Unit> failureOrSuccess =
        const Right<AuthFailure, Unit>(unit);

    final isValid = state.valid;
    final phone = Phone('9999999999');
    // final password = state.password;
    // final newPassword = state.newPassword;
    // final confirmPassword = state.confirmPassword;
    // final isPhoneValid = phone.isValid();
    // final isPasswordValid = password.isValid();
    // final isNewPasswordValid = newPassword.isValid();
    // final isConfirmPasswordValid = confirmPassword.isValid();
    // final passwordStr = password.getOrCrash();
    // final confirmPasswordStr = confirmPassword.getOrCrash();
    // final isMatch = passwordStr.compareTo(confirmPasswordStr) == 0;

    if (isValid) {
      emit(state.busy());
      emit(state.copyWith(isSubmitting: true, failureOrSuccessOption: none()));

      failureOrSuccess = await _authFacade.forgetPassword(phone: phone);
    }

    emit(state.idle());
    emit(state.copyWith(
      isSubmitting: false,
      showErrorMessages: true,
      failureOrSuccessOption: optionOf(failureOrSuccess),
    ));
  }

  passwordChanged(String value) {
    emit(state.copyWith(password: Password(value)));
  }

  newPasswordChanged(String value) {
    emit(state.copyWith(newPassword: Password(value)));
  }

  confirmPasswordChanged(String value) {
    emit(state.copyWith(confirmPassword: Password(value)));
  }

  displayPasswordChanged(bool value) {
    emit(state.copyWith(displayPassword: value));
  }

  displayNewPasswordChanged(bool value) {
    emit(state.copyWith(displayNewPassword: value));
  }

  displayConfirmPasswordChanged(bool value) {
    emit(state.copyWith(displayConfirmPassword: value));
  }
}
