import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:app_user/core/core.dart';
part 'order.freezed.dart';

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
