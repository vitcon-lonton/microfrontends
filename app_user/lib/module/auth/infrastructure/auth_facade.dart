/* spell-checker: disable */
// ignore_for_file: unused_local_variable
import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:app_user/core/core.dart';
import '../domain/auth_failure.dart';
import '../domain/i_auth_facade.dart';
import '../domain/user.dart';
import '../domain/value_objects.dart';
import 'api/account_api.dart';
import 'user_mapper.dart';

const String tokenKey = 'token';

class AuthFacade implements IAuthFacade {
  final Logger _logger;
  final AccountApi _accountApi;
  final FlutterSecureStorage _storage;

  AuthFacade(this._logger, this._accountApi, this._storage);

  @override
  Future<Option<User>> getSignedInUser() async {
    try {
      final response = await _accountApi.info();
      // if (!response.valid) return none();
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
      final response = await _accountApi.login(phoneStr, passwordStr);
      final responseData = response.data!;
      final token = responseData.tokenUser!;

      await _storage.write(key: tokenKey, value: token);

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
    return Future.wait([_accountApi.logout(), _storage.delete(key: tokenKey)]);
  }

  @override
  Future<Either<AuthFailure, Unit>> updateAvatar({required XFile image}) async {
    String imgFormat = image.path.split('.').last;
    List<int> imageBytes = await image.readAsBytes();
    String base64Image = base64Encode(imageBytes);

    try {
      await _accountApi.updateAvatar(base64Image, imgFormat: '.$imgFormat');
      return right(unit);
    } catch (exception) {
      _logger.e(exception);
      if (exception is ResponseDataError) {
        if (exception.errors?.isNotEmpty ?? false) {
          return left(AuthFailure.unableUpdate(exception.errors!));
        }
      }
    }

    return left(const AuthFailure.unexpected());
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
    } catch (_) {
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

      final response = await _accountApi.register(data);

      await _storage.write(key: tokenKey, value: response.data!.tokenUser!);

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
    String newPasswordStr = newPassword.getOrCrash();
    String currentPasswordStr = currentPassword.getOrCrash();
    String confirmPasswordStr = confirmPassword.getOrCrash();
    bool isMatch = newPasswordStr.compareTo(confirmPasswordStr) == 0;
    if (!isMatch) return left(const AuthFailure.serverError());

    try {
      BaseResponse<Credential> response;

      response = await _accountApi.changeCurrentPassword(
          ChangeCurrentPasswordData(
              password: newPasswordStr,
              currentPassword: currentPasswordStr,
              passwordConfirmation: confirmPasswordStr));

      await _storage.write(key: tokenKey, value: response.data!.tokenUser!);

      return right(unit);
    } catch (e) {
      _logger.e(e);
      if (e is ResponseDataError) {
        if (e.errors?.isNotEmpty ?? false) {
          return left(AuthFailure.unableUpdatePassword(e.errors!));
        }
      }
    }

    return left(const AuthFailure.serverError());
  }

  @override
  Future<Either<AuthFailure, Unit>> updateUser(
      {Name? name,
      Phone? phone,
      Street? street,
      Gender? gender,
      BirthDay? birthDay,
      EmailAddress? emailAddress,
      XFile? avatar}) async {
    String? imgFormatStr;
    String? imgBase64Str;
    String? genderStr = gender?.toStr();
    String? nameStr = name?.getOrCrash();
    String? phoneStr = phone?.getOrCrash();
    String? streetStr = street?.getOrCrash();
    String? emailAddressStr = emailAddress?.getOrCrash();
    String? birthDayStr = birthDay?.getOrCrash().toString();

    try {
      if (avatar != null) {
        imgFormatStr = avatar.path.split('.').last;
        List<int> imageBytes = await avatar.readAsBytes();
        imgBase64Str = base64Encode(imageBytes);
      }

      await _accountApi.update(
          name: nameStr,
          phone: phoneStr,
          gender: genderStr,
          birthDate: birthDayStr,
          email: emailAddressStr,
          imgFormat: imgFormatStr,
          base64Img: imgBase64Str);

      return right(unit);
    } catch (exception) {
      _logger.e(exception);
      if (exception is ResponseDataError) {
        if (exception.errors?.isNotEmpty ?? false) {
          return left(AuthFailure.unableUpdate(exception.errors!));
        }
      }
    }

    return left(const AuthFailure.serverError());
  }
}
