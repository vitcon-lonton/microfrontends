/* spell-checker: disable */
import 'package:dio/dio.dart' hide Headers;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:app_user/core/core.dart';
part 'article_api.g.dart';

@RestApi(baseUrl: 'https://shome.246.vn/api/v1')
abstract class ArticleApi {
  factory ArticleApi(Dio dio, {String baseUrl}) = _ArticleApi;

  @GET('/articles')
  Future<BaseResponse<List<Article>>> all();

  @GET('/articles/{id}')
  Future<BaseResponse<Article>> detail(@Path() int id);
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