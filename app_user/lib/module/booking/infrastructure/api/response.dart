/* spell-checker: disable */
part of 'booking_api.dart';

@freezed
class BookingDto with _$BookingDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory BookingDto({
    required int id,
    required int userId,
    required String fullname,
    dynamic company,
    dynamic email,
    String? address,
    dynamic city,
    dynamic state,
    dynamic country,
    String? phonenumber,
    dynamic productList,
    dynamic quantity,
    dynamic shippingId,
    dynamic shippingFee,
    dynamic subTotal,
    double? priceTotal,
    dynamic clientDevice,
    dynamic paymentId,
    dynamic clientIp,
    dynamic paymentName,
    dynamic transactionName,
    dynamic paidTransaction,
    dynamic paidStatus,
    String? status,
    dynamic remark,
    String? statusInvestigate,
    String? statusPayment,
    String? description,
    DateTime? updatedAt,
    DateTime? createdAt,
    dynamic priceDiscount,
    int? sentMail,
    dynamic provinceName,
    dynamic districtName,
    dynamic districtId,
    dynamic categoryId,
    dynamic wardCode,
    dynamic wardName,
    int? technicianId,
    DateTime? timeboxingEnd,
    DateTime? timeboxingStart,
    dynamic verifyByAdmin,
    dynamic adminNote,
    required int serviceId,
    String? latitude,
    String? longitude,
    dynamic deletedAt,
    String? sku,
    dynamic serviceList,
  }) = _BookingDto;

  factory BookingDto.fromJson(Map<String, dynamic> json) =>
      _$BookingDtoFromJson(json);
}