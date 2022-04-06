/* spell-checker: disable */
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart' hide Headers;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:app_user/core/core.dart';
part 'booking_api.freezed.dart';
part 'booking_api.g.dart';
part 'booking_detail_dto.dart';
part 'booking_dto.dart';
part 'request_dto.dart';
part 'response_dto.dart';
part 'technician_dto.dart';

@RestApi(baseUrl: 'https://shome.246.vn/api/v1/')
abstract class BookingApi {
  factory BookingApi(Dio dio, {String baseUrl}) = _BookingApi;

  @DELETE('/bookings/{id}')
  @Headers(authHeader)
  Future<BaseResponse<dynamic>> delete(@Path() int id);

  @GET('/bookings/{id}')
  @Headers(authHeader)
  Future<BaseResponse<BookingDto>> detail(@Path() int id);

  @POST('/bookings')
  @Headers(authHeader)
  Future<BaseResponse<List<BookingDto>>> create({
    @Part(name: 'address') String? address,
    @Part(name: 'longitude') String? longitude,
    @Part(name: 'latitude') String? latitude,
    @Part(name: 'phonenumber') String? phoneNumber,
    @Part(name: 'fullname') required String fullName,
    @Part(name: 'service_ids') required String serviceIds,
    @Part(name: 'booking_details_attributes')
        required Map<String, BookingItemDto> attributes,
    @Part(name: 'timeboxing_start') required String timeBoxingStart,
    @Part(name: 'timeboxing_end') required String timeBoxingEnd,
  });

  @PUT('/bookings/{id}')
  @Headers(authHeader)
  Future<BaseResponse<BookingDto>> update(@Path() int id,
      {@Part(name: 'service_id') required int serviceId,
      @Part(name: 'fullname') required String fullName,
      @Part(name: 'timeboxing_start') String? timeBoxingStart,
      @Part(name: 'timeboxing_end') String? timeBoxingEnd,
      @Part(name: 'description') String? description,
      @Part(name: 'address') String? address,
      @Part(name: 'longitude') String? longitude,
      @Part(name: 'latitude') String? latitude,
      @Part(name: 'phonenumber') String? phoneNumber,
      @Part(name: 'booking_images') List<File>? bookingImages});

  @GET('/bookings')
  @Headers(authHeader)
  Future<BaseResponse<List<BookingDto>>> bookings(
      {@Field() int? page, @Field() int? limit});

  @GET('/bookings/technician_info')
  @Headers(authHeader)
  Future<BaseResponse<TechnicianDto>> technicianInfo(
      @Query('booking_id') int id);

  @GET('/bookings/get_service_ids/{id}')
  @Headers(authHeader)
  Future<BaseResponse<GetServiceIdsResponse>> getServiceIds(@Path() int id);

  @PUT('/bookings/booking_confirm/{id}')
  @Headers(authHeader)
  Future<BaseResponse<String>> confirm(@Path() int id,
      {@Part(name: 'status_kh') String? statusKh = 'kh_accepted'});

  @PUT('/bookings/booking_cancelled/{id}')
  @Headers(authHeader)
  Future<BaseResponse<String>> cancelled(@Path() int id,
      {@Part(name: 'status') String? status = 'cancelled'});
}
