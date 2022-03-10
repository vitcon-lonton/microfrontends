/* spell-checker: disable */
part of 'api.dart';

@freezed
class BookingDto with _$BookingDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory BookingDto(
      {required String serviceId,
      required String technicianId,
      required String timeboxingStart,
      required String timeboxingEnd,
      required String description,
      required List<String> bookingImages,
      required String address,
      required String longitude,
      required String latitude,
      required String fullname,
      required String phonenumber}) = _BookingDto;

  factory BookingDto.fromJson(Map<String, dynamic> json) =>
      _$BookingDtoFromJson(json);
}
