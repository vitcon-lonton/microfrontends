import 'package:freezed_annotation/freezed_annotation.dart';
part 'cart_item_dto.freezed.dart';
part 'cart_item_dto.g.dart';

@freezed
class CartItemDto with _$CartItemDto {
  const CartItemDto._();

  const factory CartItemDto({
    String? note,
    List<String>? images,
    required String id,
    required int serviceId,
    required DateTime time,
    required DateTime timeOfDay,
  }) = _CartItemDto;

  double get rating => 5.0;
  String? get image => null;
  double get price => 220022;
  String get name => 'Item name $id';

  factory CartItemDto.fromJson(Map<String, dynamic> json) =>
      _$CartItemDtoFromJson(json);
}
