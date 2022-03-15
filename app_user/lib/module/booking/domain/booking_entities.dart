import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:app_user/core/core.dart';
part 'booking_entities.freezed.dart';

enum OrderStatus { created, processing, waitingConfirm, doing, done, cancel }

@freezed
class Order with _$Order {
  const Order._();
  factory Order(
      {required UniqueId id,
      required DateTime time,
      @Default(OrderStatus.created) OrderStatus status}) = _Order;
  factory Order.random() => Order(id: UniqueId(), time: DateTime.now());

  double get price => 220022;
  String get address => 'Address ${id.getOrCrash()}';
  String get name => 'Service name ${id.getOrCrash()}';
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
    DateTime? timeBoxingEnd,
    DateTime? timeBoxingStart,
    dynamic verifyByAdmin,
    dynamic adminNote,
    required int serviceId,
    String? latitude,
    String? longitude,
    dynamic deletedAt,
    String? sku,
    dynamic serviceList,
  }) = _Booking;
}
