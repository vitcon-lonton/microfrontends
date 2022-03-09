import 'package:freezed_annotation/freezed_annotation.dart';
import 'value_objects.dart';
part 'user.freezed.dart';

enum Gender { male, female }

@freezed
class User with _$User {
  const User._();
  const factory User(
      {required int id,
      required Name name,
      required Phone phone,
      required String image,
      required Street street,
      required Gender gender,
      required BirthDay birthDay,
      required EmailAddress emailAddress}) = _User;
}
