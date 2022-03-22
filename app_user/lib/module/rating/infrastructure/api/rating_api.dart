/* spell-checker: disable */
import 'package:dio/dio.dart' hide Headers;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:app_user/core/core.dart';

part 'rating_api.freezed.dart';
part 'rating_api.g.dart';
part 'request.dart';
part 'response.dart';

@RestApi(baseUrl: 'https://daiminhquang.acecom.vn/api/v1/')
abstract class RatingApi {
  factory RatingApi(Dio dio, {String baseUrl}) = _RatingApi;

  @POST('/ratings')
  @Headers(authHeader)
  Future<BaseResponse<dynamic>> create(
      {@Part(name: 'content') required String content,
      @Part(name: 'rating_score') required double ratingScore,
      @Part(name: 'technician_id') required int technicianId});

  @PUT('/ratings/{technicianId}')
  @Headers(authHeader)
  Future<BaseResponse<dynamic>> update(
      {@Path() required int technicianId,
      @Part(name: 'content') required String content,
      @Part(name: 'rating_score') required double ratingScore});

  @DELETE('/ratings/{technicianId}')
  @Headers(authHeader)
  Future<BaseResponse<dynamic>> delete(@Path() int technicianId);
}
