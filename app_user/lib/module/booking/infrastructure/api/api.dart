/* spell-checker: disable */
import 'package:dio/dio.dart' hide Headers;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:app_user/core/core.dart';

part 'api.freezed.dart';
part 'api.g.dart';
part 'request.dart';

@RestApi(baseUrl: 'https://daiminhquang.acecom.vn/api/v1/bookings')
abstract class BookingApi {
  factory BookingApi(Dio dio, {String baseUrl}) = _BookingApi;

  @DELETE('/{id}')
  @Headers(authHeader)
  Future<BaseResponse<dynamic>> delete(@Path() int id);

  @POST('')
  @Headers(authHeader)
  Future<BaseResponse<dynamic>> create(@Body() BookingDto data);

  @PUT('')
  @Headers(authHeader)
  Future<BaseResponse<dynamic>> update(@Body() BookingDto data);

  @GET('')
  @Headers(authHeader)
  Future<BaseResponse<dynamic>> bookings(
      {@Field() required int page, @Field() required int limit});
}
