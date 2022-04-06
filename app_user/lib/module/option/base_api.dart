import 'package:dio/dio.dart' hide Headers;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:app_user/core/core.dart';
part 'base_api.freezed.dart';
part 'base_api.g.dart';

@RestApi(baseUrl: 'https://shome.246.vn/api/v1')
abstract class BaseApi {
  factory BaseApi(Dio dio, {String baseUrl}) = _BaseApi;

  @GET('/base/option')
  Future<BaseResponse<List<OptionDto>>> banners(
      {@Query('key') String? key = 'app_banner'});

  @GET('/base/option')
  Future<BaseResponse<List<OptionDto>>> googleMapKey(
      {@Query('key') String? key = 'google_map_key'});
}

@freezed
class OptionDto with _$OptionDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory OptionDto(
      {required int id,
      required String key,
      required String value}) = _OptionDto;

  factory OptionDto.fromJson(Map<String, dynamic> json) =>
      _$OptionDtoFromJson(json);
}
