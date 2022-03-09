/* spell-checker: disable */
import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'models.dart';
part 'api.g.dart';

const authHeader = {'requires-token': 'true'};

@RestApi(baseUrl: 'https://daiminhquang.acecom.vn/api/v1/notifications')
abstract class NotificationApi {
  factory NotificationApi(Dio dio, {String baseUrl}) = _NotificationApi;

  @GET('/info')
  @Headers(authHeader)
  Future<BaseResponse<dynamic>> info();
}
