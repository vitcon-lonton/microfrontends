/* spell-checker: disable */
import 'package:dio/dio.dart' hide Headers;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:app_user/core/core.dart';
part 'account_api.freezed.dart';
part 'account_api.g.dart';
part 'request.dart';
part 'response.dart';

@RestApi(baseUrl: 'https://shome.246.vn/api/v1/account')
abstract class AccountApi {
  factory AccountApi(Dio dio, {String baseUrl}) = _AccountApi;

  @GET('/info')
  @Headers(authHeader)
  Future<BaseResponse<Credential>> info();

  @POST('/login')
  Future<BaseResponse<Credential>> login(
    @Part() @Query('loginkey') String loginkey,
    @Part() @Query('password') String password, {
    @Query('device_id') String deviceId = 'android',
  });

  @POST('/logout')
  @Headers(authHeader)
  Future<BaseResponse<dynamic>> logout();

  @POST('/register')
  @FormUrlEncoded()
  Future<BaseResponse<Credential>> register(@Body() RegisterData data);

  @POST('/change_current_password')
  @FormUrlEncoded()
  @Headers(authHeader)
  Future<BaseResponse<Credential>> changeCurrentPassword(
      @Body() ChangeCurrentPasswordData data);

  @POST('/update_user')
  @Headers(authHeader)
  Future<BaseResponse<dynamic>> update(
      {@Part() String? email,
      @Part(name: 'name') String? name,
      @Part(name: 'phone') String? phone,
      @Part(name: 'gender') String? gender,
      @Part(name: 'birthdate') String? birthDate,
      @Part(name: 'address') String? address,
      @Part(name: 'img') String? base64Img,
      @Part(name: 'img_format') String? imgFormat,
      @Part(name: 'district') String? district,
      @Part(name: 'district_id') String? districtId,
      @Part(name: 'city_id') String? cityId,
      @Part(name: 'city') String? city});

  @POST('/update_avarta')
  @Headers(authHeader)
  Future<BaseResponse<dynamic>> updateAvatar(
      @Part(name: 'img') String base64Img,
      {@Part(name: 'img_format') required String imgFormat});
}
