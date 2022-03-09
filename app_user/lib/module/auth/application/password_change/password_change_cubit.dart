import 'package:dartz/dartz.dart';
import 'package:engine/engine.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/auth_failure.dart';
import '../../domain/i_auth_facade.dart';
import '../../domain/value_objects.dart';
part 'password_change_cubit.freezed.dart';

@freezed
class PasswordChangeState with _$PasswordChangeState {
  const PasswordChangeState._();

  factory PasswordChangeState({
    required Phone phone,
    required Password password,
    required Password confirmPassword,
    @Default(false) bool displayPassword,
    @Default(false) bool displayConfirmPassword,
    @Default(false) bool isSubmitting,
    @Default(true) bool showErrorMessages,
    @Default(STATUS_IDLE) ProcessingStatus status,
    required Option<Either<AuthFailure, Unit>> failureOrSuccessOption,
  }) = _PasswordChangeState;

  bool get valid => true;

  factory PasswordChangeState.init() {
    return PasswordChangeState(
      phone: Phone('0372560843'),
      password: Password('123456789'),
      confirmPassword: Password('123456789'),
      failureOrSuccessOption: none(),
    );
  }

  PasswordChangeState busy() => copyWith(status: STATUS_BUSY);
  PasswordChangeState idle() => copyWith(status: STATUS_IDLE);
  PasswordChangeState failed() => copyWith(status: STATUS_FAILED);
  PasswordChangeState complete() => copyWith(status: STATUS_COMPLETE);
}

class PasswordChangeCubit extends Cubit<PasswordChangeState> {
  final IAuthFacade _authFacade;

  PasswordChangeCubit(this._authFacade) : super(PasswordChangeState.init());

  submitted() async {
    Either<AuthFailure, Unit> failureOrSuccess =
        const Right<AuthFailure, Unit>(unit);

    final phone = state.phone;
    final password = state.password;
    final confirmPassword = state.confirmPassword;
    final isPhoneValid = phone.isValid();
    final isPasswordValid = password.isValid();
    final isConfirmPasswordValid = confirmPassword.isValid();
    final passwordStr = password.getOrCrash();
    final confirmPasswordStr = confirmPassword.getOrCrash();
    final isMatch = passwordStr.compareTo(confirmPasswordStr) == 0;

    if (isPhoneValid && isPasswordValid && isConfirmPasswordValid && isMatch) {
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

  phoneChanged(String value) {
    emit(state.copyWith(phone: Phone(value)));
  }

  passwordChanged(String value) {
    emit(state.copyWith(password: Password(value)));
  }

  confirmPasswordChanged(String value) {
    emit(state.copyWith(confirmPassword: Password(value)));
  }

  displayPasswordChanged(bool value) {
    emit(state.copyWith(displayPassword: value));
  }

  displayConfirmPasswordChanged(bool value) {
    emit(state.copyWith(displayConfirmPassword: value));
  }
}
