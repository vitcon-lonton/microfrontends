import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'auth_failure.dart';
import 'user.dart';
import 'value_objects.dart';

abstract class IAuthFacade {
  Future<Option<User>> getSignedInUser();
  Future<void> signOut();
  Future<Either<AuthFailure, Unit>> updateAvatar({required XFile image});
  Future<Either<AuthFailure, Unit>> forgetPassword({required Phone phone});
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword(
      {required Phone phone,
      required FullName fullName,
      required Password password,
      required Password confirmPassword,
      EmailAddress? emailAddress});
  Future<Either<AuthFailure, Unit>> signInWithPhoneAndPassword(
      {required Phone phone, required Password password});
  Future<Either<AuthFailure, Unit>> updatePassword(
      {required Password newPassword,
      required Password currentPassword,
      required Password confirmPassword});
  Future<Either<AuthFailure, Unit>> updateUser(
      {Name? name,
      Phone? phone,
      Street? street,
      Gender? gender,
      BirthDay? birthDay,
      EmailAddress? emailAddress,
      XFile? avatar});
}
