import 'package:flutter/material.dart';
import 'package:kt_dart/collection.dart';
import 'package:app_user/core/core.dart';
import 'package:app_user/module/cart/domain/value_objects.dart';
import '../domain/cart_item.dart';
import 'cart_item_dto.dart';

extension CartItemDtoX on CartItemDto {
  CartItem toDomain() {
    return CartItem(
      time: time,
      serviceId: serviceId,
      id: UniqueId.fromUniqueString(id),
      note: note == null ? null : ItemNote(note!),
      timeOfDay: const TimeOfDay(hour: 0, minute: 0),
      base64Images: images == null ? null : List6(KtList.from(images!)),
    );
  }
}

extension CartItemDomainX on CartItem {
  CartItemDto toDto() {
    return CartItemDto(
      time: time,
      id: id.getOrCrash(),
      serviceId: serviceId,
      note: note?.getOrCrash(),
      timeOfDay: DateTime.now(),
      images: base64Images?.getOrCrash().asList(),
    );
  }
}
