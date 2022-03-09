/* spell-checker: disable */
import 'dart:math';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'entities.freezed.dart';
part 'entities.g.dart';

const _kImg =
    'https://www.strategiesonline.net/wp-content/uploads/2014/09/laundry-service.png';
const _kDescription =
    'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or ransomed words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.';

@freezed
class Service with _$Service {
  const Service._();

  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Service({
    String? image,
    dynamic status,
    dynamic deletedAt,
    required int id,
    required DateTime createdAt,
    required DateTime updatedAt,
    required int parent,
    required String name,
    required String description,
    required double priceApprox,
  }) = _Service;

  factory Service.fromJson(Map<String, dynamic> json) =>
      _$ServiceFromJson(json);

  factory Service.random() {
    final _id = Random().nextInt(1000);

    return Service(
        id: _id,
        parent: 1,
        image: _kImg,
        priceApprox: 2000000,
        name: 'Service name $_id',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        description: _kDescription);
  }
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
