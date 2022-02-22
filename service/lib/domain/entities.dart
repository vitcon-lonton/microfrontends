import 'package:freezed_annotation/freezed_annotation.dart';

part 'entities.freezed.dart';
part 'entities.g.dart';

const _kName = 'Pet Sitting service';
const _kImg =
    'https://facilityexecutive.com/wp-content/uploads/2016/08/FEJulyAug16-SM-Feature.jpg';
const _kDescription =
    'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or ransomed words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.';

@freezed
class Service with _$Service {
  const factory Service({
    @Default(_kImg) String img,
    @Default(0.0) double rating,
    @Default(_kName) String name,
    @Default('150\$') String price,
    @Default(_kDescription) String description,
  }) = _Service;
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
