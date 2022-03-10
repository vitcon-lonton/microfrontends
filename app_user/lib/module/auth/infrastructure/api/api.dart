/* spell-checker: disable */
import 'package:dio/dio.dart' hide Headers;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:app_user/core/core.dart';

part 'api.freezed.dart';
part 'api.g.dart';
part 'request.dart';
part 'response.dart';

@RestApi(baseUrl: 'https://daiminhquang.acecom.vn/api/v1/account')
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
  Future<BaseResponse<dynamic>> register(@Body() RegisterData data);

  @POST('/change_current_password')
  @FormUrlEncoded()
  @Headers(authHeader)
  Future<BaseResponse<dynamic>> changeCurrentPassword(
      @Body() ChangeCurrentPasswordData data);
}
