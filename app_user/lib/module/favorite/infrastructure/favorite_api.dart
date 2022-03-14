import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:app_user/core/core.dart';

part 'favorite_api.g.dart';

@RestApi(baseUrl: 'https://daiminhquang.acecom.vn/api/v1/favorites')
abstract class FavoriteApi {
  factory FavoriteApi(Dio dio, {String baseUrl}) = _FavoriteApi;

  @DELETE('')
  @Headers(authHeader)
  Future<BaseResponse<dynamic>> delete(
      @Field('technician_id') int technicianId);

  @POST('')
  @Headers(authHeader)
  Future<BaseResponse<dynamic>> create(
      @Field('technician_id') int technicianId);

  @GET('')
  @Headers(authHeader)
  Future<BaseResponse<dynamic>> all(
      {@Field() required int page, @Field() required int limit});
}
