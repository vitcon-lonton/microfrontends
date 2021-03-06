import 'package:dartz/dartz.dart' hide Order;
import 'package:engine/engine.dart';

import 'auth_failure.dart';
import 'user.dart';
import 'value_objects.dart';

abstract class IAuthFacade {
  Future<Option<User>> getSignedInUser();
  Future<Either<AuthFailure, Unit>> forgetPassword({required Phone phone});
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword(
      {required Phone phone,
      required Street street,
      required Gender gender,
      required Name lastName,
      required Name firstName,
      required BirthDay birthDay,
      required Password password,
      required Password confirmPassword,
      required EmailAddress emailAddress});
  Future<Either<AuthFailure, Unit>> signInWithPhoneAndPassword(
      {required Phone phone, required Password password});
  Future<Either<AuthFailure, Unit>> signInWithGoogle();
  Future<Either<AuthFailure, Unit>> updatePassword(
      {required Password newPassword,
      required Password currentPassword,
      required Password confirmPassword});
  Future<Either<AuthFailure, Unit>> updateUser(
      {required Name name,
      required Phone phone,
      required Street street,
      required Gender gender,
      required BirthDay birthDay,
      required EmailAddress emailAddress});
  Future<void> signOut();
  Future<Option<Pagination<Favorite>>> getFavorites(
      {required int page, required int perPage});
  Future<Option<Pagination<Order>>> getNotifications(
      {required int page, required int perPage});
  Future<Option<Pagination<Order>>> getOrderHistories(
      {required int page, required int perPage});
}
