import 'package:dio/dio.dart' hide Headers;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:app_user/core/core.dart';
part 'banner_api.freezed.dart';
part 'banner_api.g.dart';

@RestApi(baseUrl: 'https://daiminhquang.acecom.vn/api/v1')
abstract class BannerApi {
  factory BannerApi(Dio dio, {String baseUrl}) = _BannerApi;

  @GET('/base/option')
  Future<BaseResponse<List<BannerDto>>> banners(
      {@Query('key') String? key = 'app_banner'});
}

@freezed
class BannerDto with _$BannerDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory BannerDto({
    required int id,
    required String key,
    required String value,
  }) = _BannerDto;

  factory BannerDto.fromJson(Map<String, dynamic> json) =>
      _$BannerDtoFromJson(json);
}
