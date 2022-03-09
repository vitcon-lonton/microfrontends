// ignore_for_file: unnecessary_import

/* spell-checker: disable */
// ignore_for_file: unused_local_variable

import 'package:app_user/auth/auth.dart';
import 'package:app_user/auth/infrastructure/api.dart';
import 'package:dartz/dartz.dart' hide Order;
import 'package:engine/engine.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:app_user/auth/domain/auth_failure.dart';
import 'package:app_user/auth/domain/i_auth_facade.dart';
import 'package:app_user/auth/domain/user.dart';
import 'package:app_user/auth/domain/value_objects.dart';

final _fakeUser = User(
  image: '',
  id: UniqueId(),
  name: Name('Alvin'),
  phone: Phone('9999999999'),
  gender: Gender.male,
  birthDay: BirthDay(DateTime(1997, 01, 29)),
  emailAddress: EmailAddress('9999999999@gmail.com'),
  street: Street('261 Tran Binh Trong, Ward 4, District 5, Ho Chi Minh City'),
);

class AuthFacade implements IAuthFacade {
  final AccountApi _api;

  AuthFacade(this._api);

  @override
  Future<Option<User>> getSignedInUser() async => optionOf(_fakeUser);

  @override
  Future<Either<AuthFailure, Unit>> signInWithPhoneAndPassword(
      {required Phone phone, required Password password}) async {
    const deviceId = 'android';
    final phoneStr = phone.getOrCrash();
    final passwordStr = password.getOrCrash();

    try {
      final response = await _api.login(phoneStr, passwordStr, deviceId);

      if (response.valid) return right(unit);

      return left(const AuthFailure.invalidEmailAndPasswordCombination());
    } catch (e) {
      return left(const AuthFailure.invalidEmailAndPasswordCombination());
    }

    // return left(const AuthFailure.serverError());
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithGoogle() async {
    await Future.delayed(const Duration(seconds: 1));
    try {
      // final googleUser = await _googleSignIn.signIn();
      // if (googleUser == null) {
      //   return left(const AuthFailure.cancelledByUser());
      // }

      // final googleAuthentication = await googleUser.authentication;

      // final authCredential = GoogleAuthProvider.credential(
      //   idToken: googleAuthentication.idToken,
      //   accessToken: googleAuthentication.accessToken,
      // );

      // await _firebaseAuth.signInWithCredential(authCredential);
      return right(unit);
    } on FirebaseAuthException catch (_) {
      return left(const AuthFailure.serverError());
    }
  }

  @override
  Future<void> signOut() {
    return Future.wait([Future.delayed(const Duration(seconds: 1))]);
  }

  @override
  Future<Either<AuthFailure, Unit>> forgetPassword(
      {required Phone phone}) async {
    final phoneStr = phone.getOrCrash();

    try {
      await Future.delayed(const Duration(seconds: 1));
      // final googleUser = await _googleSignIn.signIn();
      // if (googleUser == null) {
      //   return left(const AuthFailure.cancelledByUser());
      // }

      // final googleAuthentication = await googleUser.authentication;

      // final authCredential = GoogleAuthProvider.credential(
      //   idToken: googleAuthentication.idToken,
      //   accessToken: googleAuthentication.accessToken,
      // );

      // await _firebaseAuth.signInWithCredential(authCredential);
      return right(unit);
    } on FirebaseAuthException catch (_) {
      return left(const AuthFailure.serverError());
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword(
      {required Name name,
      required Phone phone,
      required Street street,
      required Gender gender,
      required BirthDay birthDay,
      required Password password,
      required Password confirmPassword,
      required EmailAddress emailAddress}) async {
    final nameStr = name.getOrCrash();
    final phoneStr = phone.getOrCrash();
    final streetStr = street.getOrCrash();
    final passwordStr = password.getOrCrash();
    final birthDayValue = birthDay.getOrCrash();
    final emailAddressStr = emailAddress.getOrCrash();
    final confirmPasswordStr = confirmPassword.getOrCrash();
    try {
      // Male
      // 1/1/1993
      final data = RegisterData(
          name: nameStr,
          phone: phoneStr,
          address: streetStr,
          password: passwordStr,
          email: emailAddressStr,
          gender: gender.toString(),
          birthdate: birthDayValue.toString(),
          passwordConfirmation: confirmPasswordStr);

      final response = await _api.register(data);

      if (response.valid) return right(unit);

      return left(const AuthFailure.serverError());
    } catch (e) {
      return left(const AuthFailure.emailAlreadyInUse());
    }
    // return left(const AuthFailure.serverError());
  }

  @override
  Future<Either<AuthFailure, Unit>> updatePassword(
      {required Password newPassword,
      required Password currentPassword,
      required Password confirmPassword}) async {
    final newPasswordStr = newPassword.getOrCrash();
    final currentPasswordStr = currentPassword.getOrCrash();
    final confirmPasswordStr = confirmPassword.getOrCrash();
    final valid = newPasswordStr.compareTo(confirmPasswordStr) == 0;
    if (!valid) return left(const AuthFailure.serverError());

    try {
      await Future.delayed(const Duration(seconds: 1));
      return right(unit);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'ERROR_EMAIL_ALREADY_IN_USE') {
        return left(const AuthFailure.emailAlreadyInUse());
      } else {
        return left(const AuthFailure.serverError());
      }
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> updateUser(
      {required Name name,
      required Phone phone,
      required Street street,
      required Gender gender,
      required BirthDay birthDay,
      required EmailAddress emailAddress}) async {
    final nameStr = name.getOrCrash();
    final phoneStr = phone.getOrCrash();
    final streetStr = street.getOrCrash();
    final birthDayStr = birthDay.getOrCrash();
    final emailAddressStr = emailAddress.getOrCrash();

    try {
      await Future.delayed(const Duration(seconds: 1));
      return right(unit);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'ERROR_EMAIL_ALREADY_IN_USE') {
        return left(const AuthFailure.emailAlreadyInUse());
      } else {
        return left(const AuthFailure.serverError());
      }
    }
  }

  @override
  Future<Option<Pagination<Order>>> getOrderHistories(
      {required int page, required int perPage}) async {
    await Future.delayed(const Duration(milliseconds: 400));

    const pageCount = 5;
    final totalCount = perPage * 5;
    final data = List.generate(perPage, (index) => Order.random());

    final result = Pagination<Order>(
        data: data,
        page: page,
        perPage: perPage,
        pageCount: pageCount,
        totalCount: totalCount);

    return optionOf(result);
  }

  @override
  Future<Option<Pagination<Order>>> getNotifications(
      {required int page, required int perPage}) async {
    await Future.delayed(const Duration(milliseconds: 400));

    const pageCount = 5;
    final totalCount = perPage * 5;
    final data = List.generate(perPage, (index) => Order.random());

    final result = Pagination<Order>(
        data: data,
        page: page,
        perPage: perPage,
        pageCount: pageCount,
        totalCount: totalCount);

    return optionOf(result);
  }

  @override
  Future<Option<Pagination<Favorite>>> getFavorites(
      {required int page, required int perPage}) async {
    await Future.delayed(const Duration(milliseconds: 400));

    const pageCount = 5;
    final totalCount = perPage * 5;
    final data = List.generate(perPage, (index) => Favorite.random());

    final result = Pagination<Favorite>(
        data: data,
        page: page,
        perPage: perPage,
        pageCount: pageCount,
        totalCount: totalCount);

    return optionOf(result);
  }
}
