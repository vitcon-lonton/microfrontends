/* spell-checker: disable */
part of 'booking_api.dart';

@freezed
class TechnicianDto with _$TechnicianDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory TechnicianDto(
      {required int id,
      DateTime? createdAt,
      DateTime? updatedAt,
      String? longitude,
      String? latitude,
      required String username,
      String? description,
      required String name,
      required String email,
      required int status,
      String? image,
      required String gender,
      required int verify,
      String? tokenTechnician,
      String? verifyCode,
      DateTime? birthdate,
      required String phone,
      dynamic deletedAt,
      String? passwordDigest,
      int? avgRatingScore,
      String? address,
      String? currentAddress,
      int? bookingsCount,
      double? revenue}) = _TechnicianDto;

  factory TechnicianDto.fromJson(Map<String, dynamic> json) =>
      _$TechnicianDtoFromJson(json);
}
