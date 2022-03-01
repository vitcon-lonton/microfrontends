// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Article _$ArticleFromJson(Map<String, dynamic> json) {
  return _Article.fromJson(json);
}

/// @nodoc
class _$ArticleTearOff {
  const _$ArticleTearOff();

  _Article call(
      {int? id,
      String? image,
      dynamic order,
      int? status,
      String? slug,
      int? isFeature,
      String? metaTitle,
      String? metaKeyword,
      String? metaDescription,
      DateTime? createdAt,
      DateTime? updatedAt,
      String? title,
      String? content,
      int? catalogueId}) {
    return _Article(
      id: id,
      image: image,
      order: order,
      status: status,
      slug: slug,
      isFeature: isFeature,
      metaTitle: metaTitle,
      metaKeyword: metaKeyword,
      metaDescription: metaDescription,
      createdAt: createdAt,
      updatedAt: updatedAt,
      title: title,
      content: content,
      catalogueId: catalogueId,
    );
  }

  Article fromJson(Map<String, Object?> json) {
    return Article.fromJson(json);
  }
}

/// @nodoc
const $Article = _$ArticleTearOff();

/// @nodoc
mixin _$Article {
  int? get id => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  dynamic get order => throw _privateConstructorUsedError;
  int? get status => throw _privateConstructorUsedError;
  String? get slug => throw _privateConstructorUsedError;
  int? get isFeature => throw _privateConstructorUsedError;
  String? get metaTitle => throw _privateConstructorUsedError;
  String? get metaKeyword => throw _privateConstructorUsedError;
  String? get metaDescription => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get content => throw _privateConstructorUsedError;
  int? get catalogueId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArticleCopyWith<Article> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArticleCopyWith<$Res> {
  factory $ArticleCopyWith(Article value, $Res Function(Article) then) =
      _$ArticleCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      String? image,
      dynamic order,
      int? status,
      String? slug,
      int? isFeature,
      String? metaTitle,
      String? metaKeyword,
      String? metaDescription,
      DateTime? createdAt,
      DateTime? updatedAt,
      String? title,
      String? content,
      int? catalogueId});
}

/// @nodoc
class _$ArticleCopyWithImpl<$Res> implements $ArticleCopyWith<$Res> {
  _$ArticleCopyWithImpl(this._value, this._then);

  final Article _value;
  // ignore: unused_field
  final $Res Function(Article) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? image = freezed,
    Object? order = freezed,
    Object? status = freezed,
    Object? slug = freezed,
    Object? isFeature = freezed,
    Object? metaTitle = freezed,
    Object? metaKeyword = freezed,
    Object? metaDescription = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? title = freezed,
    Object? content = freezed,
    Object? catalogueId = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      order: order == freezed
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as dynamic,
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
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      catalogueId: catalogueId == freezed
          ? _value.catalogueId
          : catalogueId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$ArticleCopyWith<$Res> implements $ArticleCopyWith<$Res> {
  factory _$ArticleCopyWith(_Article value, $Res Function(_Article) then) =
      __$ArticleCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      String? image,
      dynamic order,
      int? status,
      String? slug,
      int? isFeature,
      String? metaTitle,
      String? metaKeyword,
      String? metaDescription,
      DateTime? createdAt,
      DateTime? updatedAt,
      String? title,
      String? content,
      int? catalogueId});
}

/// @nodoc
class __$ArticleCopyWithImpl<$Res> extends _$ArticleCopyWithImpl<$Res>
    implements _$ArticleCopyWith<$Res> {
  __$ArticleCopyWithImpl(_Article _value, $Res Function(_Article) _then)
      : super(_value, (v) => _then(v as _Article));

  @override
  _Article get _value => super._value as _Article;

  @override
  $Res call({
    Object? id = freezed,
    Object? image = freezed,
    Object? order = freezed,
    Object? status = freezed,
    Object? slug = freezed,
    Object? isFeature = freezed,
    Object? metaTitle = freezed,
    Object? metaKeyword = freezed,
    Object? metaDescription = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? title = freezed,
    Object? content = freezed,
    Object? catalogueId = freezed,
  }) {
    return _then(_Article(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      order: order == freezed
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as dynamic,
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
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      catalogueId: catalogueId == freezed
          ? _value.catalogueId
          : catalogueId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Article implements _Article {
  const _$_Article(
      {this.id,
      this.image,
      this.order,
      this.status,
      this.slug,
      this.isFeature,
      this.metaTitle,
      this.metaKeyword,
      this.metaDescription,
      this.createdAt,
      this.updatedAt,
      this.title,
      this.content,
      this.catalogueId});

  factory _$_Article.fromJson(Map<String, dynamic> json) =>
      _$$_ArticleFromJson(json);

  @override
  final int? id;
  @override
  final String? image;
  @override
  final dynamic order;
  @override
  final int? status;
  @override
  final String? slug;
  @override
  final int? isFeature;
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
  final String? title;
  @override
  final String? content;
  @override
  final int? catalogueId;

  @override
  String toString() {
    return 'Article(id: $id, image: $image, order: $order, status: $status, slug: $slug, isFeature: $isFeature, metaTitle: $metaTitle, metaKeyword: $metaKeyword, metaDescription: $metaDescription, createdAt: $createdAt, updatedAt: $updatedAt, title: $title, content: $content, catalogueId: $catalogueId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Article &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.image, image) &&
            const DeepCollectionEquality().equals(other.order, order) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.slug, slug) &&
            const DeepCollectionEquality().equals(other.isFeature, isFeature) &&
            const DeepCollectionEquality().equals(other.metaTitle, metaTitle) &&
            const DeepCollectionEquality()
                .equals(other.metaKeyword, metaKeyword) &&
            const DeepCollectionEquality()
                .equals(other.metaDescription, metaDescription) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.content, content) &&
            const DeepCollectionEquality()
                .equals(other.catalogueId, catalogueId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(image),
      const DeepCollectionEquality().hash(order),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(slug),
      const DeepCollectionEquality().hash(isFeature),
      const DeepCollectionEquality().hash(metaTitle),
      const DeepCollectionEquality().hash(metaKeyword),
      const DeepCollectionEquality().hash(metaDescription),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(updatedAt),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(content),
      const DeepCollectionEquality().hash(catalogueId));

  @JsonKey(ignore: true)
  @override
  _$ArticleCopyWith<_Article> get copyWith =>
      __$ArticleCopyWithImpl<_Article>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ArticleToJson(this);
  }
}

abstract class _Article implements Article {
  const factory _Article(
      {int? id,
      String? image,
      dynamic order,
      int? status,
      String? slug,
      int? isFeature,
      String? metaTitle,
      String? metaKeyword,
      String? metaDescription,
      DateTime? createdAt,
      DateTime? updatedAt,
      String? title,
      String? content,
      int? catalogueId}) = _$_Article;

  factory _Article.fromJson(Map<String, dynamic> json) = _$_Article.fromJson;

  @override
  int? get id;
  @override
  String? get image;
  @override
  dynamic get order;
  @override
  int? get status;
  @override
  String? get slug;
  @override
  int? get isFeature;
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
  String? get title;
  @override
  String? get content;
  @override
  int? get catalogueId;
  @override
  @JsonKey(ignore: true)
  _$ArticleCopyWith<_Article> get copyWith =>
      throw _privateConstructorUsedError;
}
