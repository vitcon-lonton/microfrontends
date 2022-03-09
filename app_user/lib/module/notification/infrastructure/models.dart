/* spell-checker: disable */
import 'package:freezed_annotation/freezed_annotation.dart';
part 'models.g.dart';
// part 'models.freezed.dart';

@JsonSerializable(createToJson: false, genericArgumentFactories: true)
class BaseResponse<T> {
  final T? data;
  final String? msg;
  final bool? success;

  bool get valid => (success ?? false);

  BaseResponse({this.msg, this.data, this.success});

  factory BaseResponse.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$BaseResponseFromJson(json, fromJsonT);
}
