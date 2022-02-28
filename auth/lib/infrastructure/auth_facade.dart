// ignore_for_file: unused_local_variable

import 'package:dartz/dartz.dart' hide Order;
import 'package:engine/engine.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;

import 'package:auth/domain/auth_failure.dart';
import 'package:auth/domain/i_auth_facade.dart';
import 'package:auth/domain/user.dart';
import 'package:auth/domain/value_objects.dart';

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
  // AuthFacade();

  @override
  Future<Option<User>> getSignedInUser() async => optionOf(_fakeUser);

  @override
  Future<Either<AuthFailure, Unit>> signInWithPhoneAndPassword(
      {required Phone phone, required Password password}) async {
    final phoneStr = phone.getOrCrash();
    final passwordStr = password.getOrCrash();
    try {
      await Future.delayed(const Duration(seconds: 1));
      return right(unit);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'ERROR_WRONG_PASSWORD' ||
          e.code == 'ERROR_fakeUSER_NOT_FOUND') {
        return left(const AuthFailure.invalidEmailAndPasswordCombination());
      } else {
        return left(const AuthFailure.serverError());
      }
    }
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
      {required Phone phone,
      required Street street,
      required Gender gender,
      required Name lastName,
      required Name firstName,
      required BirthDay birthDay,
      required Password password,
      required Password confirmPassword,
      required EmailAddress emailAddress}) async {
    final phoneStr = phone.getOrCrash();
    final streetStr = street.getOrCrash();
    final passwordStr = password.getOrCrash();
    final lastNameStr = lastName.getOrCrash();
    final firstNameStr = firstName.getOrCrash();
    final birthDayValue = birthDay.getOrCrash();
    final emailAddressStr = emailAddress.getOrCrash();
    final confirmPasswordStr = confirmPassword.getOrCrash();

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
}
