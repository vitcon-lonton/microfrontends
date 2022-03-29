import 'dart:io';
import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:app_user/core/core.dart';
part 'file_api.g.dart';

@RestApi(baseUrl: 'https://daiminhquang.acecom.vn/api/v1')
abstract class FileApi {
  factory FileApi(Dio dio, {String baseUrl}) = _FileApi;

  @POST('/base/upload_many_file')
  Future<BaseResponse<List<String>>> upload(
      @Part(name: 'file[]') List<File> files);
}
