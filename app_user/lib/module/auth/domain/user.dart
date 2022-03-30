/* spell-checker: disable */
import 'package:freezed_annotation/freezed_annotation.dart';
import 'value_objects.dart';
part 'user.freezed.dart';

enum Gender { male, female, other }

@freezed
class User with _$User {
  const User._();
  const factory User(
      {required int id,
      required Name name,
      required Phone phone,
      required Street street,
      required Gender gender,
      required BirthDay birthDay,
      required EmailAddress emailAddress,
      String? image}) = _User;

  factory User.fake() {
    return User(
      id: 1,
      name: Name('Alvin'),
      street:
          Street('261 Tran Binh Trong, Ward 4, District 5, Ho Chi Minh City'),
      gender: Gender.male,
      phone: Phone('9999999999'),
      birthDay: BirthDay(DateTime(1997, 01, 29)),
      emailAddress: EmailAddress('9999999999@gmail.com'),
    );
  }
}
