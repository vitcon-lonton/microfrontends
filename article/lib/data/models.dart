import 'package:freezed_annotation/freezed_annotation.dart';

part 'models.freezed.dart';
part 'models.g.dart';

@JsonSerializable(createToJson: false, genericArgumentFactories: true)
class BaseResponse<T> {
  final T? data;
  final String? msg;
  final bool? success;

  bool get valid => (success ?? false);

  BaseResponse({this.msg, this.data, this.success});

  factory BaseResponse.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$BaseResponseFromJson(json, fromJsonT);
}

@freezed
class Article with _$Article {
  const factory Article({
    int? id,
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
    int? catalogueId,
  }) = _Article;

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);
}
