// ignore_for_file: invalid_use_of_visible_for_testing_member
import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/auth_failure.dart';
import '../../domain/i_auth_facade.dart';
import '../../domain/value_objects.dart';

part 'sign_in_form_bloc.freezed.dart';
part 'sign_in_form_event.dart';
part 'sign_in_form_state.dart';

class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  final IAuthFacade _authFacade;

  SignInFormBloc(this._authFacade) : super(SignInFormState.initial()) {
    on<PhoneChanged>(_onPhoneChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<ShowPasswordChanged>(_onShowPasswordChanged);
    on<SignInWithGooglePressed>(_onSignInWithGooglePressed);
    on<SignInWithPhoneAndPasswordPressed>(_onSignInWithPhoneAndPasswordPressed);
  }

  void _onPhoneChanged(PhoneChanged event, Emitter<SignInFormState> emit) {
    emit(state.copyWith(
      phone: Phone(event.phoneStr),
      authFailureOrSuccessOption: none(),
    ));
  }

  void _onPasswordChanged(
      PasswordChanged event, Emitter<SignInFormState> emit) {
    emit(state.copyWith(
      password: Password(event.passwordStr),
      authFailureOrSuccessOption: none(),
    ));
  }

  void _onShowPasswordChanged(
      ShowPasswordChanged event, Emitter<SignInFormState> emit) {
    emit(state.copyWith(showPassword: event.value));
  }

  void _onSignInWithPhoneAndPasswordPressed(
      SignInWithPhoneAndPasswordPressed event, Emitter<SignInFormState> emit) {
    _performActionOnAuthFacadeWithPhoneAndPassword(
      _authFacade.signInWithPhoneAndPassword,
    );
  }

  Future<void> _onSignInWithGooglePressed(
      SignInWithGooglePressed event, Emitter<SignInFormState> emit) async {
    emit(state.copyWith(
      isSubmitting: true,
      authFailureOrSuccessOption: none(),
    ));

    final failureOrSuccess = await _authFacade.signInWithGoogle();
    emit(state.copyWith(
      isSubmitting: false,
      authFailureOrSuccessOption: some(failureOrSuccess),
    ));
  }

  _performActionOnAuthFacadeWithPhoneAndPassword(
      Future<Either<AuthFailure, Unit>> Function(
              {required Phone phone, required Password password})
          forwardedCall) async {
    Either<AuthFailure, Unit> failureOrSuccess =
        const Right<AuthFailure, Unit>(unit);

    final isPhoneValid = state.phone.isValid();
    final isPasswordValid = state.password.isValid();

    if (isPhoneValid && isPasswordValid) {
      emit(state.copyWith(
        isSubmitting: true,
        authFailureOrSuccessOption: none(),
      ));

      failureOrSuccess = await forwardedCall(
        phone: state.phone,
        password: state.password,
      );
    }

    emit(state.copyWith(
      isSubmitting: false,
      showErrorMessages: true,
      authFailureOrSuccessOption: optionOf(failureOrSuccess),
    ));
  }

  // void _onRegisterWithEmailAndPasswordPressed(
  //     RegisterWithEmailAndPasswordPressed event,
  //     Emitter<SignInFormState> emit) {
  //   _performActionOnAuthFacadeWithPhoneAndPassword(
  //     _authFacade.registerWithEmailAndPassword,
  //   );
  // }
}
