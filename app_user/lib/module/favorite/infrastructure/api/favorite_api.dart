import 'package:dio/dio.dart' hide Headers;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:app_user/core/core.dart';
import '../../domain/favorite.dart';
part 'favorite_api.freezed.dart';
part 'favorite_api.g.dart';
part 'response.dart';

@RestApi(baseUrl: 'https://daiminhquang.acecom.vn/api/v1/')
abstract class FavoriteApi {
  factory FavoriteApi(Dio dio, {String baseUrl}) = _FavoriteApi;

  @GET('/favorites')
  @Headers(authHeader)
  Future<BaseResponse<GetAllData>> all();

  @GET('/favorites/service_check')
  @Headers(authHeader)
  Future<BaseResponse<Favorite>> check(@Query('service_id') int serviceId);

  @PUT('/favorites')
  @Headers(authHeader)
  Future<BaseResponse<dynamic>> delete(@Part(name: 'service_id') int serviceId);

  @POST('/favorites')
  @Headers(authHeader)
  Future<BaseResponse<dynamic>> create(@Part(name: 'service_id') int serviceId);
}
