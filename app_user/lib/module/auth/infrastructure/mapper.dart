import '../domain/user.dart';
import '../domain/value_objects.dart';
import 'api/account_api.dart';

// extension GenderX on String {
//   Gender toGender() => this == 'Male' ? Gender.male : Gender.female;
// }

extension GenderX on Gender {
  String toStr() => this == Gender.male ? 'Male' : 'Female';
}

extension UserDomainX on Credential {
  User toDomain() {
    const image = '';
    final name = Name(this.name ?? '');
    final phone = Phone(this.phone ?? '');
    final street = Street(address ?? '');
    final emailAddress = EmailAddress(email!);
    final birthDay = BirthDay(DateTime(1997, 01, 29));
    final gender = this.gender == 'Male' ? Gender.male : Gender.female;

    return User(
        id: id!,
        name: name,
        phone: phone,
        image: image,
        street: street,
        gender: gender,
        birthDay: birthDay,
        emailAddress: emailAddress);
  }
}
