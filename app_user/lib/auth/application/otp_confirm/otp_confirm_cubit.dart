import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:app_user/auth/domain/auth_failure.dart';
import 'package:app_user/auth/domain/i_auth_facade.dart';
import 'package:app_user/auth/domain/value_objects.dart';

part 'otp_confirm_cubit.freezed.dart';

@freezed
class OtpConfirmState with _$OtpConfirmState {
  const OtpConfirmState._();

  factory OtpConfirmState({
    required Phone phone,
    @Default(false) bool isSubmitting,
    @Default(true) bool showErrorMessages,
    required Option<Either<AuthFailure, Unit>> failureOrSuccessOption,
  }) = _OtpConfirmState;

  bool get valid => true;

  factory OtpConfirmState.init() {
    return OtpConfirmState(
      phone: Phone('0372560843'),
      failureOrSuccessOption: none(),
    );
  }
}

class OtpConfirmCubit extends Cubit<OtpConfirmState> {
  final IAuthFacade _authFacade;

  OtpConfirmCubit(this._authFacade) : super(OtpConfirmState.init());

  submitted() async {
    Either<AuthFailure, Unit> failureOrSuccess =
        const Right<AuthFailure, Unit>(unit);

    final phone = state.phone;
    final isPhoneValid = phone.isValid();

    if (isPhoneValid) {
      emit(state.copyWith(isSubmitting: true, failureOrSuccessOption: none()));

      failureOrSuccess = await _authFacade.forgetPassword(phone: phone);
    }

    emit(state.copyWith(
      isSubmitting: false,
      failureOrSuccessOption: optionOf(failureOrSuccess),
    ));
  }

  newOtpRequested() async {
    Either<AuthFailure, Unit> failureOrSuccess =
        const Right<AuthFailure, Unit>(unit);

    final phone = state.phone;
    final isPhoneValid = phone.isValid();

    if (isPhoneValid) {
      emit(state.copyWith(isSubmitting: true, failureOrSuccessOption: none()));

      failureOrSuccess = await _authFacade.forgetPassword(phone: phone);
    }

    emit(state.copyWith(
      isSubmitting: false,
      failureOrSuccessOption: optionOf(failureOrSuccess),
    ));
  }

  phoneChanged(String value) => emit(state.copyWith(phone: Phone(value)));
}
