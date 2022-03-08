import 'package:dartz/dartz.dart';
import 'package:engine/engine.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:app_user/auth/domain/auth_failure.dart';
import 'package:app_user/auth/domain/i_auth_facade.dart';
import 'package:app_user/auth/domain/value_objects.dart';
part 'password_forget_cubit.freezed.dart';

@freezed
class PasswordForgetState with _$PasswordForgetState {
  const PasswordForgetState._();

  factory PasswordForgetState({
    required Phone phone,
    @Default(false) bool isSubmitting,
    @Default(true) bool showErrorMessages,
    @Default(ProcessingStatus.idle()) ProcessingStatus status,
    required Option<Either<AuthFailure, Unit>> failureOrSuccessOption,
  }) = _PasswordForgetState;

  bool get valid => true;

  factory PasswordForgetState.init() {
    return PasswordForgetState(
      phone: Phone('0372560843'),
      failureOrSuccessOption: none(),
    );
  }

  PasswordForgetState busy() => copyWith(status: STATUS_BUSY);
  PasswordForgetState idle() => copyWith(status: STATUS_IDLE);
  PasswordForgetState failed() => copyWith(status: STATUS_FAILED);
  PasswordForgetState complete() => copyWith(status: STATUS_COMPLETE);
}

class PasswordForgetCubit extends Cubit<PasswordForgetState> {
  final IAuthFacade _authFacade;

  PasswordForgetCubit(this._authFacade) : super(PasswordForgetState.init());

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
