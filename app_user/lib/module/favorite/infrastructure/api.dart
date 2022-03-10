/* spell-checker: disable */
import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:app_user/core/core.dart';

part 'api.g.dart';

const authHeader = {'requires-token': 'true'};

@RestApi(baseUrl: 'https://daiminhquang.acecom.vn/api/v1/favorites')
abstract class FavoriteApi {
  factory FavoriteApi(Dio dio, {String baseUrl}) = _FavoriteApi;

  @POST('/logout')
  @Headers(authHeader)
  Future<BaseResponse<dynamic>> logout();
}
