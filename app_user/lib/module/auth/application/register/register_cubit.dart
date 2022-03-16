/* spell-checker: disable */
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/auth_failure.dart';
import '../../domain/i_auth_facade.dart';
import '../../domain/value_objects.dart';
part 'register_cubit.freezed.dart';

@freezed
class RegisterState with _$RegisterState {
  const RegisterState._();

  factory RegisterState({
    required FullName fullName,
    required Phone phone,
    required Password password,
    required Password confirmPassword,
    EmailAddress? emailAddress,
    @Default(false) bool isSubmitting,
    @Default(false) bool displayPassword,
    @Default(false) bool displayConfirmPassword,
    @Default(true) bool showErrorMessages,
    required Option<Either<AuthFailure, Unit>> failureOrSuccessOption,
  }) = _RegisterState;

  bool get isPasswordMatch {
    final isPasswordValid = password.isValid();
    final isConfirmPasswordValid = confirmPassword.isValid();

    if (!isPasswordValid || !isConfirmPasswordValid) {
      return false;
    }

    final passwordStr = password.getOrCrash();
    final confirmPasswordStr = confirmPassword.getOrCrash();

    return passwordStr == confirmPasswordStr;
  }

  bool get isValid {
    final isPhoneValid = phone.isValid();
    final isfullNameValid = fullName.isValid();
    final isPasswordValid = password.isValid();
    final isEmailValid = emailAddress?.isValid() ?? true;
    final isConfirmPasswordValid = confirmPassword.isValid();

    if (!isfullNameValid ||
        !isPhoneValid ||
        !isEmailValid ||
        !isPasswordValid ||
        !isConfirmPasswordValid ||
        !isPasswordMatch) {
      return false;
    }

    return true;
  }

  factory RegisterState.init() {
    // return RegisterState(
    //   phone: Phone(''),
    //   fullName: FullName(''),
    //   password: Password(''),
    //   confirmPassword: Password(''),
    //   emailAddress: EmailAddress(''),
    //   failureOrSuccessOption: none(),
    // );

    return RegisterState(
      phone: Phone('9999999999'),
      fullName: FullName('9999999999'),
      password: Password('123123123'),
      confirmPassword: Password('123123123'),
      emailAddress: EmailAddress('9999999999@gmail.com'),
      failureOrSuccessOption: none(),
    );

    // return RegisterState(
    //     lastName: Name(''),
    //     firstName: Name(''),
    //     phone: Phone(''),
    //     street: Street(''),
    //     gender: Gender.male,
    //     birthDay: BirthDay(DateTime.now()),
    //     password: Password(''),
    //     confirmPassword: Password(''),
    //     emailAddress: EmailAddress(''),
    //     failureOrSuccessOption: none());
  }
}

// @injectable
class RegisterCubit extends Cubit<RegisterState> {
  final IAuthFacade _authFacade;

  RegisterCubit(this._authFacade) : super(RegisterState.init());

  fullNameChanged(String value) {
    emit(state.copyWith(fullName: FullName(value)));
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

  emailAddressChanged(String value) {
    if (value.isEmpty) {
      return emit(state.copyWith(emailAddress: null));
    } else {
      return emit(state.copyWith(emailAddress: EmailAddress(value)));
    }
  }

  registered() async {
    Either<AuthFailure, Unit> failureOrSuccess =
        const Right<AuthFailure, Unit>(unit);

    if (state.isValid) {
      emit(state.copyWith(isSubmitting: true, failureOrSuccessOption: none()));

      failureOrSuccess = await _performRegister();
    }

    emit(state.copyWith(
      isSubmitting: false,
      showErrorMessages: true,
      failureOrSuccessOption: optionOf(failureOrSuccess),
    ));
  }

  Future<Either<AuthFailure, Unit>> _performRegister() {
    final phone = state.phone;
    final fullName = state.fullName;
    final password = state.password;
    final confirmPassword = state.confirmPassword;
    final emailAddress = state.emailAddress;

    return _authFacade.registerWithEmailAndPassword(
        phone: phone,
        fullName: fullName,
        password: password,
        confirmPassword: confirmPassword,
        emailAddress: emailAddress);
  }
}
