part of 'favorite_api.dart';

@freezed
class GetAllData with _$GetAllData {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory GetAllData({
    required Meta meta,
    required List<Favorite> favorites,
  }) = _GetAllData;

  factory GetAllData.fromJson(Map<String, dynamic> json) =>
      _$GetAllDataFromJson(json);
}

@freezed
class Meta with _$Meta {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Meta(
      {required int totalPages,
      required int currentPage,
      dynamic nextPage,
      dynamic prevPage}) = _Meta;

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
}
