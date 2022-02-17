import 'package:freezed_annotation/freezed_annotation.dart';

part 'entities.freezed.dart';
part 'entities.g.dart';

@freezed
class Service with _$Service {
  const factory Service({required String name}) = _Service;
}

@freezed
class Catalogue with _$Catalogue {
  const factory Catalogue({
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
  }) = _Catalogue;

  factory Catalogue.fromJson(Map<String, dynamic> json) =>
      _$CatalogueFromJson(json);
}
