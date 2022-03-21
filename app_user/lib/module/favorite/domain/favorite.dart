import 'package:freezed_annotation/freezed_annotation.dart';
part 'favorite.freezed.dart';
part 'favorite.g.dart';

@freezed
class Favorite with _$Favorite {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Favorite({
    required int id,
    required DateTime createdAt,
    required DateTime updatedAt,
    required int parent,
    required String name,
    String? description,
    double? priceApprox,
    String? image,
    dynamic deletedAt,
    int? warrantyPeriod,
    dynamic status,
  }) = _Favorite;

  factory Favorite.fromJson(Map<String, dynamic> json) =>
      _$FavoriteFromJson(json);
}
