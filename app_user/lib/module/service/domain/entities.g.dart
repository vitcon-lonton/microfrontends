// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Catalogue _$$_CatalogueFromJson(Map<String, dynamic> json) => _$_Catalogue(
      id: json['id'] as int?,
      taxon: json['taxon'] as int?,
      name: json['name'] as String?,
      fullname: json['fullname'] as String?,
      customBanner: json['customBanner'] as String?,
      intro: json['intro'],
      image: json['image'] as String?,
      parent: json['parent'] as String?,
      order: json['order'] as int?,
      level: json['level'] as String?,
      group: json['group'] as int?,
      lists: json['lists'] as String?,
      status: json['status'] as int?,
      slug: json['slug'] as String?,
      isFeature: json['isFeature'] as int?,
      collectProduct: json['collectProduct'],
      collectBrand: json['collectBrand'],
      metaTitle: json['metaTitle'] as String?,
      metaKeyword: json['metaKeyword'] as String?,
      metaDescription: json['metaDescription'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      isHome: json['isHome'],
    );

Map<String, dynamic> _$$_CatalogueToJson(_$_Catalogue instance) =>
    <String, dynamic>{
      'id': instance.id,
      'taxon': instance.taxon,
      'name': instance.name,
      'fullname': instance.fullname,
      'customBanner': instance.customBanner,
      'intro': instance.intro,
      'image': instance.image,
      'parent': instance.parent,
      'order': instance.order,
      'level': instance.level,
      'group': instance.group,
      'lists': instance.lists,
      'status': instance.status,
      'slug': instance.slug,
      'isFeature': instance.isFeature,
      'collectProduct': instance.collectProduct,
      'collectBrand': instance.collectBrand,
      'metaTitle': instance.metaTitle,
      'metaKeyword': instance.metaKeyword,
      'metaDescription': instance.metaDescription,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'isHome': instance.isHome,
    };
