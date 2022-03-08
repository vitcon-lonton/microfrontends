import 'package:engine/engine.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'value_objects.dart';
part 'user.freezed.dart';

enum Gender { male, female }

enum OrderStatus { created, done, cancel }

@freezed
class User with _$User {
  const factory User(
      {required UniqueId id,
      required Name name,
      required Phone phone,
      required String image,
      required Street street,
      required Gender gender,
      required BirthDay birthDay,
      required EmailAddress emailAddress}) = _User;
}

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

@freezed
class Favorite with _$Favorite {
  const factory Favorite(
      {required UniqueId id,
      required String name,
      required double price,
      required DateTime time}) = _Favorite;

  factory Favorite.random() {
    final _id = UniqueId();

    return Favorite(
      id: _id,
      price: 2000000,
      time: DateTime.now(),
      name: 'Service name ${_id.value.foldRight('', (id, previous) => id)}',
    );
  }
}
