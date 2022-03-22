import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/auth_failure.dart';
import '../../domain/i_auth_facade.dart';
import '../../domain/user.dart';
import '../../domain/value_objects.dart';
part 'user_update_cubit.freezed.dart';

@freezed
class UserUpdateState with _$UserUpdateState {
  const UserUpdateState._();
  factory UserUpdateState(
          {File? image,
          Name? name,
          Phone? phone,
          Street? street,
          Gender? gender,
          BirthDay? birthDay,
          EmailAddress? emailAddress,
          @Default(false) bool isSubmitting,
          @Default(true) bool showErrorMessages,
          required Option<Either<AuthFailure, Unit>> failureOrSuccessOption}) =
      _UserUpdateState;
  factory UserUpdateState.init() {
    return UserUpdateState(failureOrSuccessOption: none());
  }

  bool get isAvailable {
    if (name != null) {
      return name?.isValid() ?? false;
    } else if (phone != null) {
      return phone?.isValid() ?? false;
    } else if (street != null) {
      return street?.isValid() ?? false;
    } else if (birthDay != null) {
      return birthDay?.isValid() ?? false;
    } else if (emailAddress != null) {
      return emailAddress?.isValid() ?? false;
    } else if (gender != null) {
      return true;
    }

    return false;
  }
}

class UserUpdateCubit extends Cubit<UserUpdateState> {
  final IAuthFacade _authFacade;

  UserUpdateCubit(this._authFacade) : super(UserUpdateState.init());

  updated() async {
    Either<AuthFailure, Unit> failureOrSuccess =
        const Right<AuthFailure, Unit>(unit);

    // final name = state.name;
    // final phone = state.phone;
    // final street = state.street;
    // // final gender = state.gender;
    // final birthDay = state.birthDay;
    // final emailAddress = state.emailAddress;

    // const isGenderValid = true;
    // final isNameValid = name.isValid();
    // final isPhoneValid = phone.isValid();
    // final isStreetValid = street.isValid();
    // final isGenderValid = gender.isValid();
    // final isBirthDayValid = birthDay.isValid();
    // final isEmailValid = emailAddress.isValid();

    // if (isNameValid &&
    //     isPhoneValid &&
    //     isStreetValid &&
    //     isGenderValid &&
    //     isBirthDayValid &&
    //     isEmailValid) {
    //   emit(state.copyWith(
    //     isSubmitting: true,
    //     failureOrSuccessOption: none(),
    //   ));

    //   failureOrSuccess = await _performUpdateUser();
    // }

    emit(state.copyWith(isSubmitting: true, failureOrSuccessOption: none()));

    failureOrSuccess = await _performUpdateUser();

    emit(state.copyWith(isSubmitting: false));
    emit(state.copyWith(failureOrSuccessOption: optionOf(failureOrSuccess)));
    emit(UserUpdateState.init());
  }

  Future<Either<AuthFailure, Unit>> _performUpdateUser() {
    final name = state.name;
    final phone = state.phone;
    final street = state.street;
    final gender = state.gender;
    final birthDay = state.birthDay;
    final emailAddress = state.emailAddress;
    final image = state.image;

    return _authFacade.updateUser(
        name: name,
        phone: phone,
        street: street,
        gender: gender,
        birthDay: birthDay,
        emailAddress: emailAddress,
        image: image);
  }

  imageChanged(File value) => emit(state.copyWith(image: value));

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


// getUserRequested() async {
//   emit(state.copyWith(isSubmitting: true));
//   emit(state.copyWith(userOption: none()));
//   Option<User> userOption = none();
//   userOption = await _authFacade.getSignedInUser();
//   emit(state.copyWith(userOption: userOption));
//   userOption.fold(() => null, (user) {
//     final name = user.name;
//     final phone = user.phone;
//     final street = user.street;
//     final gender = user.gender;
//     final birthDay = user.birthDay;
//     final emailAddress = user.emailAddress;
//     emit(state.copyWith(
//         user: user,
//         name: name,
//         phone: phone,
//         street: street,
//         gender: gender,
//         birthDay: birthDay,
//         emailAddress: emailAddress));
//   });
//   emit(state.copyWith(isSubmitting: false));
// }
