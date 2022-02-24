import 'package:auth/auth.dart';
import 'package:engine/engine.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

enum Gender { male, female }

@freezed
class User with _$User {
  const factory User(
      {required UniqueId id,
      required Name name,
      required Phone phone,
      required String image,
      required Street street,
      required Gender gender,
      required BirthDay birthDay,
      required EmailAddress emailAddress}) = _User;
}
