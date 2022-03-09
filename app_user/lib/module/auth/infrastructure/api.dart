/* spell-checker: disable */
import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'models.dart';
part 'api.g.dart';

const authHeader = {'requires-token': 'true'};

@RestApi(baseUrl: 'https://daiminhquang.acecom.vn/api/v1/account')
abstract class AccountApi {
  factory AccountApi(Dio dio, {String baseUrl}) = _AccountApi;

  @GET('/info')
  @Headers(authHeader)
  Future<BaseResponse<dynamic>> info();

  @POST('/login')
  Future<BaseResponse<dynamic>> login(
    @Part() @Query('loginkey') String loginkey,
    @Part() @Query('password') String password, {
    @Query('device_id') String deviceId = 'android',
  });

  @POST('/register')
  @FormUrlEncoded()
  Future<BaseResponse<dynamic>> register(@Body() RegisterData data);

  @POST('/change_current_password')
  @FormUrlEncoded()
  @Headers(authHeader)
  Future<BaseResponse<dynamic>> changeCurrentPassword(
      @Body() ChangeCurrentPasswordData data);
}

// @Query('device_id') String deviceId
// @Query('loginkey') @Field() String loginkey,
// @Query('password') @Field() String password,