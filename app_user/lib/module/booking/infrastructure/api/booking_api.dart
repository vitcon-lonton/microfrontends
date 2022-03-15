/* spell-checker: disable */
import 'dart:io';

import 'package:dio/dio.dart' hide Headers;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:app_user/core/core.dart';

part 'booking_api.freezed.dart';
part 'booking_api.g.dart';
part 'request.dart';
part 'response.dart';

@RestApi(baseUrl: 'https://daiminhquang.acecom.vn/api/v1/bookings')
abstract class BookingApi {
  factory BookingApi(Dio dio, {String baseUrl}) = _BookingApi;

  @DELETE('/{id}')
  @Headers(authHeader)
  Future<BaseResponse<dynamic>> delete(@Path() int id);

  @POST('')
  @Headers(authHeader)
  Future<BaseResponse<BookingDto>> create(
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

  @PUT('')
  @Headers(authHeader)
  Future<BaseResponse<BookingDto>> update(
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

  @GET('')
  @Headers(authHeader)
  Future<BaseResponse<List<BookingDto>>> bookings(
      {@Field() int? page, @Field() int? limit});
}
