/* spell-checker: disable */
part of 'booking_api.dart';

@freezed
class BookingItemDto with _$BookingItemDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory BookingItemDto({
    String? detailImages,
    String? detailNote,
    @JsonKey(name: 'detail_starttime') required DateTime startTime,
    @JsonKey(name: 'detail_endtime') required DateTime endTime,
  }) = _BookingItemDto;

  factory BookingItemDto.fromJson(Map<String, dynamic> json) =>
      _$BookingItemDtoFromJson(json);
}

// @freezed
// class BookingDetailsAttrDto with _$BookingDetailsAttrDto {
//   @JsonSerializable(fieldRename: FieldRename.snake)
//   const factory BookingDetailsAttrDto({
//     required Map<String, BookingItemDto> bookingDetailsAttributes,
//   }) = _BookingDetailsAttrDto;

//   factory BookingDetailsAttrDto.fromJson(Map<String, dynamic> json) =>
//       _$BookingDetailsAttrDtoFromJson(json);
// }
