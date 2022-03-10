/* spell-checker: disable */
import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:app_user/core/core.dart';

part 'api.g.dart';

@RestApi(baseUrl: 'https://daiminhquang.acecom.vn/api/v1/notifications')
abstract class NotificationApi {
  factory NotificationApi(Dio dio, {String baseUrl}) = _NotificationApi;

  @GET('/info')
  @Headers(authHeader)
  Future<BaseResponse<dynamic>> info();
}
