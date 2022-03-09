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

Service _$ServiceFromJson(Map<String, dynamic> json) {
  return _Service.fromJson(json);
}

/// @nodoc
class _$ServiceTearOff {
  const _$ServiceTearOff();

  _Service call(
      {String? image,
      dynamic status,
      dynamic deletedAt,
      required int id,
      required DateTime createdAt,
      required DateTime updatedAt,
      required int parent,
      required String name,
      required String description,
      required double priceApprox}) {
    return _Service(
      image: image,
      status: status,
      deletedAt: deletedAt,
      id: id,
      createdAt: createdAt,
      updatedAt: updatedAt,
      parent: parent,
      name: name,
      description: description,
      priceApprox: priceApprox,
    );
  }

  Service fromJson(Map<String, Object?> json) {
    return Service.fromJson(json);
  }
}

/// @nodoc
const $Service = _$ServiceTearOff();

/// @nodoc
mixin _$Service {
  String? get image => throw _privateConstructorUsedError;
  dynamic get status => throw _privateConstructorUsedError;
  dynamic get deletedAt => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  int get parent => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  double get priceApprox => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServiceCopyWith<Service> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceCopyWith<$Res> {
  factory $ServiceCopyWith(Service value, $Res Function(Service) then) =
      _$ServiceCopyWithImpl<$Res>;
  $Res call(
      {String? image,
      dynamic status,
      dynamic deletedAt,
      int id,
      DateTime createdAt,
      DateTime updatedAt,
      int parent,
      String name,
      String description,
      double priceApprox});
}

/// @nodoc
class _$ServiceCopyWithImpl<$Res> implements $ServiceCopyWith<$Res> {
  _$ServiceCopyWithImpl(this._value, this._then);

  final Service _value;
  // ignore: unused_field
  final $Res Function(Service) _then;

  @override
  $Res call({
    Object? image = freezed,
    Object? status = freezed,
    Object? deletedAt = freezed,
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? parent = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? priceApprox = freezed,
  }) {
    return _then(_value.copyWith(
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as dynamic,
      deletedAt: deletedAt == freezed
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      parent: parent == freezed
          ? _value.parent
          : parent // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      priceApprox: priceApprox == freezed
          ? _value.priceApprox
          : priceApprox // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$ServiceCopyWith<$Res> implements $ServiceCopyWith<$Res> {
  factory _$ServiceCopyWith(_Service value, $Res Function(_Service) then) =
      __$ServiceCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? image,
      dynamic status,
      dynamic deletedAt,
      int id,
      DateTime createdAt,
      DateTime updatedAt,
      int parent,
      String name,
      String description,
      double priceApprox});
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
    Object? image = freezed,
    Object? status = freezed,
    Object? deletedAt = freezed,
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? parent = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? priceApprox = freezed,
  }) {
    return _then(_Service(
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as dynamic,
      deletedAt: deletedAt == freezed
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      parent: parent == freezed
          ? _value.parent
          : parent // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      priceApprox: priceApprox == freezed
          ? _value.priceApprox
          : priceApprox // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_Service extends _Service {
  const _$_Service(
      {this.image,
      this.status,
      this.deletedAt,
      required this.id,
      required this.createdAt,
      required this.updatedAt,
      required this.parent,
      required this.name,
      required this.description,
      required this.priceApprox})
      : super._();

  factory _$_Service.fromJson(Map<String, dynamic> json) =>
      _$$_ServiceFromJson(json);

  @override
  final String? image;
  @override
  final dynamic status;
  @override
  final dynamic deletedAt;
  @override
  final int id;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final int parent;
  @override
  final String name;
  @override
  final String description;
  @override
  final double priceApprox;

  @override
  String toString() {
    return 'Service(image: $image, status: $status, deletedAt: $deletedAt, id: $id, createdAt: $createdAt, updatedAt: $updatedAt, parent: $parent, name: $name, description: $description, priceApprox: $priceApprox)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Service &&
            const DeepCollectionEquality().equals(other.image, image) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.deletedAt, deletedAt) &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt) &&
            const DeepCollectionEquality().equals(other.parent, parent) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality()
                .equals(other.priceApprox, priceApprox));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(image),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(deletedAt),
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(updatedAt),
      const DeepCollectionEquality().hash(parent),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(priceApprox));

  @JsonKey(ignore: true)
  @override
  _$ServiceCopyWith<_Service> get copyWith =>
      __$ServiceCopyWithImpl<_Service>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ServiceToJson(this);
  }
}

abstract class _Service extends Service {
  const factory _Service(
      {String? image,
      dynamic status,
      dynamic deletedAt,
      required int id,
      required DateTime createdAt,
      required DateTime updatedAt,
      required int parent,
      required String name,
      required String description,
      required double priceApprox}) = _$_Service;
  const _Service._() : super._();

  factory _Service.fromJson(Map<String, dynamic> json) = _$_Service.fromJson;

  @override
  String? get image;
  @override
  dynamic get status;
  @override
  dynamic get deletedAt;
  @override
  int get id;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  int get parent;
  @override
  String get name;
  @override
  String get description;
  @override
  double get priceApprox;
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
