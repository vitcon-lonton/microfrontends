import 'dart:io';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:app_user/core/core.dart';
import 'value_objects.dart';

part 'cart_item.freezed.dart';

@freezed
class CartItem with _$CartItem {
  const CartItem._();

  const factory CartItem({
    List6<File>? images,
    String? description,
    required UniqueId id,
    required DateTime time,
    required TimeOfDay timeOfDay,
  }) = _CartItem;

  int get serviceId => 1;
  double get rating => 5.0;
  String? get image => null;
  double get price => 220022;
  String get name => 'Item name ${id.getOrCrash()}';

  factory CartItem.random() => CartItem(
      id: UniqueId(),
      time: DateTime.now(),
      timeOfDay: const TimeOfDay(hour: 0, minute: 0));
}
