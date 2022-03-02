import 'package:engine/engine.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'entities.freezed.dart';

enum OrderStatus { created, done, cancel }

@freezed
class Order with _$Order {
  const factory Order(
      {required UniqueId id,
      required String name,
      required double price,
      required DateTime time,
      @Default(OrderStatus.created) OrderStatus status}) = _Order;

  factory Order.random() {
    final _id = UniqueId();

    return Order(
      id: _id,
      price: 2000000,
      time: DateTime.now(),
      name: 'Service name ${_id.value.foldRight('', (id, previous) => id)}',
    );
  }
}
