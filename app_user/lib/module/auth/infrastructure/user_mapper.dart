import '../domain/user.dart';
import '../domain/value_objects.dart';
import 'api/account_api.dart';

// extension GenderX on String {
//   Gender toGender() => this == 'Male' ? Gender.male : Gender.female;
// }

extension GenderX on Gender {
  String toStr() {
    if (this == Gender.male) {
      return 'Male';
    } else if (this == Gender.female) {
      return 'Female';
    }
    return 'Other';
  }
}

extension UserDomainX on Credential {
  Gender toGender() {
    if (gender == 'Male') {
      return Gender.male;
    } else if (gender == 'Female') {
      return Gender.female;
    }
    return Gender.other;
  }

  User toDomain() {
    final image = this.image == null ? null : this.image as String;
    final name = Name(this.name ?? '');
    final phone = Phone(this.phone ?? '');
    final street = Street(address ?? '');
    final emailAddress = EmailAddress(email!);
    final birthDay = BirthDay(DateTime(1997, 01, 29));

    return User(
        id: id!,
        name: name,
        phone: phone,
        image: image,
        street: street,
        gender: toGender(),
        birthDay: birthDay,
        emailAddress: emailAddress);
  }
}
