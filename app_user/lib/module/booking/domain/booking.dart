import 'package:freezed_annotation/freezed_annotation.dart';
part 'booking.freezed.dart';

// enum BookingStatus { pending, accepted, process, doing, complete, cancelled }

@freezed
class BookingStatus with _$BookingStatus {
  const factory BookingStatus.pending() = _Pending;
  const factory BookingStatus.process() = _Process;
  const factory BookingStatus.confirm() = _Confirm;
  const factory BookingStatus.doing() = _Doing;
  const factory BookingStatus.cancelled() = _Cancelled;
  const factory BookingStatus.complete() = _Complete;

  static List<BookingStatus> get values {
    return [
      const BookingStatus.pending(),
      const BookingStatus.process(),
      const BookingStatus.confirm(),
      const BookingStatus.doing(),
      const BookingStatus.cancelled(),
      const BookingStatus.complete(),
    ];
  }
}

@freezed
class Booking with _$Booking {
  const Booking._();
  const factory Booking({
    required int id,
    required int userId,
    required String fullName,
    dynamic company,
    dynamic email,
    String? address,
    dynamic city,
    dynamic state,
    dynamic country,
    String? phoneNumber,
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
    required BookingStatus status,
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
    DateTime? timeBoxingEnd,
    DateTime? timeBoxingStart,
    dynamic verifyByAdmin,
    dynamic adminNote,
    int? serviceId,
    String? latitude,
    String? longitude,
    dynamic deletedAt,
    String? sku,
    dynamic serviceList,
  }) = _Booking;
}
