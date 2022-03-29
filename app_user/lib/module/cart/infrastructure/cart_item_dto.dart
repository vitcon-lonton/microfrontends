// import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

// part 'cart_item_dto.freezed.dart';
part 'cart_item_dto.g.dart';

// @freezed
// class CartItemDto with _$CartItemDto {
//   @HiveType(typeId: 1, adapterName: 'CartItemDtoAdapter')
//   const factory CartItemDto({
//     @HiveField(5) String? note,
//     @HiveField(4) List<String>? images,
//     @HiveField(0) required String id,
//     @HiveField(1) required int serviceId,
//     @HiveField(2) required DateTime time,
//     @HiveField(3) required DateTime timeOfDay,
//   }) = _CartItemDto;

//   factory CartItemDto.fromJson(Map<String, dynamic> json) =>
//       _$CartItemDtoFromJson(json);
// }

@HiveType(typeId: 0)
@JsonSerializable()
class CartItemDto {
  @HiveField(0)
  String id;

  @HiveField(5)
  String? note;

  @HiveField(4)
  List<String>? images;

  @HiveField(1)
  int serviceId;

  @HiveField(2)
  DateTime time;

  @HiveField(3)
  DateTime timeOfDay;

  CartItemDto({
    this.note,
    this.images,
    required this.id,
    required this.serviceId,
    required this.time,
    required this.timeOfDay,
  });

  factory CartItemDto.fromJson(Map<String, dynamic> json) =>
      _$CartItemDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CartItemDtoToJson(this);
}

// @freezed
// class HiveLanguage with _$HiveLanguage {
//   @HiveType(typeId: 1, adapterName: 'HiveLanguageAdapter')
//   const factory HiveLanguage({
//     @HiveField(0) int? id,
//     @HiveField(1) String? languageName,
//     @HiveField(2) String? resourceKey,
//     @HiveField(3) String? uniqueId,
//     @HiveField(4) String? languageCode,
//     @HiveField(6) String? remarks,
//     @HiveField(7) String? displayName,
//     @HiveField(8) bool? isActive,
//   }) = _HiveLanguage;

//   factory HiveLanguage.fromJson(Map<String, dynamic> json) =>
//       _$HiveLanguageFromJson(json);
// }
