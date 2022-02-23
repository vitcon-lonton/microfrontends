import 'package:dartz/dartz.dart';
import 'package:engine/engine.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:auth/domain/auth_failure.dart';
import 'package:auth/domain/i_auth_facade.dart';
import 'package:auth/domain/value_objects.dart';

part 'register_cubit.freezed.dart';

@freezed
class RegisterState with _$RegisterState {
  const RegisterState._();

  factory RegisterState({
    required EmailAddress emailAddress,
    required Password password,
    required Password confirmPassword,
    @Default(false) bool remember,
    @Default(false) bool isSubmitting,
    @Default(false) bool displayPassword,
    @Default(true) bool showErrorMessages,
    @Default(ProcessingStatus.idle()) ProcessingStatus status,
    required Option<Either<AuthFailure, Unit>> registerFailureOrSuccessOption,
  }) = _RegisterState;

  bool get valid => true;

  // bool get showErrorMessages => true;

  factory RegisterState.init() {
    return RegisterState(
        emailAddress: EmailAddress(''),
        password: Password(''),
        confirmPassword: Password(''),
        registerFailureOrSuccessOption: none());
  }

  RegisterState busy() => copyWith(status: const ProcessingStatus.busy());
  RegisterState idle() => copyWith(status: const ProcessingStatus.idle());
  RegisterState failed() => copyWith(status: const ProcessingStatus.failed());
  RegisterState complete() {
    return copyWith(status: const ProcessingStatus.complete());
  }
}

// @injectable
class RegisterCubit extends Cubit<RegisterState> {
  // ignore: unused_field
  final IAuthFacade _authFacade;

  RegisterCubit(this._authFacade) : super(RegisterState.init());

  rememberChanged(bool value) {
    emit(state.copyWith(remember: value));
  }

  emailAddressChanged(String value) {
    emit(state.copyWith(emailAddress: EmailAddress(value)));
  }

  passwordChanged(String value) {
    emit(state.copyWith(password: Password(value)));
  }

  displayPasswordChanged(bool value) {
    emit(state.copyWith(displayPassword: value));
  }

  submitted() async {
    emit(state.busy());
    await Future.delayed(const Duration(seconds: 1));
    emit(state.complete());
  }

  // ignore: unused_element
  _performActionOnAuthFacadeWithEmailAndPassword(
      Future<Either<AuthFailure, Unit>> Function(
              {required EmailAddress emailAddress, required Password password})
          forwardedCall) async {
    Either<AuthFailure, Unit> failureOrSuccess =
        const Right<AuthFailure, Unit>(unit);

    final isPasswordValid = state.password.isValid();
    final isEmailValid = state.emailAddress.isValid();

    if (isEmailValid && isPasswordValid) {
      emit(state.copyWith(
        isSubmitting: true,
        registerFailureOrSuccessOption: none(),
      ));
      // yield state.copyWith(
      //   isSubmitting: true,
      //   authFailureOrSuccessOption: none(),
      // );

      failureOrSuccess = await forwardedCall(
        emailAddress: state.emailAddress,
        password: state.password,
      );
    }

    emit(state.copyWith(
      isSubmitting: false,
      showErrorMessages: true,
      registerFailureOrSuccessOption: optionOf(failureOrSuccess),
    ));

    // yield state.copyWith(
    //   isSubmitting: false,
    //   showErrorMessages: true,
    //   authFailureOrSuccessOption: optionOf(failureOrSuccess),
    // );
  }
}


// facebookSubmitted() async {
//   emit(state.busy());
//   emit((await _loginFacebook(NoParams())).fold((credential) {
//     return state.complete();
//   }, (f) => state.failed()));
// }

// googleSubmitted() async {
//   emit(state.busy());
//   emit((await _loginGoogle(NoParams())).fold((credential) {
//     return state.complete();
//   }, (f) => state.failed()));
// }

// appleSubmitted() async {
//   emit(state.busy());
//   emit((await _loginApple(NoParams())).fold((credential) {
//     return state.complete();
//   }, (f) => state.failed()));
// }