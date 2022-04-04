import 'package:flutter/material.dart';
import 'package:kt_dart/collection.dart';
import 'package:app_user/core/core.dart';
import '../domain/booking_time.dart';
import '../domain/cart_item.dart';
import '../domain/value_objects.dart';
import 'cart_item_dto.dart';

extension CartItemDtoX on CartItemDto {
  BookingTime toBookingTime() {
    return BookingTime(
        date: timeStart,
        timeEnd: TimeOfDay(hour: timeEnd.hour, minute: timeEnd.minute),
        timeStart: TimeOfDay(hour: timeStart.hour, minute: timeStart.minute));
  }

  CartItem toDomain() {
    return CartItem(
      time: toBookingTime(),
      serviceId: serviceId,
      id: UniqueId.fromUniqueString(id),
      note: note == null ? null : ItemNote(note!),
      base64Images: images == null ? null : List6(KtList.from(images!)),
    );
  }
}

extension CartItemDomainX on CartItem {
  DateTime timeStart() {
    return DateTime(time.date.year, time.date.month, time.date.day,
        time.timeStart.hour, time.timeStart.minute);
  }

  DateTime timeEnd() {
    return DateTime(time.date.year, time.date.month, time.date.day,
        time.timeEnd.hour, time.timeEnd.minute);
  }

  CartItemDto toDto() {
    return CartItemDto(
      timeStart: timeStart(),
      timeEnd: timeEnd(),
      id: id.getOrCrash(),
      serviceId: serviceId,
      note: note?.getOrCrash(),
      images: base64Images?.getOrCrash().asList(),
    );
  }
}
