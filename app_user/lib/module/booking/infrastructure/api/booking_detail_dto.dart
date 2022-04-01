part of 'booking_api.dart';

@freezed
class BookingDetailDto with _$BookingDetailDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory BookingDetailDto({
    required int id,
    required int bookingId,
    required int serviceId,
    DateTime? serviceWarrantyPeriod,
    required double servicePricing,
    required double materialPricing,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _BookingDetailDto;

  factory BookingDetailDto.fromJson(Map<String, dynamic> json) =>
      _$BookingDetailDtoFromJson(json);
}
