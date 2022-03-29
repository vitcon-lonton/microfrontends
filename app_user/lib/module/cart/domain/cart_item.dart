/* spell-checker: disable */
import 'package:dartz/dartz.dart' hide id;
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:app_user/core/core.dart';
import 'value_objects.dart';

part 'cart_item.freezed.dart';

@freezed
class CartItem with _$CartItem {
  const CartItem._();
  const factory CartItem(
      {required UniqueId id,
      required int serviceId,
      required DateTime time,
      required TimeOfDay timeOfDay,
      ItemNote? note,
      List6<String>? base64Images}) = _CartItem;

  factory CartItem.random({required int serviceId}) {
    return CartItem(
        id: UniqueId(),
        serviceId: serviceId,
        time: DateTime.now(),
        timeOfDay: const TimeOfDay(hour: 0, minute: 0));
  }

  Option<ValueFailure<dynamic>> get failureOption {
    if (note != null && note!.isValid() == false) {
      return note!.failureOrUnit.fold(some, (_) => none());
    }

    if (base64Images != null && base64Images!.isValid() == false) {
      return base64Images!.failureOrUnit.fold(some, (_) => none());
    }

    // return body.failureOrUnit
    //     .andThen(todos.failureOrUnit)
    //     .andThen(
    //       todos
    //           .getOrCrash()
    //           // Getting the failureOption from the TodoItem ENTITY - NOT a failureOrUnit from a VALUE OBJECT
    //           .map((todoItem) => todoItem.failureOption)
    //           .filter((o) => o.isSome())
    //           // If we can't get the 0th element, the list is empty. In such a case, it's valid.
    //           .getOrElse(0, (_) => none())
    //           .fold(() => right(unit), (f) => left(f)),
    //     )
    //     .fold((f) => some(f), (_) => none());

    return none();
  }
}
