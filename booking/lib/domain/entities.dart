import 'package:engine/engine.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'entities.freezed.dart';

enum OrderStatus { created, processing, waitingConfirm, doing, done, cancel }

@freezed
class CartItem with _$CartItem {
  const CartItem._();

  const factory CartItem({
    required UniqueId id,
    required DateTime time,
  }) = _CartItem;

  factory CartItem.random() => CartItem(id: UniqueId(), time: DateTime.now());

  double get rating => 5.0;
  String? get image => null;
  double get price => 220022;
  String get name => 'Item name ${id.getOrCrash()}';
}

@freezed
class Order with _$Order {
  const Order._();

  const factory Order(
      {required UniqueId id,
      required DateTime time,
      @Default(OrderStatus.created) OrderStatus status}) = _Order;

  factory Order.random() => Order(id: UniqueId(), time: DateTime.now());

  double get price => 220022;
  String get name => 'Service name ${id.getOrCrash()}';
  String get address => 'Address ${id.getOrCrash()}';
}
