/* spell-checker: disable */
// ignore_for_file: unused_local_variable
import 'dart:io';
import 'package:app_user/core/core.dart';
import 'package:app_user/module/auth/auth.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logger/logger.dart';

const String tokenKey = 'token';

class AuthFacade implements IAuthFacade {
  final Logger _logger;
  final AccountApi _api;
  final FlutterSecureStorage _storage;

  AuthFacade(this._logger, this._api, this._storage);

  @override
  Future<Option<User>> getSignedInUser() async {
    try {
      final response = await _api.info();
      if (!response.valid) return none();
      return optionOf(response.data!.toDomain());
    } catch (e) {
      _logger.e(e);
    }

    return none();
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithPhoneAndPassword(
      {required Phone phone, required Password password}) async {
    final phoneStr = phone.getOrCrash();
    final passwordStr = password.getOrCrash();

    try {
      final response = await _api.login(phoneStr, passwordStr);
      final responseData = response.data!;
      final token = responseData.tokenUser!;

      _storage.write(key: tokenKey, value: token);

      return right(unit);
    } catch (exception) {
      _logger.e(exception);
      if (exception is ResponseDataError) {
        if (exception.errors?.isNotEmpty ?? false) {
          return left(AuthFailure.unableSignIn(exception.errors!));
        }
      }

      return left(const AuthFailure.unexpected());
    }
  }

  @override
  Future<void> signOut() {
    return Future.wait([_api.logout(), _storage.delete(key: tokenKey)]);
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
      required FullName fullName,
      required Password password,
      required Password confirmPassword,
      EmailAddress? emailAddress}) async {
    final fullNameStr = fullName.getOrCrash();
    final phoneStr = phone.getOrCrash();
    final passwordStr = password.getOrCrash();
    final emailAddressStr = emailAddress?.getOrCrash();
    final confirmPasswordStr = confirmPassword.getOrCrash();

    try {
      final data = RegisterData(
          phone: phoneStr,
          name: fullNameStr,
          email: emailAddressStr,
          password: passwordStr,
          passwordConfirmation: confirmPasswordStr);

      final response = await _api.register(data);

      _storage.write(key: tokenKey, value: response.data!.tokenUser!);

      return right(unit);
    } catch (exception) {
      _logger.e(exception);
      if (exception is ResponseDataError) {
        if (exception.errors?.isNotEmpty ?? false) {
          return left(AuthFailure.unableRegister(exception.errors!));
        }
      }

      return left(const AuthFailure.serverError());
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
      {Name? name,
      Phone? phone,
      Street? street,
      Gender? gender,
      BirthDay? birthDay,
      EmailAddress? emailAddress,
      File? image}) async {
    final genderStr = gender?.toStr();
    final nameStr = name?.getOrCrash();
    final phoneStr = phone?.getOrCrash();
    final streetStr = street?.getOrCrash();
    final emailAddressStr = emailAddress?.getOrCrash();
    final birthDayStr = birthDay?.getOrCrash().toString();

    try {
      final response = await _api.update(
          name: nameStr,
          phone: phoneStr,
          gender: genderStr,
          birthDate: birthDayStr,
          email: emailAddressStr,
          img: image);

      if (!response.valid) return left(const AuthFailure.serverError());

      return right(unit);
    } catch (e) {
      _logger.e(e);
    }

    return left(const AuthFailure.serverError());
  }
}


// final _fakeUser = User(
//   id: 1,
//   image: '',
//   name: Name('Alvin'),
//   phone: Phone('9999999999'),
//   gender: Gender.male,
//   birthDay: BirthDay(DateTime(1997, 01, 29)),
//   emailAddress: EmailAddress('9999999999@gmail.com'),
//   street: Street('261 Tran Binh Trong, Ward 4, District 5, Ho Chi Minh City'),
// );