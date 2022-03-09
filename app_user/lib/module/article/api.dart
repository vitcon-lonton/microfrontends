/* spell-checker: disable */
import 'package:dio/dio.dart' hide Headers;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:retrofit/retrofit.dart';

part 'api.g.dart';

const cache = CacheControl(maxAge: 172800, maxStale: 172800);

@RestApi(baseUrl: 'https://daiminhquang.acecom.vn/api/v1/articles')
abstract class ArticleApi {
  factory ArticleApi(Dio dio, {String baseUrl}) = _ArticleApi;

  @GET('')
  Future<BaseResponse<List<Article>>> getArticles();

  @GET('/{id}')
  Future<BaseResponse<Article>> getArticleDetail(@Path() int id);
}

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

@JsonSerializable(fieldRename: FieldRename.snake)
class Article {
  final int? id;
  final String? image;
  final dynamic order;
  final int? status;
  final String? slug;
  final int? isFeature;
  final String? metaTitle;
  final String? metaKeyword;
  final String? metaDescription;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? title;
  final String? content;
  final int? catalogueId;

  Article(
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

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}



















// part 'api.freezed.dart';
// @freezed
// class Article with _$Article {
//   const factory Article({
//     int? id,
//     String? image,
//     dynamic order,
//     int? status,
//     String? slug,
//     int? isFeature,
//     String? metaTitle,
//     String? metaKeyword,
//     String? metaDescription,
//     DateTime? createdAt,
//     DateTime? updatedAt,
//     String? title,
//     String? content,
//     int? catalogueId,
//   }) = _Article;

//   factory Article.fromJson(Map<String, dynamic> json) =>
//       _$ArticleFromJson(json);
// }