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

  factory PasswordUpdateState(
          {required Password password,
          required Password newPassword,
          required Password confirmPassword,
          @Default(false) bool isSubmitting,
          @Default(true) bool showErrorMessages,
          @Default(false) bool displayPassword,
          @Default(false) bool displayNewPassword,
          @Default(false) bool displayConfirmPassword,
          required Option<Either<AuthFailure, Unit>> failureOrSuccessOption}) =
      _PasswordUpdateState;

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
      // password: Password('123456789'),
      newPassword: Password('123456789'),
      confirmPassword: Password('123456789'),
      failureOrSuccessOption: none(),
    );
  }
}

class PasswordUpdateCubit extends Cubit<PasswordUpdateState> {
  final IAuthFacade _authFacade;

  PasswordUpdateCubit(this._authFacade) : super(PasswordUpdateState.init());

  Future<Either<AuthFailure, Unit>> _performUpdate() {
    return _authFacade.updatePassword(
        newPassword: state.newPassword,
        currentPassword: state.password,
        confirmPassword: state.confirmPassword);
  }

  submitted() async {
    Either<AuthFailure, Unit> failureOrSuccess =
        const Right<AuthFailure, Unit>(unit);

    if (state.valid) {
      emit(state.copyWith(isSubmitting: true, failureOrSuccessOption: none()));

      failureOrSuccess = await _performUpdate();
    }

    emit(state.copyWith(
      isSubmitting: false,
      failureOrSuccessOption: optionOf(failureOrSuccess),
    ));
  }

  void passwordChanged(String value) {
    emit(state.copyWith(password: Password(value)));
  }

  void newPasswordChanged(String value) {
    emit(state.copyWith(newPassword: Password(value)));
  }

  void confirmPasswordChanged(String value) {
    emit(state.copyWith(confirmPassword: Password(value)));
  }

  void displayPasswordChanged(bool value) {
    emit(state.copyWith(displayPassword: value));
  }

  void displayNewPasswordChanged(bool value) {
    emit(state.copyWith(displayNewPassword: value));
  }

  void displayConfirmPasswordChanged(bool value) {
    emit(state.copyWith(displayConfirmPassword: value));
  }
}
