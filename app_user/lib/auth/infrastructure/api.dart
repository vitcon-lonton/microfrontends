/* spell-checker: disable */
import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'models.dart';
part 'api.g.dart';

const loginUrl =
    '/login?loginkey=tanngoc93@gmail.com&password=123123&device_id=android';

@RestApi(baseUrl: 'https://daiminhquang.acecom.vn/api/v1/account')
abstract class AccountApi {
  factory AccountApi(Dio dio, {String baseUrl}) = _AccountApi;

  @POST('/login')
  @FormUrlEncoded()
  Future<BaseResponse<dynamic>> login(
      @Query('loginkey') @Field() String loginkey,
      @Query('password') @Field() String password,
      @Query('device_id') @Field() String deviceId);

  @POST('/register')
  @FormUrlEncoded()
  Future<BaseResponse<dynamic>> register(@Body() RegisterData data);
}
