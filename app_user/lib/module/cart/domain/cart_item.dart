import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:app_user/core/core.dart';

part 'cart_item.freezed.dart';

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
