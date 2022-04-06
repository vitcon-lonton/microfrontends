/* spell-checker: disable */
import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:app_user/core/core.dart';

part 'notification_api.g.dart';

@RestApi(baseUrl: 'https://shome.246.vn/api/v1/notifications')
abstract class NotificationApi {
  factory NotificationApi(Dio dio, {String baseUrl}) = _NotificationApi;

  @GET('/info')
  @Headers(authHeader)
  Future<BaseResponse<dynamic>> info();
}
