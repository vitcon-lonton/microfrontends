part of 'api.dart';

@freezed
class GetAllData with _$GetAllData {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory GetAllData(
      {required Meta meta, required List<Service> services}) = _GetAllData;

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

@freezed
class CatalogueDto with _$CatalogueDto {
  const factory CatalogueDto({
    int? id,
    int? taxon,
    String? name,
    String? fullname,
    String? customBanner,
    dynamic intro,
    String? image,
    String? parent,
    int? order,
    String? level,
    int? group,
    String? lists,
    int? status,
    String? slug,
    int? isFeature,
    dynamic collectProduct,
    dynamic collectBrand,
    String? metaTitle,
    String? metaKeyword,
    String? metaDescription,
    DateTime? createdAt,
    DateTime? updatedAt,
    dynamic isHome,
  }) = _CatalogueDto;

  factory CatalogueDto.fromJson(Map<String, dynamic> json) =>
      _$CatalogueDtoFromJson(json);
}
