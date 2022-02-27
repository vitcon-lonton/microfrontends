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
    required Phone phone,
    @Default(false) bool isSubmitting,
    @Default(true) bool showErrorMessages,
    @Default(ProcessingStatus.idle()) ProcessingStatus status,
    required Option<Either<AuthFailure, Unit>> failureOrSuccessOption,
  }) = _ForgetPasswordState;

  bool get valid => true;

  factory ForgetPasswordState.init() {
    return ForgetPasswordState(
      phone: Phone('0372560843'),
      failureOrSuccessOption: none(),
    );
  }

  ForgetPasswordState busy() => copyWith(status: STATUS_BUSY);
  ForgetPasswordState idle() => copyWith(status: STATUS_IDLE);
  ForgetPasswordState failed() => copyWith(status: STATUS_FAILED);
  ForgetPasswordState complete() => copyWith(status: STATUS_COMPLETE);
}

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final IAuthFacade _authFacade;

  ForgetPasswordCubit(this._authFacade) : super(ForgetPasswordState.init());

  submitted() async {
    Either<AuthFailure, Unit> failureOrSuccess =
        const Right<AuthFailure, Unit>(unit);

    final phone = state.phone;
    final isPhoneValid = phone.isValid();

    if (isPhoneValid) {
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

  phoneChanged(String value) => emit(state.copyWith(phone: Phone(value)));
}
