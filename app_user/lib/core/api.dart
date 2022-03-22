/* spell-checker: disable */
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';
import 'package:retrofit/retrofit.dart';
import 'package:app_user/injection.dart';
import 'errors.dart';
part 'api.g.dart';

const authHeader = {'requires-token': 'true'};
const cache = CacheControl(maxAge: 172800, maxStale: 172800);

@JsonSerializable(createToJson: false, genericArgumentFactories: true)
class BaseResponse<T> {
  final T? data;
  final String? msg;
  final bool? success;

  bool get valid => (success ?? false);

  BaseResponse({this.msg, this.data, this.success});

  factory BaseResponse.fromJson(
      Map<String, dynamic> json, T Function(Object? json) fromJsonT) {
    try {
      if (json['success'] != true) throw Exception();
      return _$BaseResponseFromJson(json, fromJsonT);
    } catch (e) {
      getIt<Logger>().e(e);
      throw ResponseDataError.fromJson(json['data']);
    }
  }

  // factory BaseResponse.fromJson(
  //     Map<String, dynamic> json, T Function(Object? json) fromJsonT) {
  //   return _$BaseResponseFromJson(json, fromJsonT);
  // }
}
