import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:auth/domain/auth_failure.dart';
import 'package:auth/domain/i_auth_facade.dart';
import 'package:auth/domain/value_objects.dart';

part 'sign_in_form_bloc.freezed.dart';
part 'sign_in_form_event.dart';
part 'sign_in_form_state.dart';

// @injectable
class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  final IAuthFacade _authFacade;

  // SignInFormBloc(this._authFacade) : super(SignInFormState.initial());
  SignInFormBloc(this._authFacade) : super(SignInFormState.initial()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<SignInWithGooglePressed>(_onSignInWithGooglePressed);
    on<RegisterWithEmailAndPasswordPressed>(
        _onRegisterWithEmailAndPasswordPressed);
    on<SignInWithEmailAndPasswordPressed>(_onSignInWithEmailAndPasswordPressed);
  }

  void _onEmailChanged(EmailChanged event, Emitter<SignInFormState> emit) {
    emit(state.copyWith(
      emailAddress: EmailAddress(event.emailStr),
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

  void _onRegisterWithEmailAndPasswordPressed(
      RegisterWithEmailAndPasswordPressed event,
      Emitter<SignInFormState> emit) {
    _performActionOnAuthFacadeWithEmailAndPassword(
      _authFacade.registerWithEmailAndPassword,
    );
  }

  void _onSignInWithEmailAndPasswordPressed(
      SignInWithEmailAndPasswordPressed event, Emitter<SignInFormState> emit) {
    _performActionOnAuthFacadeWithEmailAndPassword(
      _authFacade.signInWithEmailAndPassword,
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

  Stream<SignInFormState> _performActionOnAuthFacadeWithEmailAndPassword(
    Future<Either<AuthFailure, Unit>> Function({
      required EmailAddress emailAddress,
      required Password password,
    })
        forwardedCall,
  ) async* {
    Either<AuthFailure, Unit> failureOrSuccess =
        const Right<AuthFailure, Unit>(unit);

    final isEmailValid = state.emailAddress.isValid();
    final isPasswordValid = state.password.isValid();

    if (isEmailValid && isPasswordValid) {
      emit(state.copyWith(
        isSubmitting: true,
        authFailureOrSuccessOption: none(),
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
      authFailureOrSuccessOption: optionOf(failureOrSuccess),
    ));

    // yield state.copyWith(
    //   isSubmitting: false,
    //   showErrorMessages: true,
    //   authFailureOrSuccessOption: optionOf(failureOrSuccess),
    // );
  }
}


// @override
// Stream<SignInFormState> mapEventToState(
//   SignInFormEvent event,
// ) async* {
//   yield* event.map(
//     emailChanged: (e) async* {
//       yield state.copyWith(
//         emailAddress: EmailAddress(e.emailStr),
//         authFailureOrSuccessOption: none(),
//       );
//     },
//     passwordChanged: (e) async* {
//       yield state.copyWith(
//         password: Password(e.passwordStr),
//         authFailureOrSuccessOption: none(),
//       );
//     },
//     registerWithEmailAndPasswordPressed: (e) async* {
//       yield* _performActionOnAuthFacadeWithEmailAndPassword(
//         _authFacade.registerWithEmailAndPassword,
//       );
//     },
//     signInWithEmailAndPasswordPressed: (e) async* {
//       yield* _performActionOnAuthFacadeWithEmailAndPassword(
//         _authFacade.signInWithEmailAndPassword,
//       );
//     },
//     signInWithGooglePressed: (e) async* {
//       yield state.copyWith(
//         isSubmitting: true,
//         authFailureOrSuccessOption: none(),
//       );
//       final failureOrSuccess = await _authFacade.signInWithGoogle();
//       yield state.copyWith(
//         isSubmitting: false,
//         authFailureOrSuccessOption: some(failureOrSuccess),
//       );
//     },
//   );
// }
