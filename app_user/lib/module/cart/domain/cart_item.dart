/* spell-checker: disable */
import 'package:dartz/dartz.dart' hide id;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:app_user/core/core.dart';
import 'booking_time.dart';
import 'value_objects.dart';

part 'cart_item.freezed.dart';

@freezed
class CartItem with _$CartItem {
  const CartItem._();

  const factory CartItem(
      {required UniqueId id,
      required int serviceId,
      required BookingTime time,
      ItemNote? note,
      List6<String>? base64Images}) = _CartItem;

  factory CartItem.random({required int serviceId}) {
    return CartItem(
      id: UniqueId(),
      serviceId: serviceId,
      time: BookingTime.empty(),
    );
  }

  Option<ValueFailure<dynamic>> get failureOption {
    return time.failureOrUnit.fold((failure) => some(failure), (_) {
      if (note != null) {
        return note!.failureOrUnit.fold(some, (_) => none());
      }

      if (base64Images != null) {
        return base64Images!.failureOrUnit.fold(some, (_) => none());
      }

      return none();
    });
  }
}
