import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:app_user/core/core.dart';
import '../../domain/auth_failure.dart';
import '../../domain/i_auth_facade.dart';
import '../../domain/user.dart';
import '../../domain/value_objects.dart';
part 'user_update_cubit.freezed.dart';

@freezed
class UserUpdateState with _$UserUpdateState {
  const UserUpdateState._();

  factory UserUpdateState({
    User? user,
    required Name name,
    required Phone phone,
    required Street street,
    required Gender gender,
    required BirthDay birthDay,
    required EmailAddress emailAddress,
    @Default(false) bool isSubmitting,
    @Default(true) bool showErrorMessages,
    @Default(STATUS_IDLE) ProcessingStatus status,
    required Option<User> userOption,
    required Option<Either<AuthFailure, Unit>> failureOrSuccessOption,
  }) = _UserUpdateState;

  bool get valid => true;

  factory UserUpdateState.init() {
    return UserUpdateState(
        name: Name(''),
        phone: Phone(''),
        street: Street(''),
        gender: Gender.male,
        emailAddress: EmailAddress(''),
        birthDay: BirthDay(DateTime.now()),
        failureOrSuccessOption: none(),
        userOption: none());
  }

  UserUpdateState idle() => copyWith(status: STATUS_IDLE);
  UserUpdateState busy() => copyWith(status: STATUS_BUSY);
  UserUpdateState failed() => copyWith(status: STATUS_FAILED);
  UserUpdateState complete() => copyWith(status: STATUS_COMPLETE);
}

class UserUpdateCubit extends Cubit<UserUpdateState> {
  final IAuthFacade _authFacade;

  UserUpdateCubit(this._authFacade) : super(UserUpdateState.init()) {
    getUserRequested();
  }

  getUserRequested() async {
    Option<User> userOption = none();

    emit(state.busy().copyWith(userOption: none()));

    userOption = await _authFacade.getSignedInUser();

    emit(state.idle().copyWith(userOption: userOption));

    userOption.fold(() => null, (user) {
      final name = user.name;
      final phone = user.phone;
      final street = user.street;
      final gender = user.gender;
      final birthDay = user.birthDay;
      final emailAddress = user.emailAddress;

      emit(state.copyWith(
          user: user,
          name: name,
          phone: phone,
          street: street,
          gender: gender,
          birthDay: birthDay,
          emailAddress: emailAddress));
    });
  }

  submitted() async {
    Either<AuthFailure, Unit> failureOrSuccess =
        const Right<AuthFailure, Unit>(unit);

    final name = state.name;
    final phone = state.phone;
    final street = state.street;
    // final gender = state.gender;
    final birthDay = state.birthDay;
    final emailAddress = state.emailAddress;

    const isGenderValid = true;
    final isNameValid = name.isValid();
    final isPhoneValid = phone.isValid();
    final isStreetValid = street.isValid();
    // final isGenderValid = gender.isValid();
    final isBirthDayValid = birthDay.isValid();
    final isEmailValid = emailAddress.isValid();

    if (isNameValid &&
        isPhoneValid &&
        isStreetValid &&
        isGenderValid &&
        isBirthDayValid &&
        isEmailValid) {
      emit(state.busy());
      emit(state.copyWith(
        isSubmitting: true,
        failureOrSuccessOption: none(),
      ));

      failureOrSuccess = await _performUpdateUser();
    }

    emit(state.complete());
    emit(state.copyWith(
        isSubmitting: false,
        showErrorMessages: true,
        failureOrSuccessOption: optionOf(failureOrSuccess)));
  }

  Future<Either<AuthFailure, Unit>> _performUpdateUser() {
    final name = state.name;
    final phone = state.phone;
    final street = state.street;
    final gender = state.gender;
    final birthDay = state.birthDay;
    final emailAddress = state.emailAddress;

    return _authFacade.updateUser(
        name: name,
        phone: phone,
        street: street,
        gender: gender,
        birthDay: birthDay,
        emailAddress: emailAddress);
  }

  genderChanged(Gender value) => emit(state.copyWith(gender: value));

  nameChanged(String value) => emit(state.copyWith(name: Name(value)));

  phoneChanged(String value) => emit(state.copyWith(phone: Phone(value)));

  streetChanged(String value) => emit(state.copyWith(street: Street(value)));

  birthDayChanged(DateTime value) {
    emit(state.copyWith(birthDay: BirthDay(value)));
  }

  emailAddressChanged(String value) {
    emit(state.copyWith(emailAddress: EmailAddress(value)));
  }
}
