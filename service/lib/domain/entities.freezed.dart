// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'entities.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ServiceTearOff {
  const _$ServiceTearOff();

  _Service call(
      {String img = _kImg,
      double rating = 0.0,
      String name = _kName,
      String price = '150\$',
      String description = _kDescription}) {
    return _Service(
      img: img,
      rating: rating,
      name: name,
      price: price,
      description: description,
    );
  }
}

/// @nodoc
const $Service = _$ServiceTearOff();

/// @nodoc
mixin _$Service {
  String get img => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ServiceCopyWith<Service> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceCopyWith<$Res> {
  factory $ServiceCopyWith(Service value, $Res Function(Service) then) =
      _$ServiceCopyWithImpl<$Res>;
  $Res call(
      {String img,
      double rating,
      String name,
      String price,
      String description});
}

/// @nodoc
class _$ServiceCopyWithImpl<$Res> implements $ServiceCopyWith<$Res> {
  _$ServiceCopyWithImpl(this._value, this._then);

  final Service _value;
  // ignore: unused_field
  final $Res Function(Service) _then;

  @override
  $Res call({
    Object? img = freezed,
    Object? rating = freezed,
    Object? name = freezed,
    Object? price = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      img: img == freezed
          ? _value.img
          : img // ignore: cast_nullable_to_non_nullable
              as String,
      rating: rating == freezed
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$ServiceCopyWith<$Res> implements $ServiceCopyWith<$Res> {
  factory _$ServiceCopyWith(_Service value, $Res Function(_Service) then) =
      __$ServiceCopyWithImpl<$Res>;
  @override
  $Res call(
      {String img,
      double rating,
      String name,
      String price,
      String description});
}

/// @nodoc
class __$ServiceCopyWithImpl<$Res> extends _$ServiceCopyWithImpl<$Res>
    implements _$ServiceCopyWith<$Res> {
  __$ServiceCopyWithImpl(_Service _value, $Res Function(_Service) _then)
      : super(_value, (v) => _then(v as _Service));

  @override
  _Service get _value => super._value as _Service;

  @override
  $Res call({
    Object? img = freezed,
    Object? rating = freezed,
    Object? name = freezed,
    Object? price = freezed,
    Object? description = freezed,
  }) {
    return _then(_Service(
      img: img == freezed
          ? _value.img
          : img // ignore: cast_nullable_to_non_nullable
              as String,
      rating: rating == freezed
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Service implements _Service {
  const _$_Service(
      {this.img = _kImg,
      this.rating = 0.0,
      this.name = _kName,
      this.price = '150\$',
      this.description = _kDescription});

  @JsonKey()
  @override
  final String img;
  @JsonKey()
  @override
  final double rating;
  @JsonKey()
  @override
  final String name;
  @JsonKey()
  @override
  final String price;
  @JsonKey()
  @override
  final String description;

  @override
  String toString() {
    return 'Service(img: $img, rating: $rating, name: $name, price: $price, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Service &&
            const DeepCollectionEquality().equals(other.img, img) &&
            const DeepCollectionEquality().equals(other.rating, rating) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.price, price) &&
            const DeepCollectionEquality()
                .equals(other.description, description));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(img),
      const DeepCollectionEquality().hash(rating),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(price),
      const DeepCollectionEquality().hash(description));

  @JsonKey(ignore: true)
  @override
  _$ServiceCopyWith<_Service> get copyWith =>
      __$ServiceCopyWithImpl<_Service>(this, _$identity);
}

abstract class _Service implements Service {
  const factory _Service(
      {String img,
      double rating,
      String name,
      String price,
      String description}) = _$_Service;

  @override
  String get img;
  @override
  double get rating;
  @override
  String get name;
  @override
  String get price;
  @override
  String get description;
  @override
  @JsonKey(ignore: true)
  _$ServiceCopyWith<_Service> get copyWith =>
      throw _privateConstructorUsedError;
}

Catalogue _$CatalogueFromJson(Map<String, dynamic> json) {
  return _Catalogue.fromJson(json);
}

/// @nodoc
class _$CatalogueTearOff {
  const _$CatalogueTearOff();

  _Catalogue call(
      {int? id,
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
      dynamic isHome}) {
    return _Catalogue(
      id: id,
      taxon: taxon,
      name: name,
      fullname: fullname,
      customBanner: customBanner,
      intro: intro,
      image: image,
      parent: parent,
      order: order,
      level: level,
      group: group,
      lists: lists,
      status: status,
      slug: slug,
      isFeature: isFeature,
      collectProduct: collectProduct,
      collectBrand: collectBrand,
      metaTitle: metaTitle,
      metaKeyword: metaKeyword,
      metaDescription: metaDescription,
      createdAt: createdAt,
      updatedAt: updatedAt,
      isHome: isHome,
    );
  }

  Catalogue fromJson(Map<String, Object?> json) {
    return Catalogue.fromJson(json);
  }
}

/// @nodoc
const $Catalogue = _$CatalogueTearOff();

/// @nodoc
mixin _$Catalogue {
  int? get id => throw _privateConstructorUsedError;
  int? get taxon => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get fullname => throw _privateConstructorUsedError;
  String? get customBanner => throw _privateConstructorUsedError;
  dynamic get intro => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  String? get parent => throw _privateConstructorUsedError;
  int? get order => throw _privateConstructorUsedError;
  String? get level => throw _privateConstructorUsedError;
  int? get group => throw _privateConstructorUsedError;
  String? get lists => throw _privateConstructorUsedError;
  int? get status => throw _privateConstructorUsedError;
  String? get slug => throw _privateConstructorUsedError;
  int? get isFeature => throw _privateConstructorUsedError;
  dynamic get collectProduct => throw _privateConstructorUsedError;
  dynamic get collectBrand => throw _privateConstructorUsedError;
  String? get metaTitle => throw _privateConstructorUsedError;
  String? get metaKeyword => throw _privateConstructorUsedError;
  String? get metaDescription => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  dynamic get isHome => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CatalogueCopyWith<Catalogue> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CatalogueCopyWith<$Res> {
  factory $CatalogueCopyWith(Catalogue value, $Res Function(Catalogue) then) =
      _$CatalogueCopyWithImpl<$Res>;
  $Res call(
      {int? id,
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
      dynamic isHome});
}

/// @nodoc
class _$CatalogueCopyWithImpl<$Res> implements $CatalogueCopyWith<$Res> {
  _$CatalogueCopyWithImpl(this._value, this._then);

  final Catalogue _value;
  // ignore: unused_field
  final $Res Function(Catalogue) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? taxon = freezed,
    Object? name = freezed,
    Object? fullname = freezed,
    Object? customBanner = freezed,
    Object? intro = freezed,
    Object? image = freezed,
    Object? parent = freezed,
    Object? order = freezed,
    Object? level = freezed,
    Object? group = freezed,
    Object? lists = freezed,
    Object? status = freezed,
    Object? slug = freezed,
    Object? isFeature = freezed,
    Object? collectProduct = freezed,
    Object? collectBrand = freezed,
    Object? metaTitle = freezed,
    Object? metaKeyword = freezed,
    Object? metaDescription = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? isHome = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      taxon: taxon == freezed
          ? _value.taxon
          : taxon // ignore: cast_nullable_to_non_nullable
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      fullname: fullname == freezed
          ? _value.fullname
          : fullname // ignore: cast_nullable_to_non_nullable
              as String?,
      customBanner: customBanner == freezed
          ? _value.customBanner
          : customBanner // ignore: cast_nullable_to_non_nullable
              as String?,
      intro: intro == freezed
          ? _value.intro
          : intro // ignore: cast_nullable_to_non_nullable
              as dynamic,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      parent: parent == freezed
          ? _value.parent
          : parent // ignore: cast_nullable_to_non_nullable
              as String?,
      order: order == freezed
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int?,
      level: level == freezed
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as String?,
      group: group == freezed
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as int?,
      lists: lists == freezed
          ? _value.lists
          : lists // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      slug: slug == freezed
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      isFeature: isFeature == freezed
          ? _value.isFeature
          : isFeature // ignore: cast_nullable_to_non_nullable
              as int?,
      collectProduct: collectProduct == freezed
          ? _value.collectProduct
          : collectProduct // ignore: cast_nullable_to_non_nullable
              as dynamic,
      collectBrand: collectBrand == freezed
          ? _value.collectBrand
          : collectBrand // ignore: cast_nullable_to_non_nullable
              as dynamic,
      metaTitle: metaTitle == freezed
          ? _value.metaTitle
          : metaTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      metaKeyword: metaKeyword == freezed
          ? _value.metaKeyword
          : metaKeyword // ignore: cast_nullable_to_non_nullable
              as String?,
      metaDescription: metaDescription == freezed
          ? _value.metaDescription
          : metaDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isHome: isHome == freezed
          ? _value.isHome
          : isHome // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
abstract class _$CatalogueCopyWith<$Res> implements $CatalogueCopyWith<$Res> {
  factory _$CatalogueCopyWith(
          _Catalogue value, $Res Function(_Catalogue) then) =
      __$CatalogueCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
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
      dynamic isHome});
}

/// @nodoc
class __$CatalogueCopyWithImpl<$Res> extends _$CatalogueCopyWithImpl<$Res>
    implements _$CatalogueCopyWith<$Res> {
  __$CatalogueCopyWithImpl(_Catalogue _value, $Res Function(_Catalogue) _then)
      : super(_value, (v) => _then(v as _Catalogue));

  @override
  _Catalogue get _value => super._value as _Catalogue;

  @override
  $Res call({
    Object? id = freezed,
    Object? taxon = freezed,
    Object? name = freezed,
    Object? fullname = freezed,
    Object? customBanner = freezed,
    Object? intro = freezed,
    Object? image = freezed,
    Object? parent = freezed,
    Object? order = freezed,
    Object? level = freezed,
    Object? group = freezed,
    Object? lists = freezed,
    Object? status = freezed,
    Object? slug = freezed,
    Object? isFeature = freezed,
    Object? collectProduct = freezed,
    Object? collectBrand = freezed,
    Object? metaTitle = freezed,
    Object? metaKeyword = freezed,
    Object? metaDescription = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? isHome = freezed,
  }) {
    return _then(_Catalogue(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      taxon: taxon == freezed
          ? _value.taxon
          : taxon // ignore: cast_nullable_to_non_nullable
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      fullname: fullname == freezed
          ? _value.fullname
          : fullname // ignore: cast_nullable_to_non_nullable
              as String?,
      customBanner: customBanner == freezed
          ? _value.customBanner
          : customBanner // ignore: cast_nullable_to_non_nullable
              as String?,
      intro: intro == freezed
          ? _value.intro
          : intro // ignore: cast_nullable_to_non_nullable
              as dynamic,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      parent: parent == freezed
          ? _value.parent
          : parent // ignore: cast_nullable_to_non_nullable
              as String?,
      order: order == freezed
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int?,
      level: level == freezed
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as String?,
      group: group == freezed
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as int?,
      lists: lists == freezed
          ? _value.lists
          : lists // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      slug: slug == freezed
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      isFeature: isFeature == freezed
          ? _value.isFeature
          : isFeature // ignore: cast_nullable_to_non_nullable
              as int?,
      collectProduct: collectProduct == freezed
          ? _value.collectProduct
          : collectProduct // ignore: cast_nullable_to_non_nullable
              as dynamic,
      collectBrand: collectBrand == freezed
          ? _value.collectBrand
          : collectBrand // ignore: cast_nullable_to_non_nullable
              as dynamic,
      metaTitle: metaTitle == freezed
          ? _value.metaTitle
          : metaTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      metaKeyword: metaKeyword == freezed
          ? _value.metaKeyword
          : metaKeyword // ignore: cast_nullable_to_non_nullable
              as String?,
      metaDescription: metaDescription == freezed
          ? _value.metaDescription
          : metaDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isHome: isHome == freezed
          ? _value.isHome
          : isHome // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Catalogue implements _Catalogue {
  const _$_Catalogue(
      {this.id,
      this.taxon,
      this.name,
      this.fullname,
      this.customBanner,
      this.intro,
      this.image,
      this.parent,
      this.order,
      this.level,
      this.group,
      this.lists,
      this.status,
      this.slug,
      this.isFeature,
      this.collectProduct,
      this.collectBrand,
      this.metaTitle,
      this.metaKeyword,
      this.metaDescription,
      this.createdAt,
      this.updatedAt,
      this.isHome});

  factory _$_Catalogue.fromJson(Map<String, dynamic> json) =>
      _$$_CatalogueFromJson(json);

  @override
  final int? id;
  @override
  final int? taxon;
  @override
  final String? name;
  @override
  final String? fullname;
  @override
  final String? customBanner;
  @override
  final dynamic intro;
  @override
  final String? image;
  @override
  final String? parent;
  @override
  final int? order;
  @override
  final String? level;
  @override
  final int? group;
  @override
  final String? lists;
  @override
  final int? status;
  @override
  final String? slug;
  @override
  final int? isFeature;
  @override
  final dynamic collectProduct;
  @override
  final dynamic collectBrand;
  @override
  final String? metaTitle;
  @override
  final String? metaKeyword;
  @override
  final String? metaDescription;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final dynamic isHome;

  @override
  String toString() {
    return 'Catalogue(id: $id, taxon: $taxon, name: $name, fullname: $fullname, customBanner: $customBanner, intro: $intro, image: $image, parent: $parent, order: $order, level: $level, group: $group, lists: $lists, status: $status, slug: $slug, isFeature: $isFeature, collectProduct: $collectProduct, collectBrand: $collectBrand, metaTitle: $metaTitle, metaKeyword: $metaKeyword, metaDescription: $metaDescription, createdAt: $createdAt, updatedAt: $updatedAt, isHome: $isHome)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Catalogue &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.taxon, taxon) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.fullname, fullname) &&
            const DeepCollectionEquality()
                .equals(other.customBanner, customBanner) &&
            const DeepCollectionEquality().equals(other.intro, intro) &&
            const DeepCollectionEquality().equals(other.image, image) &&
            const DeepCollectionEquality().equals(other.parent, parent) &&
            const DeepCollectionEquality().equals(other.order, order) &&
            const DeepCollectionEquality().equals(other.level, level) &&
            const DeepCollectionEquality().equals(other.group, group) &&
            const DeepCollectionEquality().equals(other.lists, lists) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.slug, slug) &&
            const DeepCollectionEquality().equals(other.isFeature, isFeature) &&
            const DeepCollectionEquality()
                .equals(other.collectProduct, collectProduct) &&
            const DeepCollectionEquality()
                .equals(other.collectBrand, collectBrand) &&
            const DeepCollectionEquality().equals(other.metaTitle, metaTitle) &&
            const DeepCollectionEquality()
                .equals(other.metaKeyword, metaKeyword) &&
            const DeepCollectionEquality()
                .equals(other.metaDescription, metaDescription) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt) &&
            const DeepCollectionEquality().equals(other.isHome, isHome));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        const DeepCollectionEquality().hash(id),
        const DeepCollectionEquality().hash(taxon),
        const DeepCollectionEquality().hash(name),
        const DeepCollectionEquality().hash(fullname),
        const DeepCollectionEquality().hash(customBanner),
        const DeepCollectionEquality().hash(intro),
        const DeepCollectionEquality().hash(image),
        const DeepCollectionEquality().hash(parent),
        const DeepCollectionEquality().hash(order),
        const DeepCollectionEquality().hash(level),
        const DeepCollectionEquality().hash(group),
        const DeepCollectionEquality().hash(lists),
        const DeepCollectionEquality().hash(status),
        const DeepCollectionEquality().hash(slug),
        const DeepCollectionEquality().hash(isFeature),
        const DeepCollectionEquality().hash(collectProduct),
        const DeepCollectionEquality().hash(collectBrand),
        const DeepCollectionEquality().hash(metaTitle),
        const DeepCollectionEquality().hash(metaKeyword),
        const DeepCollectionEquality().hash(metaDescription),
        const DeepCollectionEquality().hash(createdAt),
        const DeepCollectionEquality().hash(updatedAt),
        const DeepCollectionEquality().hash(isHome)
      ]);

  @JsonKey(ignore: true)
  @override
  _$CatalogueCopyWith<_Catalogue> get copyWith =>
      __$CatalogueCopyWithImpl<_Catalogue>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CatalogueToJson(this);
  }
}

abstract class _Catalogue implements Catalogue {
  const factory _Catalogue(
      {int? id,
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
      dynamic isHome}) = _$_Catalogue;

  factory _Catalogue.fromJson(Map<String, dynamic> json) =
      _$_Catalogue.fromJson;

  @override
  int? get id;
  @override
  int? get taxon;
  @override
  String? get name;
  @override
  String? get fullname;
  @override
  String? get customBanner;
  @override
  dynamic get intro;
  @override
  String? get image;
  @override
  String? get parent;
  @override
  int? get order;
  @override
  String? get level;
  @override
  int? get group;
  @override
  String? get lists;
  @override
  int? get status;
  @override
  String? get slug;
  @override
  int? get isFeature;
  @override
  dynamic get collectProduct;
  @override
  dynamic get collectBrand;
  @override
  String? get metaTitle;
  @override
  String? get metaKeyword;
  @override
  String? get metaDescription;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  dynamic get isHome;
  @override
  @JsonKey(ignore: true)
  _$CatalogueCopyWith<_Catalogue> get copyWith =>
      throw _privateConstructorUsedError;
}
