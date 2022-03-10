import 'package:freezed_annotation/freezed_annotation.dart';

import '../domain/entities.dart';

part 'models.freezed.dart';
part 'models.g.dart';

extension CatalogueDtoExt on CatalogueDto {
  Catalogue toDomain() => Catalogue.fromJson(toJson());
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
