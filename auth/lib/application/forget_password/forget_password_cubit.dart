import 'package:dartz/dartz.dart';
import 'package:engine/engine.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:auth/domain/auth_failure.dart';
import 'package:auth/domain/i_auth_facade.dart';
import 'package:auth/domain/value_objects.dart';

part 'forget_password_cubit.freezed.dart';

@freezed
class ForgetPasswordState with _$ForgetPasswordState {
  const ForgetPasswordState._();

  factory ForgetPasswordState({
    required EmailAddress emailAddress,
    @Default(false) bool isSubmitting,
    @Default(true) bool showErrorMessages,
    @Default(ProcessingStatus.idle()) ProcessingStatus status,
    required Option<Either<AuthFailure, Unit>> failureOrSuccessOption,
  }) = _ForgetPasswordState;

  bool get valid => true;

  // bool get showErrorMessages => true;

  factory ForgetPasswordState.init() {
    return ForgetPasswordState(
        emailAddress: EmailAddress(''), failureOrSuccessOption: none());
  }

  ForgetPasswordState busy() => copyWith(status: const ProcessingStatus.busy());
  ForgetPasswordState idle() => copyWith(status: const ProcessingStatus.idle());
  ForgetPasswordState failed() {
    return copyWith(status: const ProcessingStatus.failed());
  }

  ForgetPasswordState complete() {
    return copyWith(status: const ProcessingStatus.complete());
  }
}

// @injectable
class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final IAuthFacade _authFacade;

  ForgetPasswordCubit(this._authFacade) : super(ForgetPasswordState.init());

  emailAddressChanged(String value) {
    emit(state.copyWith(emailAddress: EmailAddress(value)));
  }

  submitted() async {
    emit(
      state.busy().copyWith(isSubmitting: true, failureOrSuccessOption: none()),
    );

    final emailAddress = state.emailAddress;
    final isEmailValid = emailAddress.isValid();

    if (!isEmailValid) {
      emit(state
          .failed()
          .copyWith(isSubmitting: false, failureOrSuccessOption: none()));

      return;
    }

    final phone = Phone('0372560843');
    final failureOrSuccess = await _authFacade.forgetPassword(phone: phone);

    emit(state.complete().copyWith(
        isSubmitting: false,
        failureOrSuccessOption: optionOf(failureOrSuccess)));
  }
}
