/* spell-checker: disable */
part of 'api.dart';

@freezed
class Credential with _$Credential {
  // const Credential._();
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Credential({
    String? tokenUser,
    String? verifyCode,
    int? id,
    String? phone,
    String? email,
    String? passwordDigest,
    String? name,
    String? address,
    dynamic company,
    dynamic image,
    int? status,
    int? verify,
    dynamic slug,
    DateTime? createdAt,
    DateTime? updatedAt,
    dynamic firstName,
    dynamic lastName,
    dynamic points,
    dynamic postCode,
    dynamic setDefaultAddress,
    dynamic city,
    dynamic country,
    String? gender,
    dynamic register,
    DateTime? birthdate,
    dynamic fax,
    dynamic currentDeviceType,
    dynamic currentDeviceName,
    dynamic currentOsVersion,
    dynamic currentAppVersion,
    dynamic currentDeviceId,
    dynamic currentDeviceToken,
    dynamic provinceFromId,
    dynamic provinceFromName,
    dynamic districtFromId,
    dynamic districtFromName,
    dynamic addressFrom,
    dynamic cityId,
    dynamic districtToName,
    dynamic provinceToName,
    dynamic districtId,
    int? accumulatePoint,
    dynamic addressTo,
    dynamic usernameTo,
    dynamic phoneTo,
    dynamic usernameFrom,
    dynamic phoneFrom,
    dynamic partnerType,
    dynamic district,
    dynamic partnerToken,
    dynamic roleChat,
    dynamic defaultAddress,
    String? latitude,
    String? longitude,
    String? newestAddress,
    dynamic deletedAt,
  }) = _Credential;

  factory Credential.fromJson(Map<String, dynamic> json) =>
      _$CredentialFromJson(json);
}
