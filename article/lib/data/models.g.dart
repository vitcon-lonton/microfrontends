// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse<T> _$BaseResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    BaseResponse<T>(
      msg: json['msg'] as String?,
      data: _$nullableGenericFromJson(json['data'], fromJsonT),
      success: json['success'] as bool?,
    );

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

_$_Article _$$_ArticleFromJson(Map<String, dynamic> json) => _$_Article(
      id: json['id'] as int?,
      image: json['image'] as String?,
      order: json['order'],
      status: json['status'] as int?,
      slug: json['slug'] as String?,
      isFeature: json['isFeature'] as int?,
      metaTitle: json['metaTitle'] as String?,
      metaKeyword: json['metaKeyword'] as String?,
      metaDescription: json['metaDescription'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      title: json['title'] as String?,
      content: json['content'] as String?,
      catalogueId: json['catalogueId'] as int?,
    );

Map<String, dynamic> _$$_ArticleToJson(_$_Article instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'order': instance.order,
      'status': instance.status,
      'slug': instance.slug,
      'isFeature': instance.isFeature,
      'metaTitle': instance.metaTitle,
      'metaKeyword': instance.metaKeyword,
      'metaDescription': instance.metaDescription,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'title': instance.title,
      'content': instance.content,
      'catalogueId': instance.catalogueId,
    };
