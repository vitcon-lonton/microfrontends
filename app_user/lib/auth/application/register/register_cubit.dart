import 'package:dartz/dartz.dart';
import 'package:engine/engine.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:app_user/auth/domain/auth_failure.dart';
import 'package:app_user/auth/domain/i_auth_facade.dart';
import 'package:app_user/auth/domain/user.dart';
import 'package:app_user/auth/domain/value_objects.dart';
part 'register_cubit.freezed.dart';

@freezed
class RegisterState with _$RegisterState {
  const RegisterState._();

  factory RegisterState({
    required Name name,
    required Phone phone,
    required Street street,
    required Gender gender,
    required BirthDay birthDay,
    required Password password,
    required Password confirmPassword,
    required EmailAddress emailAddress,
    @Default(false) bool isSubmitting,
    @Default(false) bool displayPassword,
    @Default(false) bool displayConfirmPassword,
    @Default(true) bool showErrorMessages,
    @Default(STATUS_IDLE) ProcessingStatus status,
    required Option<Either<AuthFailure, Unit>> registerFailureOrSuccessOption,
  }) = _RegisterState;

  bool get valid => true;

  // bool get showErrorMessages => true;

  factory RegisterState.init() {
    return RegisterState(
      name: Name('First'),
      phone: Phone('9999999999'),
      gender: Gender.male,
      birthDay: BirthDay(DateTime.now()),
      password: Password('123456789'),
      confirmPassword: Password('123456789'),
      emailAddress: EmailAddress('9999999999@gmail.com'),
      registerFailureOrSuccessOption: none(),
      street: Street(
        '261 Tran Binh Trong, Ward 4, District 5, Ho Chi Minh City',
      ),
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
    //     registerFailureOrSuccessOption: none());
  }

  RegisterState busy() => copyWith(status: STATUS_BUSY);
  RegisterState idle() => copyWith(status: STATUS_IDLE);
  RegisterState failed() => copyWith(status: STATUS_FAILED);
  RegisterState complete() => copyWith(status: STATUS_COMPLETE);
}

// @injectable
class RegisterCubit extends Cubit<RegisterState> {
  final IAuthFacade _authFacade;

  RegisterCubit(this._authFacade) : super(RegisterState.init());

  nameChanged(String value) {
    emit(state.copyWith(name: Name(value)));
  }

  phoneChanged(String value) {
    emit(state.copyWith(phone: Phone(value)));
  }

  streetChanged(String value) {
    emit(state.copyWith(street: Street(value)));
  }

  genderChanged(Gender value) {
    emit(state.copyWith(gender: value));
  }

  birthDayChanged(DateTime value) {
    emit(state.copyWith(birthDay: BirthDay(value)));
  }

  emailAddressChanged(String value) {
    emit(state.copyWith(emailAddress: EmailAddress(value)));
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

  submitted() async {
    Either<AuthFailure, Unit> failureOrSuccess =
        const Right<AuthFailure, Unit>(unit);

    final name = state.name;
    final phone = state.phone;
    final street = state.street;
    // final gender = state.gender;
    final password = state.password;
    final birthDay = state.birthDay;
    final confirmPassword = state.confirmPassword;
    final emailAddress = state.emailAddress;

    const isGenderValid = true;
    final isNameValid = name.isValid();
    final isPhoneValid = phone.isValid();
    final isStreetValid = street.isValid();
    // final isGenderValid = gender.isValid();
    final isBirthDayValid = birthDay.isValid();
    final isEmailValid = emailAddress.isValid();
    final isPasswordValid = password.isValid();
    final isConfirmPasswordValid = confirmPassword.isValid();
    final passwordStr = password.getOrCrash();
    final confirmPasswordStr = confirmPassword.getOrCrash();
    final isMatch = passwordStr.compareTo(confirmPasswordStr) == 0;

    if (isMatch &&
        isNameValid &&
        isPhoneValid &&
        isEmailValid &&
        isStreetValid &&
        isGenderValid &&
        isPasswordValid &&
        isBirthDayValid &&
        isConfirmPasswordValid) {
      emit(state.busy());
      emit(state.copyWith(
        isSubmitting: true,
        registerFailureOrSuccessOption: none(),
      ));

      failureOrSuccess = await _performRegister();
    }

    emit(state.complete());
    emit(state.copyWith(
      isSubmitting: false,
      showErrorMessages: true,
      registerFailureOrSuccessOption: optionOf(failureOrSuccess),
    ));
  }

  Future<Either<AuthFailure, Unit>> _performRegister() {
    final name = state.name;
    final phone = state.phone;
    final street = state.street;
    final gender = state.gender;
    final birthDay = state.birthDay;
    final emailAddress = state.emailAddress;
    final password = state.password;
    final confirmPassword = state.confirmPassword;

    return _authFacade.registerWithEmailAndPassword(
        name: name,
        phone: phone,
        street: street,
        gender: gender,
        birthDay: birthDay,
        password: password,
        confirmPassword: confirmPassword,
        emailAddress: emailAddress);
  }
}
