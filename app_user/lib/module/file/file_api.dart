import 'dart:io';
import 'package:dio/dio.dart' hide Headers;
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:app_user/core/core.dart';
part 'file_api.g.dart';

@RestApi(baseUrl: 'https://shome.246.vn/api/v1')
abstract class FileApi {
  factory FileApi(Dio dio, {String baseUrl}) = _FileApi;

  @POST('/base/upload_many_file')
  Future<BaseResponse<dynamic>> upload(@Part(name: 'file[]') List<File> files);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Image {
  String img;

  Image({required this.img});

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);
}
