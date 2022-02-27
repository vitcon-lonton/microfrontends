import 'package:dartz/dartz.dart';
import 'package:engine/engine.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:auth/domain/auth_failure.dart';
import 'package:auth/domain/i_auth_facade.dart';
import 'package:auth/domain/user.dart';
import 'package:auth/domain/value_objects.dart';

part 'update_user_cubit.freezed.dart';

@freezed
class UpdateUserState with _$UpdateUserState {
  const UpdateUserState._();

  factory UpdateUserState({
    User? user,
    required Name name,
    required Phone phone,
    required Street street,
    required Gender gender,
    required BirthDay birthDay,
    required Password password,
    required Password confirmPassword,
    required EmailAddress emailAddress,
    @Default(false) bool remember,
    @Default(false) bool isSubmitting,
    @Default(false) bool displayPassword,
    @Default(true) bool showErrorMessages,
    @Default(STATUS_IDLE) ProcessingStatus status,
    required Option<User> userOption,
    required Option<Either<AuthFailure, Unit>> updateFailureOrSuccessOption,
  }) = _UpdateUserState;

  bool get valid => true;

  factory UpdateUserState.init() {
    return UpdateUserState(
        name: Name(''),
        phone: Phone(''),
        street: Street(''),
        gender: Gender.male,
        password: Password(''),
        confirmPassword: Password(''),
        emailAddress: EmailAddress(''),
        birthDay: BirthDay(DateTime.now()),
        updateFailureOrSuccessOption: none(),
        userOption: none());
  }

  UpdateUserState idle() => copyWith(status: STATUS_IDLE);
  UpdateUserState busy() => copyWith(status: STATUS_BUSY);
  UpdateUserState failed() => copyWith(status: STATUS_FAILED);
  UpdateUserState complete() => copyWith(status: STATUS_COMPLETE);
}

class UpdateUserCubit extends Cubit<UpdateUserState> {
  final IAuthFacade _authFacade;

  UpdateUserCubit(this._authFacade) : super(UpdateUserState.init()) {
    getUserRequested();
  }

  getUserRequested() async {
    Option<User> userOption = none();
    emit(state.busy().copyWith(userOption: none()));
    userOption = await _authFacade.getSignedInUser();
    emit(state.idle().copyWith(userOption: userOption));
  }

  submitted() async {
    Either<AuthFailure, Unit> failureOrSuccess =
        const Right<AuthFailure, Unit>(unit);

    final name = state.name;
    final phone = state.phone;
    final street = state.street;
    // final gender = state.gender;
    final birthDay = state.birthDay;
    final password = state.password;
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

    if (isNameValid &&
        isPhoneValid &&
        isStreetValid &&
        isGenderValid &&
        isBirthDayValid &&
        isEmailValid &&
        isPasswordValid &&
        isConfirmPasswordValid) {
      emit(state.busy());
      emit(state.copyWith(
        isSubmitting: true,
        updateFailureOrSuccessOption: none(),
      ));

      failureOrSuccess = await _performUpdateUser();
    }

    emit(state.complete().copyWith(
        isSubmitting: false,
        showErrorMessages: true,
        updateFailureOrSuccessOption: optionOf(failureOrSuccess)));
  }

  Future<Either<AuthFailure, Unit>> _performUpdateUser() {
    final name = state.name;
    final phone = state.phone;
    final street = state.street;
    final gender = state.gender;
    final birthDay = state.birthDay;
    final emailAddress = state.emailAddress;
    // final password = state.password;
    // final confirmPassword = state.confirmPassword;

    return _authFacade.updateUser(
        name: name,
        phone: phone,
        street: street,
        gender: gender,
        birthDay: birthDay,
        emailAddress: emailAddress);
  }

  birthDayChanged(DateTime value) =>
      emit(state.copyWith(birthDay: BirthDay(value)));

  emailAddressChanged(String value) =>
      emit(state.copyWith(emailAddress: EmailAddress(value)));

  passwordChanged(String value) =>
      emit(state.copyWith(password: Password(value)));

  confirmPasswordChanged(String value) =>
      emit(state.copyWith(confirmPassword: Password(value)));

  displayPasswordChanged(bool value) =>
      emit(state.copyWith(displayPassword: value));

  genderChanged(Gender value) => emit(state.copyWith(gender: value));

  rememberChanged(bool value) => emit(state.copyWith(remember: value));

  nameChanged(String value) => emit(state.copyWith(name: Name(value)));

  phoneChanged(String value) => emit(state.copyWith(phone: Phone(value)));

  streetChanged(String value) => emit(state.copyWith(street: Street(value)));
}