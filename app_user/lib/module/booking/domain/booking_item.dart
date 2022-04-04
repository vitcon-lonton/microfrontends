import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:app_user/core/core.dart';
part 'booking_item.freezed.dart';

@freezed
class BookingItem with _$BookingItem {
  const BookingItem._();
  const factory BookingItem(
      {required int serviceId,
      required DateTime startTime,
      required DateTime endTime,
      String? description,
      List6<String>? images}) = _BookingItem;
}
